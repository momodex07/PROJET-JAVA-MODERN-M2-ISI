<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${empty project ? 'Ajouter' : 'Modifier'} un Projet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h1 class="mb-4">${empty project ? 'Ajouter' : 'Modifier'} un Projet</h1>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <form action="${empty project ? 'project/add' : 'project/edit'}" method="post">
        <c:if test="${not empty project}">
            <input type="hidden" name="id" value="${project.id}">
        </c:if>

        <div class="mb-3">
            <label for="nom" class="form-label">Nom du projet</label>
            <input type="text" class="form-control" id="nom" name="nom"
                   value="${project.nom}" required>
        </div>

        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description"
                      rows="3">${project.description}</textarea>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="dateDebut" class="form-label">Date de début</label>
                <input type="date" class="form-control" id="dateDebut" name="dateDebut"
                       value="<fmt:formatDate value='${project.dateDebut}' pattern='yyyy-MM-dd' />" required>
            </div>
            <div class="col-md-6">
                <label for="dateFin" class="form-label">Date de fin</label>
                <input type="date" class="form-control" id="dateFin" name="dateFin"
                       value="<fmt:formatDate value='${project.dateFin}' pattern='yyyy-MM-dd' />" required>
            </div>
        </div>

        <div class="mb-3">
            <label for="statut" class="form-label">Statut</label>
            <select class="form-select" id="statut" name="statut" required>
                <option value="">Sélectionnez un statut</option>
                <option value="En cours" ${project.statut == 'En cours' ? 'selected' : ''}>En cours</option>
                <option value="Terminé" ${project.statut == 'Terminé' ? 'selected' : ''}>Terminé</option>
                <option value="En attente" ${project.statut == 'En attente' ? 'selected' : ''}>En attente</option>
            </select>
        </div>

        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <button type="submit" class="btn btn-primary me-md-2">
                ${empty project ? 'Ajouter' : 'Mettre à jour'}
            </button>
            <a href="projects" class="btn btn-secondary">Annuler</a>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
