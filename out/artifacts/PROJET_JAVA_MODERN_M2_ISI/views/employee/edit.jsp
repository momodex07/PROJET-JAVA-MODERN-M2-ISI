<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un Employé</title>
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

        .form-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 20px;
            color: var(--primary-color);
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 8px 20px;
            border-radius: 8px;
            font-weight: 500;
        }

        .btn-primary:hover {
            background-color: #3a56d4;
            border-color: #3a56d4;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            padding: 8px 20px;
            border-radius: 8px;
            font-weight: 500;
        }

        .form-control, .form-select {
            border-radius: 8px;
            padding: 10px 15px;
            border: 1px solid #ced4da;
            transition: all 0.2s ease;
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

        .quick-actions .btn {
            border-radius: 8px;
            margin-right: 10px;
            padding: 8px 15px;
            font-weight: 500;
        }

        .employee-info-badge {
            display: inline-block;
            padding: 4px 12px;
            background-color: var(--info-color);
            color: white;
            border-radius: 20px;
            font-size: 0.85rem;
            margin-left: 10px;
        }
    </style>
</head>
<body>
<div class="container-fluid py-4 px-4">
    <!-- Header Section -->
    <div class="form-header d-flex justify-content-between align-items-center">
        <div>
            <h1 class="fs-2 fw-bold mb-0">
                <i class="bi bi-person-gear me-2"></i>Modifier un Employé
                <span class="employee-info-badge">ID: ${employee.id}</span>
            </h1>
            <p class="text-muted mb-0">Modifiez les informations de l'employé</p>
        </div>
        <div class="quick-actions">
            <a href="${pageContext.request.contextPath}/employees" class="btn btn-outline-secondary">
                <i class="bi bi-arrow-left me-2"></i>Retour à la liste
            </a>
        </div>
    </div>

    <!-- Form Container -->
    <div class="form-container">
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <h3 class="form-title">Informations de l'employé</h3>
                <form action="${pageContext.request.contextPath}/employee/edit" method="post">
                    <input type="hidden" name="id" value="${employee.id}">

                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="nom" class="form-label required-field">Nom</label>
                            <input type="text" class="form-control" id="nom" name="nom" value="${employee.nom}" required placeholder="Entrez le nom de famille">
                        </div>
                        <div class="col-md-6">
                            <label for="prenom" class="form-label required-field">Prénom</label>
                            <input type="text" class="form-control" id="prenom" name="prenom" value="${employee.prenom}" required placeholder="Entrez le prénom">
                        </div>
                    </div>

                    <div class="mb-3 mt-3">
                        <label for="email" class="form-label required-field">Email</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                            <input type="email" class="form-control" id="email" name="email" value="${employee.email}" required placeholder="exemple@entreprise.com">
                        </div>
                    </div>

                    <div class="row g-3 mb-3">
                        <div class="col-md-6">
                            <label for="departmentId" class="form-label required-field">Département</label>
                            <select class="form-select" id="departmentId" name="departmentId" required>
                                <option value="">Sélectionnez un département</option>
                                <c:forEach var="department" items="${departments}">
                                    <option value="${department.id}" ${employee.department.id == department.id ? 'selected' : ''}>${department.nom}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="role" class="form-label required-field">Rôle</label>
                            <select class="form-select" id="role" name="role" required>
                                <option value="admin" ${employee.role == 'admin' ? 'selected' : ''}>Administrateur</option>
                                <option value="manager" ${employee.role == 'manager' ? 'selected' : ''}>Gestionnaire</option>
                                <option value="employee" ${employee.role == 'employee' ? 'selected' : ''}>Employé</option>
                            </select>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label for="password" class="form-label required-field">Mot de passe</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-key"></i></span>
                            <input type="password" class="form-control" id="password" name="password" value="${employee.password}" required>
                            <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                <i class="bi bi-eye"></i>
                            </button>
                        </div>
                        <div class="form-text text-muted">
                            Laissez vide pour conserver le mot de passe actuel
                        </div>
                    </div>

                    <div class="d-flex justify-content-between pt-3 border-top">
                        <a href="${pageContext.request.contextPath}/employees" class="btn btn-outline-secondary">
                            <i class="bi bi-x-circle me-2"></i>Annuler
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-save me-2"></i>Enregistrer les modifications
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Toggle password visibility
    document.getElementById('togglePassword').addEventListener('click', function() {
        const passwordInput = document.getElementById('password');
        const icon = this.querySelector('i');

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            icon.classList.remove('bi-eye');
            icon.classList.add('bi-eye-slash');
        } else {
            passwordInput.type = 'password';
            icon.classList.remove('bi-eye-slash');
            icon.classList.add('bi-eye');
        }
    });
</script>
</body>
</html>
