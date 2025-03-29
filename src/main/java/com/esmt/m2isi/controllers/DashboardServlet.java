package com.esmt.m2isi.controllers;

import com.esmt.m2isi.entities.Project;
import com.esmt.m2isi.services.DepartmentService;
import com.esmt.m2isi.services.EmployeeService;
import com.esmt.m2isi.services.ProjectService;
import com.esmt.m2isi.services.TaskService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "DashboardServlet", urlPatterns = {"/dashboard"})
public class DashboardServlet extends HttpServlet {
    @EJB
    private EmployeeService employeeService;

    @EJB
    private ProjectService projectService;

    @EJB
    private TaskService taskService;

    @EJB
    private DepartmentService departmentService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        // Counts
        request.setAttribute("employeeCount", employeeService.findAllEmployees().size());
        request.setAttribute("projectCount", projectService.findAllProjects().size());
        request.setAttribute("taskCount", taskService.findAllTasks().size());
        request.setAttribute("departmentCount", departmentService.findAllDepartments().size());


        // Project status counts
        List<Project> projects = projectService.findAllProjects();
        int[] projectStatusCount = new int[3]; // 0: En cours, 1: Terminé, 2: En attente
        for (Project project : projects) {
            switch (project.getStatut()) {
                case "En cours": projectStatusCount[0]++; break;
                case "Terminé": projectStatusCount[1]++; break;
                default: projectStatusCount[2]++; break;
            }
        }
        request.setAttribute("projectStatusCount", projectStatusCount);

        // Employees by department
        Map<String, Integer> employeeByDepartment = new HashMap<>();
        departmentService.findAllDepartments().forEach(dept -> {
            int count = employeeService.findEmployeesByDepartment(dept).size();
            employeeByDepartment.put(dept.getNom(), count);
        });
        request.setAttribute("employeeByDepartment", employeeByDepartment);

        request.getRequestDispatcher("/views/dashboard.jsp").forward(request, response);
    }
}
