<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Employés</title>
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

        .dashboard-header {
            background-color: var(--header-bg);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 25px;
            box-shadow: var(--card-shadow);
        }

        .employees-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            padding: 25px;
            margin-bottom: 25px;
        }

        .table-responsive {
            overflow-x: auto;
        }

        .table {
            width: 100%;
            margin-bottom: 0;
        }

        .table thead th {
            background-color: rgba(67, 97, 238, 0.05);
            color: #495057;
            font-weight: 600;
            border-bottom: 2px solid rgba(67, 97, 238, 0.2);
            padding: 12px 15px;
        }

        .table tbody tr:hover {
            background-color: rgba(67, 97, 238, 0.03);
        }

        .table td {
            padding: 12px 15px;
            vertical-align: middle;
        }

        .role-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
        }

        .role-admin {
            background-color: rgba(220, 53, 69, 0.15);
            color: #dc3545;
        }

        .role-manager {
            background-color: rgba(255, 159, 28, 0.15);
            color: #ff9f1c;
        }

        .role-employee {
            background-color: rgba(46, 196, 182, 0.15);
            color: #2ec4b6;
        }

        .action-buttons .btn {
            border-radius: 6px;
            padding: 6px 12px;
            margin-right: 5px;
            font-weight: 500;
        }

        .btn-edit {
            background-color: var(--warning-color);
            border-color: var(--warning-color);
            color: white;
        }

        .btn-edit:hover {
            background-color: #e68a00;
            border-color: #e68a00;
            color: white;
        }

        .btn-delete {
            background-color: var(--danger-color);
            border-color: var(--danger-color);
        }

        .btn-delete:hover {
            background-color: #d32f2f;
            border-color: #d32f2f;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 8px 15px;
            border-radius: 8px;
            font-weight: 500;
        }

        .btn-primary:hover {
            background-color: #3a56d4;
            border-color: #3a56d4;
        }

        .quick-actions .btn {
            border-radius: 8px;
            margin-right: 10px;
            padding: 8px 15px;
            font-weight: 500;
        }

        .pagination-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination .page-item .page-link {
            color: var(--primary-color);
            padding: 8px 15px;
        }

        .pagination .page-item.active .page-link {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .search-container {
            position: relative;
            max-width: 300px;
        }

        .search-container .form-control {
            padding-left: 35px;
            border-radius: 20px;
        }

        .search-icon {
            position: absolute;
            left: 12px;
            top: 10px;
            color: #6c757d;
        }
    </style>
</head>
<body>
<div class="container-fluid py-4 px-4">
    <!-- Header Section -->
    <div class="dashboard-header d-flex justify-content-between align-items-center">
        <div>
            <h1 class="fs-2 fw-bold mb-0"><i class="bi bi-people-fill me-2"></i>Liste des Employés</h1>
            <p class="text-muted mb-0">Gestion et supervision des employés</p>
        </div>
        <div class="quick-actions">
            <a href="${pageContext.request.contextPath}/employee/add" class="btn btn-primary">
                <i class="bi bi-person-plus-fill me-2"></i>Ajouter un employé
            </a>
            <button class="btn btn-outline-secondary">
                <i class="bi bi-arrow-clockwise me-2"></i>Actualiser
            </button>
        </div>
    </div>

    <!-- Employees Container -->
    <div class="employees-container">
        <!-- Search and Filter Row -->
        <div class="row mb-4 align-items-center">
            <div class="col-md-6">
                <div class="search-container">
                    <i class="bi bi-search search-icon"></i>
                    <input type="text" class="form-control" placeholder="Rechercher un employé...">
                </div>
            </div>
            <div class="col-md-6 text-md-end">
                <span class="me-2">Filtrer par département:</span>
                <select class="form-select form-select-sm d-inline-block" style="width: auto;">
                    <option value="">Tous les départements</option>
                    <c:forEach var="department" items="${departments}">
                        <option value="${department.id}">${department.nom}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <!-- Table -->
        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th style="width: 5%">#</th>
                    <th style="width: 15%">Nom</th>
                    <th style="width: 15%">Prénom</th>
                    <th style="width: 20%">Email</th>
                    <th style="width: 15%">Département</th>
                    <th style="width: 10%">Rôle</th>
                    <th style="width: 20%">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="employee" items="${employees}">
                    <tr>
                        <td>${employee.id}</td>
                        <td class="fw-medium">${employee.nom}</td>
                        <td>${employee.prenom}</td>
                        <td>
                            <a href="mailto:${employee.email}" class="text-decoration-none">
                                <i class="bi bi-envelope-fill me-1 text-muted small"></i>${employee.email}
                            </a>
                        </td>
                        <td>
                            <i class="bi bi-building me-1"></i>${employee.department.nom}
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${employee.role == 'admin'}">
                                    <span class="role-badge role-admin">Administrateur</span>
                                </c:when>
                                <c:when test="${employee.role == 'manager'}">
                                    <span class="role-badge role-manager">Gestionnaire</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="role-badge role-employee">Employé</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="action-buttons">
                            <a href="${pageContext.request.contextPath}/employee/view?id=${employee.id}" class="btn btn-sm btn-info text-white">
                                <i class="bi bi-eye"></i>
                            </a>
                            <a href="${pageContext.request.contextPath}/employee/edit?id=${employee.id}" class="btn btn-sm btn-edit">
                                <i class="bi bi-pencil"></i>
                            </a>
                            <a href="${pageContext.request.contextPath}/employee/delete?id=${employee.id}"
                               class="btn btn-sm btn-delete text-white"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet employé ?')">
                                <i class="bi bi-trash"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>

                <!-- Si la liste est vide, ajouter des exemples -->
                <c:if test="${empty employees}">
                    <tr>
                        <td>1</td>
                        <td class="fw-medium">Dupont</td>
                        <td>Marie</td>
                        <td>
                            <a href="mailto:m.dupont@example.com" class="text-decoration-none">
                                <i class="bi bi-envelope-fill me-1 text-muted small"></i>m.dupont@example.com
                            </a>
                        </td>
                        <td>
                            <i class="bi bi-building me-1"></i>Ressources Humaines
                        </td>
                        <td>
                            <span class="role-badge role-manager">Gestionnaire</span>
                        </td>
                        <td class="action-buttons">
                            <a href="#" class="btn btn-sm btn-info text-white">
                                <i class="bi bi-eye"></i>
                            </a>
                            <a href="#" class="btn btn-sm btn-edit">
                                <i class="bi bi-pencil"></i>
                            </a>
                            <a href="#" class="btn btn-sm btn-delete text-white">
                                <i class="bi bi-trash"></i>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td class="fw-medium">Martin</td>
                        <td>Jean</td>
                        <td>
                            <a href="mailto:j.martin@example.com" class="text-decoration-none">
                                <i class="bi bi-envelope-fill me-1 text-muted small"></i>j.martin@example.com
                            </a>
                        </td>
                        <td>
                            <i class="bi bi-building me-1"></i>Développement
                        </td>
                        <td>
                            <span class="role-badge role-admin">Administrateur</span>
                        </td>
                        <td class="action-buttons">
                            <a href="#" class="btn btn-sm btn-info text-white">
                                <i class="bi bi-eye"></i>
                            </a>
                            <a href="#" class="btn btn-sm btn-edit">
                                <i class="bi bi-pencil"></i>
                            </a>
                            <a href="#" class="btn btn-sm btn-delete text-white">
                                <i class="bi bi-trash"></i>
                            </a>
                        </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        <div class="pagination-container">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
