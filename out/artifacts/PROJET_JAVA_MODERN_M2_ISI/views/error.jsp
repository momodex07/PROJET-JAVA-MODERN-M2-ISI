<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Erreur</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .error-container {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="error-container">
    <div>
        <h1 class="display-1 text-danger"><i class="bi bi-exclamation-triangle-fill"></i> Erreur</h1>
        <p class="lead">Une erreur est survenue lors du traitement de votre requête.</p>

        <c:if test="${not empty error}">
            <div class="alert alert-danger mt-4">
                <h4>Détails de l'erreur :</h4>
                <p>${error}</p>
            </div>
        </c:if>

        <a href="${pageContext.request.contextPath}/" class="btn btn-primary mt-4">
            <i class="bi bi-house-door"></i> Retour à l'accueil
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
