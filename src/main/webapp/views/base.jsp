<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${not empty title ? title : 'Gestion d\'Entreprise'}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <i class="bi bi-building"></i> Gestion d'Entreprise
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link ${activePage == 'dashboard' ? 'active' : ''}"
                       href="${pageContext.request.contextPath}/dashboard">
                        <i class="bi bi-speedometer2"></i> Tableau de bord
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${activePage == 'employees' ? 'active' : ''}"
                       href="${pageContext.request.contextPath}/employees">
                        <i class="bi bi-people-fill"></i> Employés
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${activePage == 'departments' ? 'active' : ''}"
                       href="${pageContext.request.contextPath}/departments">
                        <i class="bi bi-building"></i> Départements
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${activePage == 'projects' ? 'active' : ''}"
                       href="${pageContext.request.contextPath}/projects">
                        <i class="bi bi-clipboard2-check"></i> Projets
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${activePage == 'tasks' ? 'active' : ''}"
                       href="${pageContext.request.contextPath}/tasks">
                        <i class="bi bi-list-check"></i> Tâches
                    </a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-person-circle"></i> ${employee.nom} ${employee.prenom}
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#">
                            <i class="bi bi-person"></i> Profil
                        </a></li>
                        <li><a class="dropdown-item" href="change-password">
                            <i class="bi bi-lock"></i> Changer mot de passe
                        </a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="logout">
                            <i class="bi bi-box-arrow-right"></i> Déconnexion
                        </a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Contenu principal -->
<main class="container mt-4">
    <jsp:include page="${contentPage}" />
</main>

<!-- Footer -->
<footer class="bg-dark text-white mt-5">
    <div class="container py-4">
        <div class="row">
            <div class="col-md-6">
                <h5><i class="bi bi-building"></i> Gestion d'Entreprise</h5>
                <p class="text-muted">Application de gestion des ressources humaines et projets.</p>
            </div>
            <div class="col-md-3">
                <h5>Liens</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-decoration-none text-muted">Aide</a></li>
                    <li><a href="#" class="text-decoration-none text-muted">Confidentialité</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h5>Contact</h5>
                <ul class="list-unstyled text-muted">
                    <li><i class="bi bi-envelope"></i> contact@entreprise.com</li>
                    <li><i class="bi bi-telephone"></i> +221 77 123 45 67</li>
                </ul>
            </div>
        </div>
        <hr>
        <div class="text-center text-muted">
            <small>&copy; 2023 ESMT - Tous droits réservés</small>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
</body>
</html>
