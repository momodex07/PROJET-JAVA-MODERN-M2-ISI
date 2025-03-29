<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Assigner des employés au projet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container mt-4">
    <h1 class="mb-4">
        <i class="bi bi-person-plus"></i> Assigner des employés au projet: ${project.nom}
    </h1>

    <c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h5>Employés assignés</h5>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${not empty project.employees}">
                            <ul class="list-group">
                                <c:forEach items="${project.employees}" var="employee">
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                            ${employee.nom} ${employee.prenom}
                                        <span class="badge bg-primary rounded-pill">
                                                ${employee.department.nom}
                                        </span>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <div class="alert alert-warning">Aucun employé assigné à ce projet</div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h5>Assigner un nouvel employé</h5>
                </div>
                <div class="card-body">
                    <form action="project/assign" method="post">
                        <input type="hidden" name="projectId" value="${project.id}">

                        <div class="mb-3">
                            <label for="employeeId" class="form-label">Sélectionner un employé</label>
                            <select class="form-select" id="employeeId" name="employeeId" required>
                                <option value="">Choisir un employé...</option>
                                <c:forEach items="${employees}" var="employee">
                                    <option value="${employee.id}">
                                            ${employee.nom} ${employee.prenom} (${employee.department.nom})
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-person-plus"></i> Assigner
                        </button>
                        <a href="projects" class="btn btn-secondary">
                            <i class="bi bi-arrow-left"></i> Retour
                        </a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
