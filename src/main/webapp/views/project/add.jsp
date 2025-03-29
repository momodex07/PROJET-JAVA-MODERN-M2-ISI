<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Projet</title>
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

        .form-header {
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

        .btn-secondary {
            background: transparent;
            color: #6c757d;
            border: 1px solid #6c757d;
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 500;
            transition: all 0.25s ease;
        }

        .btn-secondary:hover {
            background-color: #f8f9fa;
            transform: translateY(-2px);
        }

        .form-control, .form-select {
            border-radius: 8px;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.25);
        }

        .form-label {
            font-weight: 500;
            margin-bottom: 8px;
            color: #495057;
        }

        .required-field::after {
            content: "*";
            color: #dc3545;
            margin-left: 4px;
        }

        .input-group-text {
            background-color: #f8f9fa;
            border-radius: 8px 0 0 8px;
            border: 1px solid #e0e0e0;
            border-right: none;
        }

        .project-info-card {
            background: linear-gradient(45deg, rgba(67, 97, 238, 0.05), rgba(72, 149, 239, 0.05));
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container py-4 px-4">
    <!-- Header Section -->
    <div class="form-header d-flex justify-content-between align-items-center">
        <div>
            <h1 class="fs-2 fw-bold mb-0"><i class="bi bi-clipboard2-plus me-2"></i>Ajouter un Projet</h1>
            <p class="text-muted mb-0">Créez un nouveau projet pour votre équipe</p>
        </div>
        <div class="quick-actions">
            <a href="../projects" class="btn btn-outline-secondary"><i class="bi bi-arrow-left me-2"></i>Retour aux Projets</a>
        </div>
    </div>

    <!-- Project Form -->
    <div class="form-container">
        <div class="project-info-card mb-4">
            <div class="d-flex align-items-center">
                <i class="bi bi-info-circle-fill me-2 text-primary"></i>
                <p class="mb-0">Complétez les informations ci-dessous pour créer un nouveau projet. Les champs marqués d'un astérisque (*) sont obligatoires.</p>
            </div>
        </div>

        <form action="${pageContext.request.contextPath}/project/add" method="post">
            <div class="row g-4">
                <div class="col-md-12">
                    <label for="nom" class="form-label required-field">Nom du projet</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-bookmark-fill"></i></span>
                        <input type="text" class="form-control" id="nom" name="nom" placeholder="Entrez le nom du projet" required>
                    </div>
                </div>

                <div class="col-md-12">
                    <label for="description" class="form-label">Description</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-text-paragraph"></i></span>
                        <textarea class="form-control" id="description" name="description" rows="4" placeholder="Décrivez l'objectif et le périmètre du projet"></textarea>
                    </div>
                </div>

                <div class="col-md-6">
                    <label for="dateDebut" class="form-label required-field">Date de début</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-calendar-event"></i></span>
                        <input type="date" class="form-control" id="dateDebut" name="dateDebut" required>
                    </div>
                </div>

                <div class="col-md-6">
                    <label for="dateFin" class="form-label required-field">Date de fin</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-calendar-check"></i></span>
                        <input type="date" class="form-control" id="dateFin" name="dateFin" required>
                    </div>
                </div>

                <div class="col-md-6">
                    <label for="statut" class="form-label required-field">Statut</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-flag-fill"></i></span>
                        <select class="form-select" id="statut" name="statut" required>
                            <option value="" selected disabled>Sélectionnez un statut</option>
                            <option value="En attente">En attente</option>
                            <option value="En cours">En cours</option>
                            <option value="Terminé">Terminé</option>
                        </select>
                    </div>
                </div>

                <div class="col-md-6">
                    <label for="chef" class="form-label">Chef de projet</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                        <select class="form-select" id="chef" name="chef">
                            <option value="" selected disabled>Sélectionnez un chef de projet</option>
                            <c:forEach var="employee" items="${chefs}">
                                <option value="${employee.id}">${employee.nom} ${employee.prenom}</option>
                            </c:forEach>
                            <!-- Option par défaut si la liste est vide -->
                            <c:if test="${empty chefs}">
                                <option value="1">Marie Dupont</option>
                                <option value="2">Jean Martin</option>
                                <option value="3">Sophie Bernard</option>
                            </c:if>
                        </select>
                    </div>
                </div>

                <div class="col-12 mt-4">
                    <div class="d-flex justify-content-end gap-3">
                        <a href="../projects" class="btn btn-secondary"><i class="bi bi-x-circle me-2"></i>Annuler</a>
                        <button type="submit" class="btn btn-primary"><i class="bi bi-save me-2"></i>Ajouter le Projet</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Script pour vérifier que la date de fin est postérieure à la date de début
    document.addEventListener('DOMContentLoaded', function() {
        const dateDebut = document.getElementById('dateDebut');
        const dateFin = document.getElementById('dateFin');

        function updateMinEndDate() {
            dateFin.min = dateDebut.value;
            if(dateFin.value && dateFin.value < dateDebut.value) {
                dateFin.value = dateDebut.value;
            }
        }

        dateDebut.addEventListener('change', updateMinEndDate);

        // Initialiser avec la date d'aujourd'hui
        const today = new Date().toISOString().split('T')[0];
        dateDebut.min = today;
        dateDebut.value = today;
        updateMinEndDate();
    });
</script>
</body>
</html>
