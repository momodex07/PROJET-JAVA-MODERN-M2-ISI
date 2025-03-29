<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un Département</title>
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

        .form-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            padding: 30px;
            margin-bottom: 25px;
        }

        .dashboard-header {
            background-color: var(--header-bg);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 25px;
            box-shadow: var(--card-shadow);
        }

        .btn {
            border-radius: 8px;
            padding: 8px 15px;
            font-weight: 500;
        }

        .btn-primary {
            background: linear-gradient(45deg, #4361ee, #4895ef);
            border: none;
        }

        .btn-primary:hover {
            background: linear-gradient(45deg, #3a56d4, #3f84e0);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .btn-secondary {
            background: #6c757d;
            border: none;
        }

        .btn-secondary:hover {
            background: #5a6268;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-control {
            border-radius: 8px;
            padding: 10px 15px;
            border: 1px solid #ced4da;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.25);
        }
    </style>
</head>
<body>
<div class="container py-4 px-4">
    <!-- Header Section -->
    <div class="dashboard-header d-flex justify-content-between align-items-center">
        <div>
            <h1 class="fs-2 fw-bold mb-0"><i class="bi bi-building me-2"></i>Modifier un Département</h1>
            <p class="text-muted mb-0">Modifier les informations du département</p>
        </div>
        <div class="quick-actions">
            <a href="${pageContext.request.contextPath}/departments" class="btn btn-outline-secondary">
                <i class="bi bi-arrow-left me-2"></i>Retour à la liste
            </a>
        </div>
    </div>

    <!-- Form Container -->
    <div class="form-container">
        <form action="${pageContext.request.contextPath}/department/edit" method="post">
            <input type="hidden" name="id" value="${department.id}">

            <div class="mb-4">
                <label for="nom" class="form-label fw-medium">Nom</label>
                <input type="text" class="form-control" id="nom" name="nom" value="${department.nom}" required>
            </div>

            <div class="mb-4">
                <label for="description" class="form-label fw-medium">Description</label>
                <textarea class="form-control" id="description" name="description" rows="4">${department.description}</textarea>
            </div>

            <div class="d-flex gap-3 mt-4">
                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-check-circle me-2"></i>Enregistrer
                </button>
                <a href="${pageContext.request.contextPath}/departments" class="btn btn-secondary">
                    <i class="bi bi-x-circle me-2"></i>Annuler
                </a>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
