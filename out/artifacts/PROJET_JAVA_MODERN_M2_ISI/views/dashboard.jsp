<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de Bord</title>
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

        .stat-card {
            border-radius: 12px;
            border: none;
            box-shadow: var(--card-shadow);
            transition: all 0.25s ease;
            height: 100%;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        /* Transition plus douce et moins prononcée */
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .stat-card .card-body {
            padding: 20px;
            position: relative;
            z-index: 1;
        }

        /* Fix pour stabiliser l'icône */
        .stat-icon {
            font-size: 2.5rem;
            opacity: 0.8;
            position: absolute;
            right: 20px;
            top: 20px;
            z-index: 0;
        }

        .stat-title {
            font-size: 1rem;
            font-weight: 500;
            margin-bottom: 5px;
            position: relative;
        }

        .stat-value {
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 0;
            position: relative;
        }

        /* Remplace stretched-link par une approche plus stable */
        .stat-card a.card-link {
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            z-index: 2;
            text-indent: -9999px;
        }

        .chart-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            padding: 20px;
            margin-bottom: 25px;
        }

        .chart-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .recent-items {
            background-color: white;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            padding: 20px;
        }

        .quick-actions .btn {
            border-radius: 8px;
            margin-right: 10px;
            padding: 8px 15px;
            font-weight: 500;
        }

        .primary-card {
            background: linear-gradient(45deg, #4361ee, #4895ef);
        }

        .success-card {
            background: linear-gradient(45deg, #2ec4b6, #52b788);
        }

        .info-card {
            background: linear-gradient(45deg, #3a86ff, #48bfe3);
        }

        .warning-card {
            background: linear-gradient(45deg, #ff9f1c, #f9c74f);
        }
    </style>
</head>
<body>
<div class="container-fluid py-4 px-4">
    <!-- Header Section -->
    <div class="dashboard-header d-flex justify-content-between align-items-center">
        <div>
            <h1 class="fs-2 fw-bold mb-0"><i class="bi bi-speedometer2 me-2"></i>Tableau de Bord</h1>
            <p class="text-muted mb-0">Bienvenue sur votre espace de gestion</p>
        </div>
        <div class="quick-actions">
            <button class="btn btn-primary"><i class="bi bi-plus-circle me-2"></i>Nouveau Projet</button>
            <button class="btn btn-outline-secondary"><i class="bi bi-arrow-clockwise me-2"></i>Actualiser</button>
        </div>
    </div>

    <!-- Stats Cards Row -->
    <div class="row g-4 mb-4">
        <div class="col-md-6 col-lg-3">
            <div class="stat-card primary-card text-white">
                <div class="card-body">
                    <div class="d-flex flex-column">
                        <p class="stat-title">Employés</p>
                        <h2 class="stat-value">${employeeCount}</h2>
                        <p class="mb-0 mt-2 small">
                            <i class="bi bi-arrow-up-short"></i>
                            <span>+5% ce mois</span>
                        </p>
                    </div>
                    <div class="stat-icon">
                        <i class="bi bi-people-fill"></i>
                    </div>
                    <a href="${pageContext.request.contextPath}/employees" class="card-link">Voir les employés</a>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-3">
            <div class="stat-card success-card text-white">
                <div class="card-body">
                    <div class="d-flex flex-column">
                        <p class="stat-title">Projets</p>
                        <h2 class="stat-value">${projectCount}</h2>
                        <p class="mb-0 mt-2 small">
                            <i class="bi bi-arrow-up-short"></i>
                            <span>3 nouveaux</span>
                        </p>
                    </div>
                    <div class="stat-icon">
                        <i class="bi bi-clipboard2-check"></i>
                    </div>
                    <a href="${pageContext.request.contextPath}/projects" class="card-link">Voir les projets</a>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-3">
            <div class="stat-card info-card text-white">
                <div class="card-body">
                    <div class="d-flex flex-column">
                        <p class="stat-title">Départements</p>
                        <h2 class="stat-value">${departmentCount}</h2>
                        <p class="mb-0 mt-2 small">
                            <i class="bi bi-arrow-right-short"></i>
                            <span>Stable</span>
                        </p>
                    </div>
                    <div class="stat-icon">
                        <i class="bi bi-building"></i>
                    </div>
                    <a href="${pageContext.request.contextPath}/departments" class="card-link">Voir les départements</a>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-3">
            <div class="stat-card warning-card text-white">
                <div class="card-body">
                    <div class="d-flex flex-column">
                        <p class="stat-title">Tâches</p>
                        <h2 class="stat-value">${taskCount}</h2>
                        <p class="mb-0 mt-2 small">
                            <i class="bi bi-exclamation-circle"></i>
                            <span>12 en attente</span>
                        </p>
                    </div>
                    <div class="stat-icon">
                        <i class="bi bi-list-check"></i>
                    </div>
                    <a href="${pageContext.request.contextPath}/tasks" class="card-link">Voir les tâches</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Charts Row -->
    <div class="row mb-4">
        <div class="col-md-8">
            <div class="chart-container">
                <h3 class="chart-title">Statistiques des Projets</h3>
                <canvas id="projectsChart" height="250"></canvas>
            </div>
        </div>
        <div class="col-md-4">
            <div class="chart-container">
                <h3 class="chart-title">Répartition des Tâches</h3>
                <canvas id="tasksChart" height="250"></canvas>
            </div>
        </div>
    </div>

    <!-- Recent Items Table -->
    <div class="row">
        <div class="col-12">
            <div class="recent-items">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h3 class="chart-title mb-0">Projets Récents</h3>
                    <a href="${pageContext.request.contextPath}/projects" class="btn btn-sm btn-outline-primary">Voir tous</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Nom du Projet</th>
                            <th>Chef de Projet</th>
                            <th>État</th>
                            <th>Progression</th>
                            <th>Échéance</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="project" items="${recentProjects}" varStatus="status">
                            <tr>
                                <td>${project.nom}</td>
                                <td>${project.manager}</td>
                                <td><span class="badge bg-success">${project.statut}</span></td>
                                <td>
                                    <div class="progress" style="height: 6px;">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: ${project.progress}%"></div>
                                    </div>
                                </td>
                                <td>${project.dateFin}</td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty recentProjects}">
                            <tr>
                                <td colspan="5" class="text-center">Aucun projet récent disponible</td>
                            </tr>
                        </c:if>
                        </tbody>

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Charts JavaScript -->
<script>
    // Projects Chart
    const projectsCtx = document.getElementById('projectsChart').getContext('2d');
    const projectsChart = new Chart(projectsCtx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Juin'],
            datasets: [{
                label: 'Projets Terminés',
                data: [5, 8, 6, 9, 12, 15],
                borderColor: '#4361ee',
                backgroundColor: 'rgba(67, 97, 238, 0.1)',
                tension: 0.3,
                fill: true
            }, {
                label: 'Nouveaux Projets',
                data: [7, 4, 9, 7, 11, 8],
                borderColor: '#2ec4b6',
                backgroundColor: 'rgba(46, 196, 182, 0.1)',
                tension: 0.3,
                fill: true
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    grid: {
                        drawBorder: false
                    }
                },
                x: {
                    grid: {
                        display: false
                    }
                }
            }
        }
    });

    // Tasks Chart
    const tasksCtx = document.getElementById('tasksChart').getContext('2d');
    const tasksChart = new Chart(tasksCtx, {
        type: 'doughnut',
        data: {
            labels: ['Terminées', 'En cours', 'En attente', 'Retardées'],
            datasets: [{
                data: [45, 25, 20, 10],
                backgroundColor: [
                    '#2ec4b6',
                    '#4361ee',
                    '#ff9f1c',
                    '#dc3545'
                ],
                borderWidth: 0
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom'
                }
            },
            cutout: '70%'
        }
    });
</script>
</body>
</html>
