<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assigner des Employés</title>
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --success-color: #2ec4b6;
            --info-color: #3a86ff;
            --warning-color: #ff9f1c;
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

        .content-card {
            background-color: white;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            padding: 20px;
            height: 100%;
            transition: all 0.25s ease;
        }

        .content-card:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .content-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 15px;
            color: var(--primary-color);
            display: flex;
            align-items: center;
        }

        .list-group-item {
            border-radius: 8px;
            margin-bottom: 8px;
            border-left: 3px solid var(--primary-color);
            transition: all 0.2s ease;
        }

        .list-group-item:hover {
            background-color: var(--header-bg);
            transform: translateX(5px);
        }

        .form-select, .form-control {
            border-radius: 8px;
            padding: 10px 12px;
            border: 1px solid #dee2e6;
        }

        .form-select:focus, .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.25);
        }

        .btn {
            border-radius: 8px;
            padding: 8px 16px;
            font-weight: 500;
        }

        .btn-primary {
            background: linear-gradient(45deg, #4361ee, #4895ef);
            border: none;
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }

        .btn-primary:hover, .btn-secondary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .employee-badge {
            display: flex;
            align-items: center;
        }

        .employee-icon {
            background-color: var(--header-bg);
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            color: var(--primary-color);
        }
    </style>
</head>
<body>
<div class="container py-4 px-4">
    <!-- Header Section -->
    <div class="dashboard-header d-flex justify-content-between align-items-center">
        <div>
            <h1 class="fs-2 fw-bold mb-0"><i class="bi bi-people-fill me-2"></i>Assigner des Employés</h1>
            <p class="text-muted mb-0">Projet: ${project.nom}</p>
        </div>
        <div class="quick-actions">
            <a href="../projects" class="btn btn-outline-secondary"><i class="bi bi-arrow-left me-2"></i>Retour aux Projets</a>
        </div>
    </div>

    <div class="row g-4">
        <!-- Employés assignés -->
        <div class="col-md-6">
            <div class="content-card">
                <h3 class="content-title"><i class="bi bi-check-circle-fill me-2"></i>Employés assignés (${project.employees.size()})</h3>

                <c:choose>
                    <c:when test="${not empty project.employees}">
                        <ul class="list-group list-group-flush">
                            <c:forEach var="employee" items="${project.employees}">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <div class="employee-badge">
                                        <div class="employee-icon">
                                            <i class="bi bi-person-fill"></i>
                                        </div>
                                        <span>${employee.nom} ${employee.prenom}</span>
                                    </div>
                                    <span class="badge bg-primary rounded-pill">Assigné</span>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-info">
                            <i class="bi bi-info-circle me-2"></i>Aucun employé n'est assigné à ce projet
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Formulaire d'assignation -->
        <div class="col-md-6">
            <div class="content-card">
                <h3 class="content-title"><i class="bi bi-plus-circle-fill me-2"></i>Assigner un nouvel employé</h3>

                <form action="${pageContext.request.contextPath}/project/assign" method="post">
                    <input type="hidden" name="projectId" value="${project.id}">

                    <div class="mb-4">
                        <label for="employeeId" class="form-label fw-bold">Sélectionnez un employé</label>
                        <select class="form-select" id="employeeId" name="employeeId" required>
                            <option value="">Choisir un employé...</option>
                            <c:forEach var="employee" items="${employees}">
                                <option value="${employee.id}">${employee.nom} ${employee.prenom} (${employee.department.nom})</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="d-grid gap-2 d-md-flex">
                        <button type="submit" class="btn btn-primary"><i class="bi bi-plus-circle me-2"></i>Assigner</button>
                        <a href="../projects" class="btn btn-secondary"><i class="bi bi-x-circle me-2"></i>Annuler</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Informations supplémentaires du projet -->
    <div class="row mt-4">
        <div class="col-12">
            <div class="content-card">
                <h3 class="content-title"><i class="bi bi-info-circle-fill me-2"></i>Détails du Projet</h3>

                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Nom du projet</th>
                            <th>Chef de projet</th>
                            <th>État</th>
                            <th>Progression</th>
                            <th>Échéance</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>${project.nom}</td>
                            <td>${project.manager}</td>
                            <td><span class="badge bg-success">Actif</span></td>
                            <td>
                                <div class="progress" style="height: 6px;">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 65%"></div>
                                </div>
                            </td>
                            <td>${project.deadline}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
