package com.esmt.m2isi.services;

import com.esmt.m2isi.dao.EmployeeDao;
import com.esmt.m2isi.entities.Department;
import com.esmt.m2isi.entities.Employee;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import java.util.List;

@Stateless
public class EmployeeService {
    @Inject
    private EmployeeDao employeeDao;

    public void createEmployee(Employee employee) {
        employeeDao.create(employee);
    }

    public Employee updateEmployee(Employee employee) {
        return employeeDao.update(employee);
    }

    public void deleteEmployee(Long id) {
        employeeDao.delete(id);
    }

    public Employee findEmployeeById(Long id) {
        return employeeDao.findById(id);
    }

    public List<Employee> findAllEmployees() {
        return employeeDao.findAll();
    }

    public List<Employee> findEmployeesByDepartment(Department department) {
        return employeeDao.findByDepartment(department);
    }

    public Employee findEmployeeByEmail(String email) {
        return employeeDao.findByEmail(email);
    }

    public List<Employee> searchEmployees(String keyword) {
        return employeeDao.search(keyword);
    }
}
