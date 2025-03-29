<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Détails de l'Employé</title>
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

        .details-header {
            background-color: var(--header-bg);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 25px;
            box-shadow: var(--card-shadow);
        }

        .details-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            padding: 25px;
            margin-bottom: 25px;
        }

        .profile-section {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .profile-avatar {
            width: 100px;
            height: 100px;
            background-color: var(--primary-color);
            border-radius: 50%;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            margin-right: 25px;
        }

        .profile-info h2 {
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .profile-info .employee-role {
            font-size: 1rem;
            color: #6c757d;
        }

        .detail-label {
            font-weight: 600;
            color: #495057;
        }

        .detail-value {
            color: #212529;
        }

        .detail-row {
            padding: 12px 0;
            border-bottom: 1px solid #e9ecef;
        }

        .detail-row:last-child {
            border-bottom: none;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            margin-bottom: 25px;
        }

        .card-header {
            background-color: #fff;
            border-bottom: 1px solid #e9ecef;
            padding: 15px 20px;
            font-weight: 600;
            border-radius: 12px 12px 0 0 !important;
        }

        .card-header h5 {
            margin: 0;
            font-size: 1.1rem;
            color: var(--primary-color);
        }

        .card-body {
            padding: 20px;
        }

        .table {
            margin-bottom: 0;
        }

        .table thead th {
            border-top: none;
            border-bottom-width: 1px;
            font-weight: 600;
            color: #495057;
        }

        .btn {
            border-radius: 8px;
            padding: 8px 20px;
            font-weight: 500;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-primary:hover {
            background-color: #3a56d4;
            border-color: #3a56d4;
        }

        .btn-warning {
            background-color: var(--warning-color);
            border-color: var(--warning-color);
        }

        .btn-warning:hover {
            background-color: #e58e18;
            border-color: #e58e18;
        }

        .btn-danger {
            background-color: var(--danger-color);
            border-color: var(--danger-color);
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .badge {
            padding: 6px 10px;
            font-weight: 500;
            border-radius: 6px;
        }

        .status-badge {
            padding: 6px 10px;
            border-radius: 6px;
            font-weight: 500;
        }

        .admin-badge {
            background-color: var(--danger-color);
        }

        .manager-badge {
            background-color: var(--warning-color);
            color: #212529 !important;
        }

        .employee-badge {
            background-color: var(--primary-color);
        }

        .quick-actions .btn {
            margin-right: 10px;
        }

        .alert {
            border-radius: 8px;
            padding: 15px;
        }

        .alert-info {
            background-color: rgba(58, 134, 255, 0.1);
            border-color: rgba(58, 134, 255, 0.2);
            color: var(--info-color);
        }
    </style>
</head>
<body>
<div class="container-fluid py-4 px-4">
    <!-- Header Section -->
    <div class="details-header d-flex justify-content-between align-items-center">
        <div>
            <h1 class="fs-2 fw-bold mb-0"><i class="bi bi-person-badge me-2"></i>Détails de l'Employé</h1>
            <p class="text-muted mb-0">Informations complètes sur l'employé</p>
        </div>
        <div class="quick-actions">
            <a href="${pageContext.request.contextPath}/employee/edit?id=${employee.id}" class="btn btn-warning">
                <i class="bi bi-pencil-square me-2"></i>Modifier
            </a>
            <a href="${pageContext.request.contextPath}/employee/delete?id=${employee.id}" class="btn btn-danger" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet employé ?')">
                <i class="bi bi-trash me-2"></i>Supprimer
            </a>
            <a href="employees" class="btn btn-outline-secondary">
                <i class="bi bi-arrow-left me-2"></i>Retour
            </a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="row">
        <!-- Personal Information Card -->
        <div class="col-lg-4 mb-4">
            <div class="details-container">
                <div class="profile-section">
                    <div class="profile-avatar">
                        <i class="bi bi-person"></i>
                    </div>
                    <div class="profile-info">
                        <h2>${employee.prenom} ${employee.nom}</h2>
                        <div class="employee-role">
                            <c:choose>
                                <c:when test="${employee.role == 'admin'}">
                                    <span class="badge admin-badge">Administrateur</span>
                                </c:when>
                                <c:when test="${employee.role == 'manager'}">
                                    <span class="badge manager-badge">Gestionnaire</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge employee-badge">Employé</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <div class="detail-row">
                    <div class="row">
                        <div class="col-md-4 detail-label">ID</div>
                        <div class="col-md-8 detail-value">${employee.id}</div>
                    </div>
                </div>

                <div class="detail-row">
                    <div class="row">
                        <div class="col-md-4 detail-label">Email</div>
                        <div class="col-md-8 detail-value">
                            <i class="bi bi-envelope me-2 text-muted"></i>${employee.email}
                        </div>
                    </div>
                </div>

                <div class="detail-row">
                    <div class="row">
                        <div class="col-md-4 detail-label">Département</div>
                        <div class="col-md-8 detail-value">
                            <i class="bi bi-building me-2 text-muted"></i>
                            <c:choose>
                                <c:when test="${not empty employee.department}">
                                    ${employee.department.nom}
                                </c:when>
                                <c:otherwise>
                                    <span class="text-muted">Non assigné</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <div class="detail-row">
                    <div class="row">
                        <div class="col-md-4 detail-label">Rôle</div>
                        <div class="col-md-8 detail-value">
                            <i class="bi bi-person-badge me-2 text-muted"></i>
                            <c:choose>
                                <c:when test="${employee.role == 'admin'}">
                                    Administrateur
                                </c:when>
                                <c:when test="${employee.role == 'manager'}">
                                    Gestionnaire
                                </c:when>
                                <c:otherwise>
                                    Employé
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Statistiques Rapides Card -->
            <div class="card">
                <div class="card-header">
                    <h5><i class="bi bi-graph-up me-2"></i>Statistiques Rapides</h5>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-6">
                            <div class="border rounded p-3 text-center">
                                <h3 class="mb-1 fw-bold text-primary">
                                    <c:choose>
                                        <c:when test="${not empty employee.projects}">${employee.projects.size()}</c:when>
                                        <c:otherwise>0</c:otherwise>
                                    </c:choose>
                                </h3>
                                <p class="mb-0 small text-muted">Projets</p>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="border rounded p-3 text-center">
                                <h3 class="mb-1 fw-bold text-success">
                                    <c:choose>
                                        <c:when test="${not empty tasks}">${tasks.size()}</c:when>
                                        <c:otherwise>0</c:otherwise>
                                    </c:choose>
                                </h3>
                                <p class="mb-0 small text-muted">Tâches</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Projects and Tasks Column -->
        <div class="col-lg-8">
            <!-- Projects Card -->
            <div class="card mb-4">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5><i class="bi bi-clipboard2-check me-2"></i>Projets assignés</h5>
                    <a href="#" class="btn btn-sm btn-outline-primary">Voir tous</a>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${not empty employee.projects}">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>Nom du Projet</th>
                                        <th>Date Début</th>
                                        <th>Date Fin</th>
                                        <th>Statut</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="project" items="${employee.projects}">
                                        <tr>
                                            <td>
                                                <span class="fw-medium">${project.nom}</span>
                                            </td>
                                            <td><fmt:formatDate value="${project.dateDebut}" pattern="dd/MM/yyyy" /></td>
                                            <td><fmt:formatDate value="${project.dateFin}" pattern="dd/MM/yyyy" /></td>
                                            <td>
                                                        <span class="badge
                                                            ${project.statut == 'En cours' ? 'bg-primary' :
                                                            project.statut == 'Terminé' ? 'bg-success' : 'bg-secondary'}">
                                                                ${project.statut}
                                                        </span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="alert alert-info">
                                <i class="bi bi-info-circle me-2"></i> Cet employé n'est assigné à aucun projet pour le moment.
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- Tasks Card -->
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5><i class="bi bi-list-check me-2"></i>Tâches assignées</h5>
                    <a href="#" class="btn btn-sm btn-outline-primary">Voir toutes</a>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${not empty tasks}">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>Description</th>
                                        <th>Projet</th>
                                        <th>Date Création</th>
                                        <th>Date Échéance</th>
                                        <th>Statut</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="task" items="${tasks}">
                                        <tr>
                                            <td>
                                                <span class="fw-medium">${task.description}</span>
                                            </td>
                                            <td>${task.project.nom}</td>
                                            <td><fmt:formatDate value="${task.dateCreation}" pattern="dd/MM/yyyy" /></td>
                                            <td><fmt:formatDate value="${task.dateEcheance}" pattern="dd/MM/yyyy" /></td>
                                            <td>
                                                        <span class="badge
                                                            ${task.statut == 'En cours' ? 'bg-primary' :
                                                            task.statut == 'Terminé' ? 'bg-success' : 'bg-secondary'}">
                                                                ${task.statut}
                                                        </span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="alert alert-info">
                                <i class="bi bi-info-circle me-2"></i> Aucune tâche assignée à cet employé pour le moment.
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
