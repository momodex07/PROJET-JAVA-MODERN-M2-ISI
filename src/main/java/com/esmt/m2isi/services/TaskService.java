package com.esmt.m2isi.services;

import com.esmt.m2isi.dao.TaskDao;
import com.esmt.m2isi.entities.Employee;
import com.esmt.m2isi.entities.Project;
import com.esmt.m2isi.entities.Task;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import java.util.List;

@Stateless
public class TaskService {
    @Inject
    private TaskDao taskDao;

    public void createTask(Task task) {
        taskDao.create(task);
    }

    public Task updateTask(Task task) {
        return taskDao.update(task);
    }

    public void deleteTask(Long id) {
        taskDao.delete(id);
    }

    public Task findTaskById(Long id) {
        return taskDao.findById(id);
    }

    public List<Task> findAllTasks() {
        return taskDao.findAll();
    }

    public List<Task> findTasksByEmployee(Employee employee) {
        return taskDao.findByEmployee(employee);
    }

    public List<Task> findTasksByProject(Project project) {
        return taskDao.findByProject(project);
    }

    public List<Task> findTasksByStatus(String status) {
        return taskDao.findByStatus(status);
    }
}
