package com.esmt.m2isi.services;

import com.esmt.m2isi.dao.ProjectDao;
import com.esmt.m2isi.entities.Employee;
import com.esmt.m2isi.entities.Project;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import java.util.List;

@Stateless
public class ProjectService {
    @Inject
    private ProjectDao projectDao;

    public void createProject(Project project) {
        projectDao.create(project);
    }

    public Project updateProject(Project project) {
        return projectDao.update(project);
    }

    public void deleteProject(Long id) {
        projectDao.delete(id);
    }

    public Project findProjectById(Long id) {
        return projectDao.findById(id);
    }

    public List<Project> findAllProjects() {
        return projectDao.findAll();
    }

    public List<Project> findProjectsByStatus(String status) {
        return projectDao.findByStatus(status);
    }

    public void assignEmployeeToProject(Project project, Employee employee) {
        project.getEmployees().add(employee);
        projectDao.update(project);
    }

    public void removeEmployeeFromProject(Project project, Employee employee) {
        project.getEmployees().remove(employee);
        projectDao.update(project);
    }
}
