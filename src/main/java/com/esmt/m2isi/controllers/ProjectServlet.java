package com.esmt.m2isi.controllers;

import com.esmt.m2isi.entities.Employee;
import com.esmt.m2isi.entities.Project;
import com.esmt.m2isi.services.EmployeeService;
import com.esmt.m2isi.services.ProjectService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "ProjectServlet", urlPatterns = {"/projects", "/project/add", "/project/edit", "/project/delete", "/project/assign"})
public class ProjectServlet extends HttpServlet {
    @EJB
    private ProjectService projectService;

    @EJB
    private EmployeeService employeeService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String path = request.getServletPath();

        if (path.equals("/projects")) {
            request.setAttribute("projects", projectService.findAllProjects());
            request.getRequestDispatcher("/views/project/list.jsp").forward(request, response);
        } else if (path.equals("/project/add")) {
            request.getRequestDispatcher("/views/project/add.jsp").forward(request, response);
        } else if (path.equals("/project/edit")) {
            Long id = Long.parseLong(request.getParameter("id"));
            request.setAttribute("project", projectService.findProjectById(id));
            request.getRequestDispatcher("/views/project/edit.jsp").forward(request, response);
        } else if (path.equals("/project/delete")) {
            Long id = Long.parseLong(request.getParameter("id"));
            projectService.deleteProject(id);
            response.sendRedirect(request.getContextPath() + "/projects");
        } else if (path.equals("/project/assign")) {
            Long projectId = Long.parseLong(request.getParameter("projectId"));
            request.setAttribute("project", projectService.findProjectById(projectId));
            request.setAttribute("employees", employeeService.findAllEmployees());
            request.getRequestDispatcher("/views/project/assign.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String path = request.getServletPath();

        if (path.equals("/project/add") || path.equals("/project/edit")) {
            String nom = request.getParameter("nom");
            String description = request.getParameter("description");
            String dateDebutStr = request.getParameter("dateDebut");
            String dateFinStr = request.getParameter("dateFin");
            String statut = request.getParameter("statut");

            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date dateDebut = sdf.parse(dateDebutStr);
                Date dateFin = sdf.parse(dateFinStr);

                if (path.equals("/project/add")) {
                    Project project = new Project(nom, description, dateDebut, dateFin, statut);
                    projectService.createProject(project);
                } else {
                    Long id = Long.parseLong(request.getParameter("id"));
                    Project project = projectService.findProjectById(id);
                    project.setNom(nom);
                    project.setDescription(description);
                    project.setDateDebut(dateDebut);
                    project.setDateFin(dateFin);
                    project.setStatut(statut);
                    projectService.updateProject(project);
                }
            } catch (ParseException e) {
                request.setAttribute("error", "Format de date invalide");
                request.getRequestDispatcher(path.equals("/project/add") ? "/views/project/add.jsp" : "/views/project/edit.jsp")
                    .forward(request, response);
                return;
            }

            response.sendRedirect(request.getContextPath() + "/projects");
        } else if (path.equals("/project/assign")) {
            Long projectId = Long.parseLong(request.getParameter("projectId"));
            Long employeeId = Long.parseLong(request.getParameter("employeeId"));

            Project project = projectService.findProjectById(projectId);
            Employee employee = employeeService.findEmployeeById(employeeId);

            projectService.assignEmployeeToProject(project, employee);
            response.sendRedirect(request.getContextPath() + "/project/assign?projectId=" + projectId);
        }
    }
}
