<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Projets</title>
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --success-color: #2ec4b6;
            --info-color: #3a86ff;
            --warning-color: #ff9f1c;
            --danger-color: #e63946;
            --light-bg: #f8f9fa;
            --card-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --header-bg: #f1f5fd;
        }

        body {
            background-color: var(--light-bg);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .projects-header {
            background-color: var(--header-bg);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 25px;
            box-shadow: var(--card-shadow);
        }

        .projects-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            padding: 25px;
            margin-bottom: 25px;
        }

        .btn-primary {
            background: linear-gradient(45deg, #4361ee, #4895ef);
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 500;
            transition: all 0.25s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(67, 97, 238, 0.3);
        }

        .btn-warning {
            background: linear-gradient(45deg, #ff9f1c, #f9c74f);
            border: none;
            color: #fff;
            font-weight: 500;
            transition: all 0.25s ease;
        }

        .btn-warning:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(255, 159, 28, 0.3);
        }

        .btn-danger {
            background: linear-gradient(45deg, #e63946, #ef6351);
            border: none;
            font-weight: 500;
            transition: all 0.25s ease;
        }

        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(230, 57, 70, 0.3);
        }

        .btn-info {
            background: linear-gradient(45deg, #3a86ff, #48bfe3);
            border: none;
            color: #fff;
            font-weight: 500;
            transition: all 0.25s ease;
        }

        .btn-info:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(58, 134, 255, 0.3);
        }

        .btn-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
            padding: 0;
            border-radius: 6px;
        }

        .status-badge {
            padding: 6px 12px;
            border-radius: 50px;
            font-weight: 500;
            font-size: 0.85rem;
        }

        .status-en-attente {
            background-color: rgba(255, 159, 28, 0.15);
            color: #ff9f1c;
        }

        .status-en-cours {
            background-color: rgba(58, 134, 255, 0.15);
            color: #3a86ff;
        }

        .status-termine {
            background-color: rgba(46, 196, 182, 0.15);
            color: #2ec4b6;
        }

        .table-custom {
            border-collapse: separate;
            border-spacing: 0;
        }

        .table-custom th {
            background-color: var(--header-bg);
            border: none;
            padding: 15px;
            font-weight: 600;
            color: #495057;
        }

        .table-custom td {
            padding: 15px;
            vertical-align: middle;
            border-bottom: 1px solid #e9ecef;
        }

        .table-custom tr:hover {
            background-color: rgba(67, 97, 238, 0.03);
        }

        .table-custom tr:last-child td {
            border-bottom: none;
        }

        .project-description {
            max-width: 300px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .table-responsive {
            border-radius: 10px;
            overflow: hidden;
        }

        .search-container {
            position: relative;
            max-width: 300px;
        }

        .search-container .form-control {
            padding-left: 40px;
            border-radius: 50px;
            border: 1px solid #e0e0e0;
        }

        .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
        }

        .date-column {
            white-space: nowrap;
        }

        .tooltip-wrapper {
            position: relative;
            display: inline-block;
        }

        .empty-state {
            text-align: center;
            padding: 60px 30px;
        }

        .empty-state-icon {
            font-size: 4rem;
            color: #e0e0e0;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container py-4 px-4">
    <!-- Header Section -->
    <div class="projects-header d-flex justify-content-between align-items-center">
        <div>
            <h1 class="fs-2 fw-bold mb-0"><i class="bi bi-clipboard2-check me-2"></i>Liste des Projets</h1>
            <p class="text-muted mb-0">Gestion et suivi de tous vos projets</p>
        </div>
        <div class="d-flex gap-3 align-items-center">
            <div class="search-container d-none d-md-block">
                <i class="bi bi-search search-icon"></i>
                <input type="text" class="form-control" id="searchProject" placeholder="Rechercher un projet...">
            </div>
            <a href="${pageContext.request.contextPath}/project/add" class="btn btn-primary">
                <i class="bi bi-plus-circle me-2"></i>Ajouter un projet
            </a>
        </div>
    </div>

    <!-- Projects Table -->
    <div class="projects-container">
        <div class="table-responsive">
            <table class="table table-custom" id="projectsTable">
                <thead>
                <tr>
                    <th style="width: 60px">#</th>
                    <th>Nom</th>
                    <th>Description</th>
                    <th>Date Début</th>
                    <th>Date Fin</th>
                    <th>Statut</th>
                    <th style="width: 180px" class="text-end">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="project" items="${projects}">
                    <tr>
                        <td>${project.id}</td>
                        <td class="fw-medium">${project.nom}</td>
                        <td>
                            <div class="project-description" title="${project.description}">
                                    ${project.description}
                            </div>
                        </td>
                        <td class="date-column"><fmt:formatDate value="${project.dateDebut}" pattern="dd/MM/yyyy" /></td>
                        <td class="date-column"><fmt:formatDate value="${project.dateFin}" pattern="dd/MM/yyyy" /></td>
                        <td>
                            <c:choose>
                                <c:when test="${project.statut == 'En attente'}">
                                            <span class="status-badge status-en-attente">
                                                <i class="bi bi-hourglass me-1"></i> En attente
                                            </span>
                                </c:when>
                                <c:when test="${project.statut == 'En cours'}">
                                            <span class="status-badge status-en-cours">
                                                <i class="bi bi-play-fill me-1"></i> En cours
                                            </span>
                                </c:when>
                                <c:when test="${project.statut == 'Terminé'}">
                                            <span class="status-badge status-termine">
                                                <i class="bi bi-check-circle me-1"></i> Terminé
                                            </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-badge status-en-attente">${project.statut}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <div class="d-flex gap-2 justify-content-end">
                                <a href="project/edit?id=${project.id}" class="btn btn-sm btn-warning" data-bs-toggle="tooltip" title="Modifier">
                                    <i class="bi bi-pencil-fill"></i>
                                </a>
                                <a href="project/assign?projectId=${project.id}" class="btn btn-sm btn-info" data-bs-toggle="tooltip" title="Assigner des employés">
                                    <i class="bi bi-people-fill"></i>
                                </a>
                                <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal${project.id}" data-bs-toggle="tooltip" title="Supprimer">
                                    <i class="bi bi-trash-fill"></i>
                                </button>

                                <!-- Modal de confirmation de suppression -->
                                <div class="modal fade" id="deleteModal${project.id}" tabindex="-1" aria-labelledby="deleteModalLabel${project.id}" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="deleteModalLabel${project.id}">Confirmation de suppression</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Êtes-vous sûr de vouloir supprimer le projet <strong>${project.nom}</strong> ?</p>
                                                <p class="text-danger"><small><i class="bi bi-exclamation-triangle me-2"></i>Cette action est irréversible.</small></p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                                                <a href="project/delete?id=${project.id}" class="btn btn-danger">Supprimer</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>

                <!-- État vide -->
                <c:if test="${empty projects}">
                    <tr>
                        <td colspan="7">
                            <div class="empty-state">
                                <div class="empty-state-icon">
                                    <i class="bi bi-clipboard-x"></i>
                                </div>
                                <h4>Aucun projet trouvé</h4>
                                <p class="text-muted">Commencez par créer un nouveau projet en cliquant sur le bouton "Ajouter un projet".</p>
                                <a href="${pageContext.request.contextPath}/project/add" class="btn btn-primary mt-3">
                                    <i class="bi bi-plus-circle me-2"></i>Ajouter un projet
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Activer les tooltips
    document.addEventListener('DOMContentLoaded', function() {
        const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        tooltipTriggerList.map(function(tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });

        // Fonction de recherche
        const searchInput = document.getElementById('searchProject');
        if (searchInput) {
            searchInput.addEventListener('keyup', function() {
                const searchValue = this.value.toLowerCase();
                const table = document.getElementById('projectsTable');
                const rows = table.getElementsByTagName('tr');

                for (let i = 1; i < rows.length; i++) {
                    if (!rows[i].querySelector('td.empty-state')) {
                        const td = rows[i].getElementsByTagName('td');
                        let found = false;

                        for (let j = 0; j < td.length - 1; j++) {
                            if (td[j].textContent.toLowerCase().indexOf(searchValue) > -1) {
                                found = true;
                                break;
                            }
                        }

                        if (found) {
                            rows[i].style.display = '';
                        } else {
                            rows[i].style.display = 'none';
                        }
                    }
                }
            });
        }
    });
</script>
</body>
</html>
