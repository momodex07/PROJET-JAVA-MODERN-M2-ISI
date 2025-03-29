<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supprimer un Département</title>
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
            transition: all 0.25s ease;
            overflow: hidden;
            margin-top: 3rem;
        }

        .confirmation-header {
            background: linear-gradient(45deg, #dc3545, #ef5350);
            color: white;
            padding: 20px;
            border-radius: 12px 12px 0 0;
        }

        .confirmation-body {
            padding: 30px;
            background-color: white;
        }

        .btn {
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 500;
            transition: all 0.25s ease;
        }

        .btn-danger {
            background: linear-gradient(45deg, #dc3545, #ef5350);
            border: none;
        }

        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(220, 53, 69, 0.3);
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }

        .btn-secondary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(108, 117, 125, 0.3);
        }

        .alert-icon {
            font-size: 2.5rem;
            margin-right: 15px;
        }

        .confirmation-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 0;
        }

        .confirmation-text {
            font-size: 1.1rem;
            margin: 20px 0;
            line-height: 1.6;
        }
    </style>
</head>
<body>
<div class="container py-4">
    <!-- Header Section (Optional) -->
    <div class="d-flex align-items-center mb-4">
        <a href="${pageContext.request.contextPath}/departments" class="text-decoration-none text-secondary">
            <i class="bi bi-arrow-left me-2"></i>Retour aux départements
        </a>
    </div>

    <!-- Confirmation Card -->
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="confirmation-card">
                <div class="confirmation-header d-flex align-items-center">
                    <i class="bi bi-exclamation-triangle-fill alert-icon"></i>
                    <h3 class="confirmation-title">Confirmation de suppression</h3>
                </div>
                <div class="confirmation-body">
                    <p class="confirmation-text">
                        Êtes-vous sûr de vouloir supprimer ce département ? Cette action est irréversible et tous les employés associés à ce département seront affectés.
                    </p>
                    <form action="${pageContext.request.contextPath}/department/delete" method="post">
                        <input type="hidden" name="id" value="${param.id}">
                        <div class="d-flex justify-content-end gap-3 mt-4">
                            <a href="${pageContext.request.contextPath}/departments" class="btn btn-secondary">
                                <i class="bi bi-x-circle me-2"></i>Annuler
                            </a>
                            <button type="submit" class="btn btn-danger">
                                <i class="bi bi-trash me-2"></i>Confirmer la suppression
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
