package com.esmt.m2isi.controllers;

import com.esmt.m2isi.entities.Department;
import com.esmt.m2isi.entities.Employee;
import com.esmt.m2isi.services.DepartmentService;
import com.esmt.m2isi.services.EmployeeService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = {
    "/employees",
    "/employee/add",
    "/employee/edit",
    "/employee/delete",
    "/employee/view"
})
public class EmployeeServlet extends HttpServlet {
    @EJB
    private EmployeeService employeeService;

    @EJB
    private DepartmentService departmentService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String path = request.getServletPath();

        try {
            switch (path) {
                case "/employees":
                    handleListEmployees(request, response);
                    break;
                case "/employee/add":
                    handleAddEmployeeForm(request, response);
                    break;
                case "/employee/edit":
                    handleEditEmployeeForm(request, response);
                    break;
                case "/employee/delete":
                    handleDeleteEmployee(request, response);
                    break;
                case "/employee/view":
                    handleViewEmployee(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (Exception e) {
            handleError(request, response, e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String path = request.getServletPath();

        try {
            if (path.equals("/employee/add")) {
                handleAddEmployee(request, response);
            } else if (path.equals("/employee/edit")) {
                handleUpdateEmployee(request, response);
            } else if (path.equals("/employee/delete")) {
                handleConfirmDelete(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (Exception e) {
            handleError(request, response, e);
        }
    }

    private void handleListEmployees(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        List<Employee> employees = employeeService.findAllEmployees();
        request.setAttribute("employees", employees);
        request.getRequestDispatcher("/views/employee/list.jsp").forward(request, response);
    }

    private void handleAddEmployeeForm(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        List<Department> departments = departmentService.findAllDepartments();
        request.setAttribute("departments", departments);
        request.getRequestDispatcher("/views/employee/add.jsp").forward(request, response);
    }

    private void handleEditEmployeeForm(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Employee employee = employeeService.findEmployeeById(id);
        List<Department> departments = departmentService.findAllDepartments();

        request.setAttribute("employee", employee);
        request.setAttribute("departments", departments);
        request.getRequestDispatcher("/views/employee/edit.jsp").forward(request, response);
    }

    private void handleViewEmployee(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Employee employee = employeeService.findEmployeeById(id);
        request.setAttribute("employee", employee);
        request.getRequestDispatcher("/views/employee/view.jsp").forward(request, response);
    }

    private void handleDeleteEmployee(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        request.setAttribute("id", id);
        request.getRequestDispatcher("/views/employee/delete.jsp").forward(request, response);
    }

    private void handleAddEmployee(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        String password = request.getParameter("password");
        Long departmentId = Long.parseLong(request.getParameter("departmentId"));

        Department department = departmentService.findDepartmentById(departmentId);
        Employee employee = new Employee(nom, prenom, email, department, role, password);

        employeeService.createEmployee(employee);
        response.sendRedirect(request.getContextPath() + "/employees");
    }

    private void handleUpdateEmployee(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        String password = request.getParameter("password");
        Long departmentId = Long.parseLong(request.getParameter("departmentId"));

        Department department = departmentService.findDepartmentById(departmentId);
        Employee employee = employeeService.findEmployeeById(id);

        employee.setNom(nom);
        employee.setPrenom(prenom);
        employee.setEmail(email);
        employee.setRole(role);
        employee.setPassword(password);
        employee.setDepartment(department);

        employeeService.updateEmployee(employee);
        response.sendRedirect(request.getContextPath() + "/employees");
    }

    private void handleConfirmDelete(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        employeeService.deleteEmployee(id);
        response.sendRedirect(request.getContextPath() + "/employees");
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response, Exception e)
        throws ServletException, IOException {
        System.err.println("❌ Erreur dans EmployeeServlet: " + e.getMessage());
        e.printStackTrace();
        request.setAttribute("error", "Une erreur est survenue: " + e.getMessage());
        request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
}
