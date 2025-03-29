<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${empty department ? 'Ajouter' : 'Modifier'} un Département</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h1 class="mb-4">${empty department ? 'Ajouter' : 'Modifier'} un Département</h1>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <form action="${empty department ? 'department/add' : 'department/edit'}" method="post">
        <c:if test="${not empty department}">
            <input type="hidden" name="id" value="${department.id}">
        </c:if>

        <div class="mb-3">
            <label for="nom" class="form-label">Nom du département</label>
            <input type="text" class="form-control" id="nom" name="nom"
                   value="${department.nom}" required>
        </div>

        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description"
                      rows="3">${department.description}</textarea>
        </div>

        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <button type="submit" class="btn btn-primary me-md-2">
                ${empty department ? 'Ajouter' : 'Mettre à jour'}
            </button>
            <a href="departments" class="btn btn-secondary">Annuler</a>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
