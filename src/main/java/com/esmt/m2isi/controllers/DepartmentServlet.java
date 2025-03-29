package com.esmt.m2isi.controllers;

import com.esmt.m2isi.entities.Department;
import com.esmt.m2isi.services.DepartmentService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DepartmentServlet", urlPatterns = {
    "/departments",
    "/department/add",
    "/department/edit",
    "/department/delete",

})
public class DepartmentServlet extends HttpServlet {
    @EJB
    private DepartmentService departmentService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String path = request.getServletPath();

        try {
            switch (path) {
                case "/departments":
                    handleListDepartments(request, response);
                    break;
                case "/department/add":
                    request.getRequestDispatcher("/views/department/add.jsp").forward(request, response);
                    break;
                case "/department/edit":
                    handleEditDepartmentForm(request, response);
                    break;
                case "/department/delete":
                    handleDeleteDepartment(request, response);
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
            if (path.equals("/department/add")) {
                handleAddDepartment(request, response);
            } else if (path.equals("/department/edit")) {
                handleUpdateDepartment(request, response);
            } else if (path.equals("/department/delete")) {
                handleConfirmDelete(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (Exception e) {
            handleError(request, response, e);
        }
    }

    private void handleListDepartments(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        List<Department> departments = departmentService.findAllDepartments();
        request.setAttribute("departments", departments);
        request.getRequestDispatcher("/views/department/list.jsp").forward(request, response);
    }

    private void handleEditDepartmentForm(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Department department = departmentService.findDepartmentById(id);
        request.setAttribute("department", department);
        request.getRequestDispatcher("/views/department/edit.jsp").forward(request, response);
    }

    private void handleViewDepartment(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Department department = departmentService.findDepartmentById(id);
        request.setAttribute("department", department);
        request.getRequestDispatcher("/views/department/view.jsp").forward(request, response);
    }

    private void handleDeleteDepartment(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        request.setAttribute("id", id);
        request.getRequestDispatcher("/views/department/delete.jsp").forward(request, response);
    }

    private void handleAddDepartment(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");
        Department department = new Department(nom, description);
        departmentService.createDepartment(department);
        response.sendRedirect(request.getContextPath() + "/departments");
    }

    private void handleUpdateDepartment(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");

        Department department = departmentService.findDepartmentById(id);
        department.setNom(nom);
        department.setDescription(description);

        departmentService.updateDepartment(department);
        response.sendRedirect(request.getContextPath() + "/departments");
    }

    private void handleConfirmDelete(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        departmentService.deleteDepartment(id);
        response.sendRedirect(request.getContextPath() + "/departments");
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response, Exception e)
        throws ServletException, IOException {
        System.err.println("❌ Erreur dans DepartmentServlet: " + e.getMessage());
        e.printStackTrace();
        request.setAttribute("error", "Une erreur est survenue: " + e.getMessage());
        request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
}
