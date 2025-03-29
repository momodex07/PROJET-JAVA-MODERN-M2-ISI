<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestion des Employés</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container mt-4">
    <h1 class="mb-4"><i class="bi bi-people-fill"></i> Gestion des Employés</h1>

    <div class="d-flex justify-content-between mb-4">
        <a href="${pageContext.request.contextPath}/employee/add" class="btn btn-primary">
            <i class="bi bi-plus-circle"></i> Ajouter un employé
        </a>
        <a href="export/employees/pdf" class="btn btn-success">
            <i class="bi bi-file-earmark-pdf"></i> Exporter en PDF
        </a>
    </div>

    <c:if test="${not empty message}">
        <div class="alert alert-info">${message}</div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <table class="table table-striped table-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Email</th>
            <th>Département</th>
            <th>Rôle</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${employees}" var="employee">
            <tr>
                <td>${employee.id}</td>
                <td>${employee.nom}</td>
                <td>${employee.prenom}</td>
                <td>${employee.email}</td>
                <td>${employee.department.nom}</td>
                <td>
                            <span class="badge
                                <c:choose>
                                    <c:when test="${employee.role == 'admin'}">bg-danger</c:when>
                                    <c:when test="${employee.role == 'manager'}">bg-warning text-dark</c:when>
                                    <c:otherwise>bg-primary</c:otherwise>
                                </c:choose>">
                                    ${employee.role}
                            </span>
                </td>
                <td>
                    <div class="btn-group" role="group">
                        <a href="employee/edit?id=${employee.id}" class="btn btn-sm btn-outline-warning">
                            <i class="bi bi-pencil-square"></i>
                        </a>
                        <a href="employee/delete?id=${employee.id}"
                           class="btn btn-sm btn-outline-danger"
                           onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet employé ?')">
                            <i class="bi bi-trash"></i>
                        </a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
