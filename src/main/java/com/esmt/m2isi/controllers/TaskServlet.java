package com.esmt.m2isi.controllers;

import com.esmt.m2isi.entities.*;
import com.esmt.m2isi.services.*;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "TaskServlet", urlPatterns = {
    "/tasks",
    "/task/add",
    "/task/edit",
    "/task/delete",
    "/task/view"
})
public class TaskServlet extends HttpServlet {
    @EJB
    private TaskService taskService;

    @EJB
    private EmployeeService employeeService;

    @EJB
    private ProjectService projectService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String path = request.getServletPath();

        try {
            switch (path) {
                case "/tasks":
                    handleListTasks(request, response);
                    break;
                case "/task/add":
                    handleAddTaskForm(request, response);
                    break;
                case "/task/edit":
                    handleEditTaskForm(request, response);
                    break;
                case "/task/delete":
                    handleDeleteTask(request, response);
                    break;
                case "/task/view":
                    handleViewTask(request, response);
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
            if (path.equals("/task/add")) {
                handleAddTask(request, response);
            } else if (path.equals("/task/edit")) {
                handleUpdateTask(request, response);
            } else if (path.equals("/task/delete")) {
                handleConfirmDelete(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (Exception e) {
            handleError(request, response, e);
        }
    }

    private void handleListTasks(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setAttribute("tasks", taskService.findAllTasks());
        request.getRequestDispatcher("/views/task/tasks.jsp").forward(request, response);
    }

    private void handleAddTaskForm(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setAttribute("employees", employeeService.findAllEmployees());
        request.setAttribute("projects", projectService.findAllProjects());
        request.getRequestDispatcher("/views/task/add.jsp").forward(request, response);
    }

    private void handleEditTaskForm(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Task task = taskService.findTaskById(id);

        request.setAttribute("task", task);
        request.setAttribute("employees", employeeService.findAllEmployees());
        request.setAttribute("projects", projectService.findAllProjects());
        request.getRequestDispatcher("/views/task/edit.jsp").forward(request, response);
    }

    private void handleViewTask(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Task task = taskService.findTaskById(id);
        request.setAttribute("task", task);
        request.getRequestDispatcher("/views/task/view.jsp").forward(request, response);
    }

    private void handleDeleteTask(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        request.setAttribute("id", id);
        request.getRequestDispatcher("/views/task/delete.jsp").forward(request, response);
    }

    private void handleAddTask(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String description = request.getParameter("description");
        String statut = request.getParameter("statut");
        Long employeeId = Long.parseLong(request.getParameter("employeeId"));
        Long projectId = Long.parseLong(request.getParameter("projectId"));
        String dateCreation = request.getParameter("dateCreation");
        String dateEcheance = request.getParameter("dateEcheance");

        Employee employee = employeeService.findEmployeeById(employeeId);
        Project project = projectService.findProjectById(projectId);

        Task task = new Task();
        task.setDescription(description);
        task.setStatut(statut);
        task.setEmployee(employee);
        task.setProject(project);
        task.setDateCreation(java.sql.Date.valueOf(dateCreation));
        task.setDateEcheance(java.sql.Date.valueOf(dateEcheance));

        taskService.createTask(task);
        response.sendRedirect(request.getContextPath() + "/tasks");
    }

    private void handleUpdateTask(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        String description = request.getParameter("description");
        String statut = request.getParameter("statut");
        Long employeeId = Long.parseLong(request.getParameter("employeeId"));
        Long projectId = Long.parseLong(request.getParameter("projectId"));
        String dateCreation = request.getParameter("dateCreation");
        String dateEcheance = request.getParameter("dateEcheance");

        Employee employee = employeeService.findEmployeeById(employeeId);
        Project project = projectService.findProjectById(projectId);
        Task task = taskService.findTaskById(id);

        task.setDescription(description);
        task.setStatut(statut);
        task.setEmployee(employee);
        task.setProject(project);
        task.setDateCreation(java.sql.Date.valueOf(dateCreation));
        task.setDateEcheance(java.sql.Date.valueOf(dateEcheance));

        taskService.updateTask(task);
        response.sendRedirect(request.getContextPath() + "/tasks");
    }

    private void handleConfirmDelete(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        taskService.deleteTask(id);
        response.sendRedirect(request.getContextPath() + "/tasks");
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response, Exception e)
        throws ServletException, IOException {
        System.err.println("❌ Erreur dans TaskServlet: " + e.getMessage());
        e.printStackTrace();
        request.setAttribute("error", "Une erreur est survenue: " + e.getMessage());
        request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
}
