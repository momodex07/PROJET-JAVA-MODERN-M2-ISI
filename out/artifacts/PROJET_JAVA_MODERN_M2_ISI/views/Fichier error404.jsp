<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Page non trouvée</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex align-items-center">
<div class="container text-center">
    <h1 class="display-1">404</h1>
    <p class="lead">La page que vous recherchez n'existe pas.</p>
    <a href="${pageContext.request.contextPath}/" class="btn btn-primary">
        Retour à l'accueil
    </a>
</div>
</body>
</html>
