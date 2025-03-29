<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supprimer un Employé</title>
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

        .confirmation-box {
            max-width: 500px;
            margin: 100px auto;
            border: none;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            overflow: hidden;
            transition: all 0.25s ease;
        }

        .confirmation-box:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background: linear-gradient(45deg, #dc3545, #e35d6a);
            color: white;
            border: none;
            padding: 20px;
            position: relative;
        }

        .warning-icon {
            font-size: 2.2rem;
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            opacity: 0.8;
        }

        .card-body {
            padding: 30px;
            text-align: center;
        }

        .btn-container {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 25px;
        }

        .btn {
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 500;
            transition: all 0.2s;
        }

        .btn-danger {
            background: linear-gradient(45deg, #dc3545, #e35d6a);
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
    </style>
</head>
<body>
<div class="container">
    <div class="card confirmation-box">
        <div class="card-header">
            <h3 class="fs-4 fw-bold mb-0"><i class="bi bi-exclamation-triangle me-2"></i>Confirmation de suppression</h3>
            <div class="warning-icon">
                <i class="bi bi-exclamation-circle"></i>
            </div>
        </div>
        <div class="card-body">
            <p class="lead fw-bold mb-3">Êtes-vous sûr de vouloir supprimer cet employé ?</p>
            <p class="text-muted mb-4">Cette action est irréversible et supprimera définitivement toutes les données associées à cet employé.</p>
            <form action="${pageContext.request.contextPath}/employee/delete" method="post">
                <input type="hidden" name="id" value="${param.id}">
                <div class="btn-container">
                    <button type="submit" class="btn btn-danger">
                        <i class="bi bi-trash me-2"></i>Confirmer la suppression
                    </button>
                    <a href="${pageContext.request.contextPath}/employees" class="btn btn-secondary">
                        <i class="bi bi-arrow-left me-2"></i>Annuler
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
