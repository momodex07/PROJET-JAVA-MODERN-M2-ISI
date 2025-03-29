package com.esmt.m2isi.dao;

import com.esmt.m2isi.entities.Department;
import com.esmt.m2isi.entities.Employee;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import java.util.List;

@ApplicationScoped
public class EmployeeDao {
    @PersistenceContext(unitName = "entreprisePU")
    private EntityManager em;

    public void create(Employee employee) {
        em.persist(employee);
    }

    public Employee update(Employee employee) {
        return em.merge(employee);
    }

    public void delete(Long id) {
        Employee employee = em.find(Employee.class, id);
        if (employee != null) {
            em.remove(employee);
        }
    }

    public Employee findById(Long id) {
        return em.find(Employee.class, id);
    }

    public List<Employee> findAll() {
        TypedQuery<Employee> query = em.createQuery("SELECT e FROM Employee e", Employee.class);
        return query.getResultList();
    }

    public List<Employee> findByDepartment(Department department) {
        TypedQuery<Employee> query = em.createQuery(
            "SELECT e FROM Employee e WHERE e.department = :department", Employee.class);
        query.setParameter("department", department);
        return query.getResultList();
    }

    public Employee findByEmail(String email) {
        TypedQuery<Employee> query = em.createQuery(
            "SELECT e FROM Employee e WHERE e.email = :email", Employee.class);
        query.setParameter("email", email);
        try {
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public List<Employee> search(String keyword) {
        TypedQuery<Employee> query = em.createQuery(
            "SELECT e FROM Employee e WHERE e.nom LIKE :keyword OR e.prenom LIKE :keyword OR e.email LIKE :keyword",
            Employee.class);
        query.setParameter("keyword", "%" + keyword + "%");
        return query.getResultList();
    }
}
