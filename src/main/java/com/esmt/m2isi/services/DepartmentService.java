package com.esmt.m2isi.services;

import com.esmt.m2isi.dao.DepartmentDao;
import com.esmt.m2isi.entities.Department;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import java.util.List;

@Stateless
public class DepartmentService {
    @Inject
    private DepartmentDao departmentDao;

    public void createDepartment(Department department) {
        departmentDao.create(department);
    }

    public Department updateDepartment(Department department) {
        return departmentDao.update(department);
    }

    public void deleteDepartment(Long id) {
        departmentDao.delete(id);
    }

    public Department findDepartmentById(Long id) {
        return departmentDao.findById(id);
    }

    public List<Department> findAllDepartments() {
        return departmentDao.findAll();
    }

    public Department findDepartmentByName(String name) {
        return departmentDao.findByName(name);
    }
}
