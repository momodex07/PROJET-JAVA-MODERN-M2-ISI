<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter une Tâche</title>
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

        .page-header {
            background-color: var(--header-bg);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 25px;
            box-shadow: var(--card-shadow);
        }

        .form-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            padding: 25px;
            margin-bottom: 25px;
        }

        .form-label {
            font-weight: 500;
            color: #495057;
        }

        .form-control, .form-select {
            border-radius: 8px;
            padding: 10px 15px;
            border: 1px solid #e0e0e0;
            transition: all 0.3s;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.25);
        }

        .btn {
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-primary:hover {
            background-color: #3651d4;
            border-color: #3651d4;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-outline-secondary {
            color: #6c757d;
            border-color: #6c757d;
        }

        .form-section {
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }

        .form-section:last-child {
            border-bottom: none;
            margin-bottom: 10px;
            padding-bottom: 0;
        }

        .status-badge {
            display: inline-block;
            width: 12px;
            height: 12px;
            border-radius: 50%;
            margin-right: 8px;
        }

        .status-todo {
            background-color: var(--warning-color);
        }

        .status-progress {
            background-color: var(--info-color);
        }

        .status-done {
            background-color: var(--success-color);
        }
    </style>
</head>
<body>
<div class="container py-4 px-4">
    <!-- Header Section -->
    <div class="page-header d-flex justify-content-between align-items-center">
        <div>
            <h1 class="fs-2 fw-bold mb-0"><i class="bi bi-list-check me-2"></i>Ajouter une Tâche</h1>
            <p class="text-muted mb-0">Créez une nouvelle tâche pour votre équipe</p>
        </div>
        <div>
            <a href="../tasks" class="btn btn-outline-secondary"><i class="bi bi-arrow-left me-2"></i>Retour à la liste</a>
        </div>
    </div>

    <!-- Form Container -->
    <div class="form-container">
        <form action="${pageContext.request.contextPath}/task/add" method="POST">
            <!-- Informations de la tâche -->
            <div class="form-section">
                <h4 class="mb-3"><i class="bi bi-info-circle me-2"></i>Informations générales</h4>
                <div class="mb-3">
                    <label for="description" class="form-label">Description de la tâche</label>
                    <textarea class="form-control" id="description" name="description" rows="3" required placeholder="Décrivez la tâche à accomplir"></textarea>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="statut" class="form-label">Statut initial</label>
                        <select class="form-select" id="statut" name="statut" required>
                            <option value="A faire">À faire <span class="status-badge status-todo"></span></option>
                            <option value="En cours">En cours <span class="status-badge status-progress"></span></option>
                            <option value="Terminé">Terminé <span class="status-badge status-done"></span></option>
                        </select>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="priorite" class="form-label">Priorité</label>
                        <select class="form-select" id="priorite" name="priorite">
                            <option value="Basse">Basse</option>
                            <option value="Moyenne" selected>Moyenne</option>
                            <option value="Haute">Haute</option>
                            <option value="Urgente">Urgente</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Attribution -->
            <div class="form-section">
                <h4 class="mb-3"><i class="bi bi-people me-2"></i>Attribution</h4>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="employeeId" class="form-label">Assigné à</label>
                        <select class="form-select" id="employeeId" name="employeeId" required>
                            <option value="">Sélectionnez un employé</option>
                            <c:forEach var="employee" items="${employees}">
                                <option value="${employee.id}">${employee.nom} ${employee.prenom}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="projectId" class="form-label">Projet associé</label>
                        <select class="form-select" id="projectId" name="projectId" required>
                            <option value="">Sélectionnez un projet</option>
                            <c:forEach var="project" items="${projects}">
                                <option value="${project.id}">${project.nom}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Planning -->
            <div class="form-section">
                <h4 class="mb-3"><i class="bi bi-calendar-event me-2"></i>Planning</h4>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="dateCreation" class="form-label">Date de création</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-calendar-plus"></i></span>
                            <input type="date" class="form-control" id="dateCreation" name="dateCreation" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="dateEcheance" class="form-label">Date d'échéance</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-calendar-check"></i></span>
                            <input type="date" class="form-control" id="dateEcheance" name="dateEcheance" required>
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="estimatedTime" class="form-label">Temps estimé (en heures)</label>
                    <input type="number" class="form-control" id="estimatedTime" name="estimatedTime" min="0" step="0.5">
                </div>
            </div>

            <!-- Actions -->
            <div class="d-flex justify-content-between mt-4">
                <a href="../tasks" class="btn btn-outline-secondary"><i class="bi bi-x-circle me-2"></i>Annuler</a>
                <button type="submit" class="btn btn-primary"><i class="bi bi-check-circle me-2"></i>Créer la tâche</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Définir la date du jour comme valeur par défaut pour la date de création
    document.addEventListener('DOMContentLoaded', function() {
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('dateCreation').value = today;

        // Calculer une date d'échéance par défaut (aujourd'hui + 7 jours)
        const defaultDueDate = new Date();
        defaultDueDate.setDate(defaultDueDate.getDate() + 7);
        document.getElementById('dateEcheance').value = defaultDueDate.toISOString().split('T')[0];
    });
</script>
</body>
</html>
