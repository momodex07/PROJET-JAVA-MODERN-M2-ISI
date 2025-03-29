<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Départements</title>
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

        .content-container {
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
            padding: 8px 16px;
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
            color: white;
        }

        .btn-danger {
            background: linear-gradient(45deg, #dc3545, #e5383b);
            border: none;
        }

        .table {
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
        }

        .table th {
            background-color: rgba(241, 245, 253, 0.7);
            font-weight: 600;
            padding: 12px;
            color: #495057;
        }

        .table td {
            padding: 12px;
            vertical-align: middle;
        }

        .table tr {
            transition: all 0.2s ease;
        }

        .table tr:hover {
            background-color: rgba(241, 245, 253, 0.4);
        }

        .table tbody tr {
            border-bottom: 1px solid rgba(0,0,0,0.05);
        }

        .actions-column {
            width: 180px;
        }

        .department-status {
            width: 10px;
            height: 10px;
            display: inline-block;
            border-radius: 50%;
            margin-right: 8px;
            background-color: var(--success-color);
        }

        .empty-state {
            text-align: center;
            padding: 40px 20px;
        }

        .empty-state i {
            font-size: 3rem;
            color: #dee2e6;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="container-fluid py-4 px-4">
    <!-- Header Section -->
    <div class="dashboard-header d-flex justify-content-between align-items-center">
        <div>
            <h1 class="fs-2 fw-bold mb-0"><i class="bi bi-building me-2"></i>Départements</h1>
            <p class="text-muted mb-0">Gestion des départements de l'entreprise</p>
        </div>
        <div class="quick-actions">
            <a href="${pageContext.request.contextPath}/department/add" class="btn btn-primary">
                <i class="bi bi-plus-circle me-2"></i>Nouveau Département
            </a>
            <button class="btn btn-outline-secondary">
                <i class="bi bi-arrow-clockwise me-2"></i>Actualiser
            </button>
        </div>
    </div>

    <!-- Main Content -->
    <div class="content-container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="fs-4 fw-semibold mb-0">Liste des Départements</h3>
            <div class="input-group" style="max-width: 300px;">
                <input type="text" class="form-control" placeholder="Rechercher..." aria-label="Rechercher">
                <button class="btn btn-outline-secondary" type="button">
                    <i class="bi bi-search"></i>
                </button>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Description</th>
                    <th>Statut</th>
                    <th class="actions-column">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty departments}">
                        <c:forEach var="department" items="${departments}">
                            <tr>
                                <td>${department.id}</td>
                                <td>
                                    <div class="fw-semibold">${department.nom}</div>
                                </td>
                                <td>${department.description}</td>
                                <td>
                                    <span class="department-status"></span>
                                    <span class="badge bg-success rounded-pill">Actif</span>
                                </td>
                                <td class="actions-column">
                                    <a href="${pageContext.request.contextPath}/department/view?id=${department.id}" class="btn btn-sm btn-outline-info me-1" title="Voir détails">
                                        <i class="bi bi-eye"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/department/edit?id=${department.id}" class="btn btn-sm btn-warning me-1" title="Modifier">
                                        <i class="bi bi-pencil-square"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/department/delete?id=${department.id}" class="btn btn-sm btn-danger"
                                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce département ?')" title="Supprimer">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="5">
                                <div class="empty-state">
                                    <i class="bi bi-folder"></i>
                                    <h5>Aucun département trouvé</h5>
                                    <p class="text-muted">Commencez par ajouter un département à la liste.</p>
                                    <a href="${pageContext.request.contextPath}/department/add" class="btn btn-primary mt-2">
                                        <i class="bi bi-plus-circle me-2"></i>Ajouter un département
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        <nav aria-label="Page navigation example" class="mt-4">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Précédent</a>
                </li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Suivant</a>
                </li>
            </ul>
        </nav>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Fonctions JavaScript supplémentaires peuvent être ajoutées ici
    document.addEventListener('DOMContentLoaded', function() {
        // Animation pour les notifications ou alertes
        const alertPlaceholder = document.getElementById('liveAlertPlaceholder');
        if (alertPlaceholder && new URLSearchParams(window.location.search).has('success')) {
            const wrapper = document.createElement('div');
            wrapper.innerHTML = `
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        Opération réalisée avec succès.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                `;
            alertPlaceholder.append(wrapper);

            // Auto-dismiss après 5 secondes
            setTimeout(() => {
                const alert = bootstrap.Alert.getOrCreateInstance(wrapper.querySelector('.alert'));
                alert.close();
            }, 5000);
        }
    });
</script>
</body>
</html>
