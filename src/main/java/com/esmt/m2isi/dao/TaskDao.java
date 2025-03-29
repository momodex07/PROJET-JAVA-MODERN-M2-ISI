package com.esmt.m2isi.dao;

import com.esmt.m2isi.entities.Employee;
import com.esmt.m2isi.entities.Project;
import com.esmt.m2isi.entities.Task;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import java.util.List;

@ApplicationScoped
public class TaskDao {
    @PersistenceContext(unitName = "entreprisePU")
    private EntityManager em;

    public void create(Task task) {
        em.persist(task);
    }

    public Task update(Task task) {
        return em.merge(task);
    }

    public void delete(Long id) {
        Task task = em.find(Task.class, id);
        if (task != null) {
            em.remove(task);
        }
    }

    public Task findById(Long id) {
        return em.find(Task.class, id);
    }

    public List<Task> findAll() {
        TypedQuery<Task> query = em.createQuery("SELECT t FROM Task t", Task.class);
        return query.getResultList();
    }

    public List<Task> findByEmployee(Employee employee) {
        TypedQuery<Task> query = em.createQuery(
            "SELECT t FROM Task t WHERE t.employee = :employee", Task.class);
        query.setParameter("employee", employee);
        return query.getResultList();
    }

    public List<Task> findByProject(Project project) {
        TypedQuery<Task> query = em.createQuery(
            "SELECT t FROM Task t WHERE t.project = :project", Task.class);
        query.setParameter("project", project);
        return query.getResultList();
    }

    public List<Task> findByStatus(String status) {
        TypedQuery<Task> query = em.createQuery(
            "SELECT t FROM Task t WHERE t.statut = :status", Task.class);
        query.setParameter("status", status);
        return query.getResultList();
    }
}
