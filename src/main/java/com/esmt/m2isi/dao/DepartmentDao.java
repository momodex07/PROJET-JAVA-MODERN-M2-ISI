package com.esmt.m2isi.dao;

import com.esmt.m2isi.entities.Department;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

import java.util.List;

@ApplicationScoped
public class DepartmentDao {
    @PersistenceContext(unitName = "entreprisePU")
    private EntityManager em;

    public void create(Department department) {
        em.persist(department);
    }

    public Department update(Department department) {
        return em.merge(department);
    }

    public void delete(Long id) {
        Department department = em.find(Department.class, id);
        if (department != null) {
            em.remove(department);
        }
    }

    public Department findById(Long id) {
        return em.find(Department.class, id);
    }

    public List<Department> findAll() {
        TypedQuery<Department> query = em.createQuery("SELECT d FROM Department d", Department.class);
        return query.getResultList();
    }

    public Department findByName(String name) {
        TypedQuery<Department> query = em.createQuery(
            "SELECT d FROM Department d WHERE d.nom = :name", Department.class);
        query.setParameter("name", name);
        try {
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
}
