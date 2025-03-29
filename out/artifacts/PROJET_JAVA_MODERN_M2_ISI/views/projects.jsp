<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestion des Projets</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        .project-card {
            transition: transform 0.2s;
        }
        .project-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .status-badge {
            font-size: 0.9rem;
            padding: 0.35em 0.65em;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h1 class="mb-4"><i class="bi bi-clipboard2-check"></i> Gestion des Projets</h1>

    <div class="d-flex justify-content-between mb-4">
        <a href="project/add" class="btn btn-primary">
            <i class="bi bi-plus-circle"></i> Ajouter un projet
        </a>
        <div class="btn-group" role="group">
            <a href="projects?status=all" class="btn btn-outline-secondary">Tous</a>
            <a href="projects?status=En cours" class="btn btn-outline-primary">En cours</a>
            <a href="projects?status=Terminé" class="btn btn-outline-success">Terminés</a>
            <a href="projects?status=En attente" class="btn btn-outline-warning">En attente</a>
        </div>
    </div>

    <c:if test="${not empty message}">
        <div class="alert alert-info">${message}</div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <c:forEach items="${projects}" var="project">
            <div class="col">
                <div class="card h-100 project-card">
                    <div class="card-header">
                        <h5 class="card-title mb-0">${project.nom}</h5>
                    </div>
                    <div class="card-body">
                        <p class="card-text">${project.description}</p>
                        <div class="mb-3">
                                <span class="status-badge badge
                                    <c:choose>
                                        <c:when test="${project.statut == 'En cours'}">bg-primary</c:when>
                                        <c:when test="${project.statut == 'Terminé'}">bg-success</c:when>
                                        <c:otherwise>bg-warning text-dark</c:otherwise>
                                    </c:choose>">
                                        ${project.statut}
                                </span>
                        </div>
                        <ul class="list-group list-group-flush mb-3">
                            <li class="list-group-item">
                                <i class="bi bi-calendar"></i> Début:
                                <fmt:formatDate value="${project.dateDebut}" pattern="dd/MM/yyyy" />
                            </li>
                            <li class="list-group-item">
                                <i class="bi bi-calendar-check"></i> Fin:
                                <fmt:formatDate value="${project.dateFin}" pattern="dd/MM/yyyy" />
                            </li>
                            <li class="list-group-item">
                                <i class="bi bi-people"></i> ${project.employees.size()} membre(s)
                            </li>
                            <li class="list-group-item">
                                <i class="bi bi-list-task"></i> ${project.tasks.size()} tâche(s)
                            </li>
                        </ul>
                    </div>
                    <div class="card-footer bg-transparent">
                        <div class="d-flex justify-content-between">
                            <a href="project/assign?projectId=${project.id}" class="btn btn-sm btn-outline-info">
                                <i class="bi bi-person-plus"></i>
                            </a>
                            <div>
                                <a href="project/edit?id=${project.id}" class="btn btn-sm btn-outline-warning">
                                    <i class="bi bi-pencil-square"></i>
                                </a>
                                <a href="project/delete?id=${project.id}"
                                   class="btn btn-sm btn-outline-danger"
                                   onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce projet ?')">
                                    <i class="bi bi-trash"></i>
                                </a>
                            </div>
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
