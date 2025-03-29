<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supprimer un Projet</title>
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

        .confirmation-card {
            border-radius: 12px;
            border: none;
            box-shadow: var(--card-shadow);
            overflow: hidden;
            margin-top: 50px;
        }

        .card-header {
            background: linear-gradient(45deg, #dc3545, #e35d6a);
            padding: 20px;
            border-bottom: none;
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 0;
        }

        .card-body {
            padding: 30px;
        }

        .confirmation-message {
            font-size: 1.1rem;
            margin-bottom: 25px;
        }

        .btn {
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 500;
            transition: all 0.25s ease;
        }

        .btn-danger {
            background: linear-gradient(45deg, #dc3545, #e35d6a);
            border: none;
        }

        .btn-danger:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(220, 53, 69, 0.3);
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }

        .btn-secondary:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(108, 117, 125, 0.3);
        }
    </style>
</head>
<body>
<div class="container py-4 px-4">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="confirmation-card">
                <div class="card-header text-white">
                    <h1 class="card-title">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>
                        Confirmation de suppression
                    </h1>
                </div>
                <div class="card-body">
                    <p class="confirmation-message">
                        <i class="bi bi-info-circle me-2"></i>
                        Êtes-vous sûr de vouloir supprimer ce projet ? Toutes les tâches associées seront également supprimées.
                    </p>
                    <form action="${pageContext.request.contextPath}/project/delete" method="post">
                        <input type="hidden" name="id" value="${param.id}">
                        <div class="d-flex gap-3">
                            <button type="submit" class="btn btn-danger">
                                <i class="bi bi-trash3 me-2"></i>
                                Confirmer la suppression
                            </button>
                            <a href="${pageContext.request.contextPath}/projects" class="btn btn-secondary">
                                <i class="bi bi-x-circle me-2"></i>
                                Annuler
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
