package com.esmt.m2isi.dao;

import com.esmt.m2isi.entities.Project;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import java.util.List;

@ApplicationScoped
public class ProjectDao {
    @PersistenceContext(unitName = "entreprisePU")
    private EntityManager em;

    public void create(Project project) {
        em.persist(project);
    }

    public Project update(Project project) {
        return em.merge(project);
    }

    public void delete(Long id) {
        Project project = em.find(Project.class, id);
        if (project != null) {
            em.remove(project);
        }
    }

    public Project findById(Long id) {
        return em.find(Project.class, id);
    }

    public List<Project> findAll() {
        TypedQuery<Project> query = em.createQuery("SELECT p FROM Project p", Project.class);
        return query.getResultList();
    }

    public List<Project> findByStatus(String status) {
        TypedQuery<Project> query = em.createQuery(
            "SELECT p FROM Project p WHERE p.statut = :status", Project.class);
        query.setParameter("status", status);
        return query.getResultList();
    }
}
