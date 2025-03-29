<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier une Tâche</title>
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
            padding: 30px;
            margin-bottom: 25px;
        }

        .form-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 8px;
        }

        .form-control, .form-select {
            border-radius: 8px;
            padding: 10px 15px;
            border: 1px solid #ced4da;
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
            background-color: #3a56d4;
            border-color: #3a56d4;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-outline-secondary {
            color: #6c757d;
            border-color: #6c757d;
        }

        .status-badge {
            padding: 8px 12px;
            border-radius: 20px;
            font-weight: 500;
            font-size: 0.85rem;
            display: inline-block;
            margin-right: 5px;
        }

        .badge-todo {
            background-color: #f8f9fa;
            color: #495057;
            border: 1px solid #ced4da;
        }

        .badge-progress {
            background-color: var(--info-color);
            color: white;
        }

        .badge-completed {
            background-color: var(--success-color);
            color: white;
        }

        .date-group {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .date-group .mb-3 {
            flex: 1;
            min-width: 250px;
        }

        .input-icon-wrapper {
            position: relative;
        }

        .input-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
        }

        .statut-options {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        .statut-option {
            flex: 1;
            border: 1px solid #ced4da;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            cursor: pointer;
            transition: all 0.2s;
            position: relative;
        }

        .statut-radio {
            position: absolute;
            opacity: 0;
        }

        .statut-option.todo {
            border-color: #ced4da;
            color: #495057;
        }

        .statut-option.progress {
            border-color: var(--info-color);
            color: var(--info-color);
        }

        .statut-option.completed {
            border-color: var(--success-color);
            color: var(--success-color);
        }

        .statut-radio:checked + .statut-option.todo {
            background-color: #f8f9fa;
            border-color: #adb5bd;
            color: #212529;
            font-weight: 500;
        }

        .statut-radio:checked + .statut-option.progress {
            background-color: rgba(58, 134, 255, 0.1);
            border-color: var(--info-color);
            color: var(--info-color);
            font-weight: 500;
        }

        .statut-radio:checked + .statut-option.completed {
            background-color: rgba(46, 196, 182, 0.1);
            border-color: var(--success-color);
            color: var(--success-color);
            font-weight: 500;
        }

        .statut-icon {
            font-size: 1.5rem;
            margin-bottom: 8px;
            display: block;
        }
    </style>
</head>
<body>
<div class="container py-4 px-4">
    <!-- Header Section -->
    <div class="page-header d-flex justify-content-between align-items-center">
        <div>
            <h1 class="fs-2 fw-bold mb-0"><i class="bi bi-pencil-square me-2"></i>Modifier une Tâche</h1>
            <p class="text-muted mb-0">Mettez à jour les informations de la tâche</p>
        </div>
        <div class="quick-actions">
            <a href="../tasks" class="btn btn-outline-secondary"><i class="bi bi-arrow-left me-2"></i>Retour à la liste</a>
        </div>
    </div>

    <!-- Form Container -->
    <div class="form-container">
        <form action="${pageContext.request.contextPath}/task/edit" method="post">
            <input type="hidden" name="id" value="${task.id}">

            <div class="mb-4">
                <label for="description" class="form-label">Description de la tâche</label>
                <textarea class="form-control" id="description" name="description" rows="3" placeholder="Décrivez la tâche à effectuer..." required>${task.description}</textarea>
            </div>

            <div class="row mb-4">
                <div class="col-md-6 mb-3 mb-md-0">
                    <label for="employeeId" class="form-label">Assignée à</label>
                    <div class="input-icon-wrapper">
                        <select class="form-select" id="employeeId" name="employeeId" required>
                            <c:forEach var="employee" items="${employees}">
                                <option value="${employee.id}" ${task.employee.id == employee.id ? 'selected' : ''}>${employee.nom} ${employee.prenom}</option>
                            </c:forEach>
                        </select>
                        <span class="input-icon"><i class="bi bi-person"></i></span>
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="projectId" class="form-label">Projet associé</label>
                    <div class="input-icon-wrapper">
                        <select class="form-select" id="projectId" name="projectId" required>
                            <c:forEach var="project" items="${projects}">
                                <option value="${project.id}" ${task.project.id == project.id ? 'selected' : ''}>${project.nom}</option>
                            </c:forEach>
                        </select>
                        <span class="input-icon"><i class="bi bi-clipboard2"></i></span>
                    </div>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label">Statut de la tâche</label>
                <div class="statut-options">
                    <input type="radio" id="statut-todo" name="statut" value="A faire" class="statut-radio" ${task.statut == 'A faire' ? 'checked' : ''}>
                    <label for="statut-todo" class="statut-option todo">
                        <i class="bi bi-circle statut-icon"></i>
                        À faire
                    </label>

                    <input type="radio" id="statut-progress" name="statut" value="En cours" class="statut-radio" ${task.statut == 'En cours' ? 'checked' : ''}>
                    <label for="statut-progress" class="statut-option progress">
                        <i class="bi bi-play-circle statut-icon"></i>
                        En cours
                    </label>

                    <input type="radio" id="statut-completed" name="statut" value="Terminé" class="statut-radio" ${task.statut == 'Terminé' ? 'checked' : ''}>
                    <label for="statut-completed" class="statut-option completed">
                        <i class="bi bi-check-circle statut-icon"></i>
                        Terminé
                    </label>
                </div>
            </div>

            <div class="date-group mb-4">
                <div class="mb-3">
                    <label for="dateCreation" class="form-label">Date de création</label>
                    <div class="input-icon-wrapper">
                        <input type="date" class="form-control" id="dateCreation" name="dateCreation"
                               value="<fmt:formatDate value='${task.dateCreation}' pattern='yyyy-MM-dd' />" required>
                        <span class="input-icon"><i class="bi bi-calendar-plus"></i></span>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="dateEcheance" class="form-label">Date d'échéance</label>
                    <div class="input-icon-wrapper">
                        <input type="date" class="form-control" id="dateEcheance" name="dateEcheance"
                               value="<fmt:formatDate value='${task.dateEcheance}' pattern='yyyy-MM-dd' />" required>
                        <span class="input-icon"><i class="bi bi-calendar-check"></i></span>
                    </div>
                </div>
            </div>

            <div class="d-flex justify-content-end gap-2 mt-4">
                <a href="../tasks" class="btn btn-outline-secondary"><i class="bi bi-x-circle me-2"></i>Annuler</a>
                <button type="submit" class="btn btn-primary"><i class="bi bi-save me-2"></i>Enregistrer les modifications</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Ajout d'un petit script pour améliorer le comportement des boutons radio de statut
    document.querySelectorAll('.statut-radio').forEach(radio => {
        radio.addEventListener('change', function() {
            document.querySelectorAll('.statut-option').forEach(option => {
                option.classList.remove('active');
            });
            this.nextElementSibling.classList.add('active');
        });
    });
</script>
</body>
</html>
