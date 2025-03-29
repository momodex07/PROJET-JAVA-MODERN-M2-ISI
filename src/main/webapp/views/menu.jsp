<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="list-group">
    <a href="dashboard" class="list-group-item list-group-item-action ${activePage == 'dashboard' ? 'active' : ''}">
        <i class="bi bi-speedometer2"></i> Tableau de bord
    </a>
    <a href="employees" class="list-group-item list-group-item-action ${activePage == 'employees' ? 'active' : ''}">
        <i class="bi bi-people-fill"></i> Employés
    </a>
    <a href="departments" class="list-group-item list-group-item-action ${activePage == 'departments' ? 'active' : ''}">
        <i class="bi bi-building"></i> Départements
    </a>
    <a href="projects" class="list-group-item list-group-item-action ${activePage == 'projects' ? 'active' : ''}">
        <i class="bi bi-clipboard2-check"></i> Projets
    </a>
    <a href="tasks" class="list-group-item list-group-item-action ${activePage == 'tasks' ? 'active' : ''}">
        <i class="bi bi-list-check"></i> Tâches
    </a>
</div>
