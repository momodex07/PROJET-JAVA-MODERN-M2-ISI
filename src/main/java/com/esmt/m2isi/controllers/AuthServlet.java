package com.esmt.m2isi.controllers;

import com.esmt.m2isi.entities.Employee;
import com.esmt.m2isi.services.EmployeeService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "AuthServlet", urlPatterns = {"/login", "/logout", "/change-password"})
public class AuthServlet extends HttpServlet {
    @EJB
    private EmployeeService employeeService;
    private static final Logger LOGGER = Logger.getLogger(AuthServlet.class.getName());

    @Override
    public void init() throws ServletException {
        System.out.println("🚀 AuthServlet chargé avec succès !");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String path = request.getServletPath();

        if (path.equals("/logout")) {
            request.getSession().invalidate();
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        if (path.equals("/change-password")) {
            if (!isUserAuthenticated(request)) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }
            request.getRequestDispatcher("/views/auth/change-password.jsp").forward(request, response);
            return;
        }

        if (isUserAuthenticated(request)) {
            redirectBasedOnRole(request, response);
            return;
        }

        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            System.out.println("Tentative de connexion : " + email); // Log

            Employee employee = employeeService.findEmployeeByEmail(email);

            if (employee != null && employee.getPassword().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("employee", employee);
                response.sendRedirect(request.getContextPath() + "/dashboard");
            } else {
                request.setAttribute("error", "Email ou mot de passe incorrect");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
                request.setAttribute("error", "Email et mot de passe sont requis");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }

            Employee employee = employeeService.findEmployeeByEmail(email.trim());

            if (employee != null && employee.getPassword().equals(password)) {
                // Créer la session
                HttpSession session = request.getSession();
                session.setAttribute("employee", employee);

                // Journaliser la connexion
                LOGGER.log(Level.INFO, "Utilisateur connecté: {0}", email);

                // Redirection basée sur le rôle
                redirectBasedOnRole(request, response);
            } else {
                // Journaliser la tentative échouée
                LOGGER.log(Level.WARNING, "Tentative de connexion échouée pour: {0}", email);
                request.setAttribute("error", "Email ou mot de passe incorrect");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Erreur lors de l'authentification", e);
            request.setAttribute("error", "Une erreur est survenue lors de l'authentification");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    private void handlePasswordChange(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("employee") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        Employee employee = (Employee) session.getAttribute("employee");

        try {
            // Validation des champs
            if (currentPassword == null || newPassword == null || confirmPassword == null ||
                currentPassword.isEmpty() || newPassword.isEmpty() || confirmPassword.isEmpty()) {
                request.setAttribute("error", "Tous les champs sont requis");
                request.getRequestDispatcher("/views/auth/change-password.jsp").forward(request, response);
                return;
            }

            if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("error", "Les nouveaux mots de passe ne correspondent pas");
                request.getRequestDispatcher("/views/auth/change-password.jsp").forward(request, response);
                return;
            }

            if (!employee.getPassword().equals(currentPassword)) {
                request.setAttribute("error", "Mot de passe actuel incorrect");
                request.getRequestDispatcher("/views/auth/change-password.jsp").forward(request, response);
                return;
            }

            // Mettre à jour le mot de passe
            employee.setPassword(newPassword);
            employeeService.updateEmployee(employee);

            // Journaliser le changement
            LOGGER.log(Level.INFO, "Mot de passe changé pour l'utilisateur: {0}", employee.getEmail());

            request.setAttribute("success", "Mot de passe changé avec succès");
            request.getRequestDispatcher("/views/auth/change-password.jsp").forward(request, response);

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Erreur lors du changement de mot de passe", e);
            request.setAttribute("error", "Une erreur est survenue lors du changement de mot de passe");
            request.getRequestDispatcher("/views/auth/change-password.jsp").forward(request, response);
        }
    }

    private boolean isUserAuthenticated(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && session.getAttribute("employee") != null;
    }

    private void redirectBasedOnRole(HttpServletRequest request, HttpServletResponse response)
        throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("employee") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        Employee employee = (Employee) session.getAttribute("employee");
        String contextPath = request.getContextPath();

        switch (employee.getRole()) {
            case "admin":
                response.sendRedirect(contextPath + "/dashboard");
                break;
            case "manager":
                response.sendRedirect(contextPath + "/projects");
                break;
            default:
                response.sendRedirect(contextPath + "/tasks");
                break;
        }
    }
}
