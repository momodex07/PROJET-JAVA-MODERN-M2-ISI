<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Tâches</title>
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --success-color: #2ec4b6;
            --info-color: #3a86ff;
            --warning-color: #ff9f1c;
            --danger-color: #dc3545;
            --light-bg: #f8f9fa;
            --card-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --header-bg: #f1f5fd;
        }

        body {
            background-color: var(--light-bg);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .dashboard-header {
            background-color: var(--header-bg);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 25px;
            box-shadow: var(--card-shadow);
        }

        .task-card {
            border-radius: 12px;
            border: none;
            box-shadow: var(--card-shadow);
            transition: all 0.25s ease;
            height: 100%;
            position: relative;
            overflow: hidden;
        }

        .task-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .status-accent {
            position: absolute;
            top: 0;
            left: 0;
            width: 6px;
            height: 100%;
        }

        .status-en-cours {
            background-color: var(--primary-color);
        }

        .status-termine {
            background-color: var(--success-color);
        }

        .status-en-attente {
            background-color: var(--warning-color);
        }

        .task-card .card-header {
            background-color: transparent;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            padding: 15px 20px;
        }

        .task-card .card-body {
            padding: 20px;
        }

        .task-card .card-footer {
            background-color: transparent;
            border-top: 1px solid rgba(0, 0, 0, 0.05);
            padding: 15px 20px;
        }

        .badge {
            padding: 6px 12px;
            font-size: 0.75rem;
            font-weight: 500;
            border-radius: 50px;
        }

        .badge-en-cours {
            background-color: var(--primary-color);
            color: white;
        }

        .badge-termine {
            background-color: var(--success-color);
            color: white;
        }

        .badge-en-attente {
            background-color: var(--warning-color);
            color: #212529;
        }

        .task-info-list {
            margin: 15px 0;
            padding: 0;
            list-style: none;
        }

        .task-info-item {
            padding: 10px 0;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            display: flex;
            align-items: center;
        }

        .task-info-item:last-child {
            border-bottom: none;
        }

        .task-info-item i {
            margin-right: 10px;
            color: var(--primary-color);
            font-size: 1.1rem;
        }

        .action-btn {
            border-radius: 8px;
            padding: 7px 12px;
            transition: all 0.2s;
        }

        .action-btn:hover {
            transform: translateY(-2px);
        }

        .filter-btn-group .btn {
            border-radius: 8px;
            font-weight: 500;
            padding: 8px 15px;
        }

        .filter-btn-group .btn:not(:last-child) {
            margin-right: 5px;
        }

        .add-task-btn {
            background: linear-gradient(45deg, var(--primary-color), var(--info-color));
            border: none;
            color: white;
            font-weight: 500;
            padding: 10px 20px;
            border-radius: 8px;
            transition: all 0.25s;
        }

        .add-task-btn:hover {
            box-shadow: 0 4px 12px rgba(67, 97, 238, 0.3);
            transform: translateY(-2px);
        }

        .task-card .card-title {
            font-weight: 600;
            font-size: 1.1rem;
            line-height: 1.3;
            margin-bottom: 0;
        }

        .project-name {
            font-weight: 600;
            color: var(--primary-color);
        }

        .employee-name {
            font-weight: 500;
            color: #495057;
        }

        .empty-state {
            text-align: center;
            padding: 60px 0;
            background-color: white;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
        }

        .empty-state i {
            font-size: 3.5rem;
            color: #ced4da;
            margin-bottom: 20px;
        }

        .empty-state h4 {
            color: #6c757d;
            margin-bottom: 10px;
        }

        .empty-state p {
            color: #adb5bd;
            max-width: 500px;
            margin: 0 auto 20px;
        }
    </style>
</head>
<body>
<div class="container-fluid py-4 px-4">
    <!-- Header Section -->
    <div class="dashboard-header d-flex justify-content-between align-items-center">
        <div>
            <h1 class="fs-2 fw-bold mb-0"><i class="bi bi-list-check me-2"></i>Gestion des Tâches</h1>
            <p class="text-muted mb-0">Organisez et suivez l'avancement de vos tâches</p>
        </div>
        <div class="d-flex">
            <div class="filter-btn-group me-3">
                <a href="tasks?status=all" class="btn btn-outline-secondary ${param.status == null || param.status == 'all' ? 'active' : ''}">
                    <i class="bi bi-grid-3x3-gap-fill me-1"></i> Toutes
                </a>
                <a href="tasks?status=En cours" class="btn btn-outline-primary ${param.status == 'En cours' ? 'active' : ''}">
                    <i class="bi bi-play-circle me-1"></i> En cours
                </a>
                <a href="tasks?status=Terminé" class="btn btn-outline-success ${param.status == 'Terminé' ? 'active' : ''}">
                    <i class="bi bi-check-circle me-1"></i> Terminées
                </a>
                <a href="tasks?status=En attente" class="btn btn-outline-warning ${param.status == 'En attente' ? 'active' : ''}">
                    <i class="bi bi-clock me-1"></i> En attente
                </a>
            </div>
            <a href="task/add" class="add-task-btn">
                <i class="bi bi-plus-circle me-2"></i>Nouvelle Tâche
            </a>
        </div>
    </div>

    <!-- Alerts Section -->
    <c:if test="${not empty message}">
        <div class="alert alert-info alert-dismissible fade show" role="alert">
            <i class="bi bi-info-circle me-2"></i> ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="bi bi-exclamation-triangle me-2"></i> ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <!-- Tasks Grid -->
    <div class="row g-4 mb-4">
        <c:choose>
            <c:when test="${not empty tasks}">
                <c:forEach items="${tasks}" var="task">
                    <div class="col-md-6 col-lg-4">
                        <div class="task-card">
                            <div class="status-accent
                                    <c:choose>
                                        <c:when test="${task.statut == 'En cours'}">status-en-cours</c:when>
                                        <c:when test="${task.statut == 'Terminé'}">status-termine</c:when>
                                        <c:otherwise>status-en-attente</c:otherwise>
                                    </c:choose>">
                            </div>
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h5 class="card-title">${task.description}</h5>
                                <span class="badge
                                        <c:choose>
                                            <c:when test="${task.statut == 'En cours'}">badge-en-cours</c:when>
                                            <c:when test="${task.statut == 'Terminé'}">badge-termine</c:when>
                                            <c:otherwise>badge-en-attente</c:otherwise>
                                        </c:choose>">
                                        <c:choose>
                                            <c:when test="${task.statut == 'En cours'}"><i class="bi bi-play-fill me-1"></i></c:when>
                                            <c:when test="${task.statut == 'Terminé'}"><i class="bi bi-check-lg me-1"></i></c:when>
                                            <c:otherwise><i class="bi bi-clock me-1"></i></c:otherwise>
                                        </c:choose>
                                        ${task.statut}
                                    </span>
                            </div>
                            <div class="card-body pb-2">
                                <div class="mb-2">
                                    <span class="text-muted">Projet:</span>
                                    <span class="project-name ms-1">${task.project.nom}</span>
                                </div>
                                <div class="mb-3">
                                    <span class="text-muted">Assignée à:</span>
                                    <span class="employee-name ms-1">${task.employee.nom} ${task.employee.prenom}</span>
                                </div>

                                <ul class="task-info-list">
                                    <li class="task-info-item">
                                        <i class="bi bi-calendar-date"></i>
                                        <div>
                                            <small class="text-muted d-block">Créée le</small>
                                            <fmt:formatDate value="${task.dateCreation}" pattern="dd MMMM yyyy" />
                                        </div>
                                    </li>
                                    <li class="task-info-item">
                                        <i class="bi bi-alarm"></i>
                                        <div>
                                            <small class="text-muted d-block">Échéance</small>
                                            <fmt:formatDate value="${task.dateEcheance}" pattern="dd MMMM yyyy" />
                                            <c:set var="now" value="<%= new java.util.Date() %>" />
                                            <c:if test="${task.dateEcheance.time < now.time && task.statut != 'Terminé'}">
                                                <span class="badge bg-danger ms-2">En retard</span>
                                            </c:if>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="card-footer">
                                <div class="d-flex justify-content-end">
                                    <a href="task/edit?id=${task.id}" class="action-btn btn btn-sm btn-outline-warning me-2" title="Modifier">
                                        <i class="bi bi-pencil-square"></i>
                                    </a>
                                    <a href="task/delete?id=${task.id}"
                                       class="action-btn btn btn-sm btn-outline-danger"
                                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette tâche ?')"
                                       title="Supprimer">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="col-12">
                    <div class="empty-state">
                        <i class="bi bi-clipboard-x"></i>
                        <h4>Aucune tâche trouvée</h4>
                        <p>Il n'y a actuellement aucune tâche correspondant à vos critères de recherche.</p>
                        <a href="task/add" class="add-task-btn">
                            <i class="bi bi-plus-circle me-2"></i>Créer une nouvelle tâche
                        </a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
