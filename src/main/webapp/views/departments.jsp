<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestion des Départements</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container mt-4">
    <h1 class="mb-4"><i class="bi bi-building"></i> Gestion des Départements</h1>

    <div class="d-flex justify-content-between mb-4">
        <a href="department/add" class="btn btn-primary">
            <i class="bi bi-plus-circle"></i> Ajouter un département
        </a>
        <span class="badge bg-info text-dark">
                <i class="bi bi-people-fill"></i> ${not empty departments ? departments.size() : 0} départements
            </span>
    </div>

    <c:if test="${not empty message}">
        <div class="alert alert-info">${message}</div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <div class="row">
        <c:forEach items="${departments}" var="department">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-header bg-primary text-white">
                        <h5 class="card-title">${department.nom}</h5>
                    </div>
                    <div class="card-body">
                        <p class="card-text">${department.description}</p>
                        <p class="text-muted">
                            <i class="bi bi-people"></i> ${department.employees.size()} employé(s)
                        </p>
                    </div>
                    <div class="card-footer bg-transparent">
                        <div class="btn-group" role="group">
                            <a href="department/edit?id=${department.id}" class="btn btn-sm btn-outline-warning">
                                <i class="bi bi-pencil-square"></i> Modifier
                            </a>
                            <a href="department/delete?id=${department.id}"
                               class="btn btn-sm btn-outline-danger"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce département ?')">
                                <i class="bi bi-trash"></i> Supprimer
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
