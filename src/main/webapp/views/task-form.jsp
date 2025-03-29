<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${empty task ? 'Ajouter' : 'Modifier'} une Tâche</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h1 class="mb-4">${empty task ? 'Ajouter' : 'Modifier'} une Tâche</h1>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <form action="${empty task ? 'task/add' : 'task/edit'}" method="post">
        <c:if test="${not empty task}">
            <input type="hidden" name="id" value="${task.id}">
        </c:if>

        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description"
                      rows="3" required>${task.description}</textarea>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="projectId" class="form-label">Projet</label>
                <select class="form-select" id="projectId" name="projectId" required>
                    <option value="">Sélectionnez un projet</option>
                    <c:forEach items="${projects}" var="project">
                        <option value="${project.id}"
                            ${task.project.id == project.id ? 'selected' : ''}>
                                ${project.nom}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-6">
                <label for="employeeId" class="form-label">Assignée à</label>
                <select class="form-select" id="employeeId" name="employeeId" required>
                    <option value="">Sélectionnez un employé</option>
                    <c:forEach items="${employees}" var="employee">
                        <option value="${employee.id}"
                            ${task.employee.id == employee.id ? 'selected' : ''}>
                                ${employee.nom} ${employee.prenom}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="dateCreation" class="form-label">Date de création</label>
                <input type="date" class="form-control" id="dateCreation" name="dateCreation"
                       value="<fmt:formatDate value='${task.dateCreation}' pattern='yyyy-MM-dd' />" required>
            </div>
            <div class="col-md-6">
                <label for="dateEcheance" class="form-label">Date d'échéance</label>
                <input type="date" class="form-control" id="dateEcheance" name="dateEcheance"
                       value="<fmt:formatDate value='${task.dateEcheance}' pattern='yyyy-MM-dd' />" required>
            </div>
        </div>

        <div class="mb-3">
            <label for="statut" class="form-label">Statut</label>
            <select class="form-select" id="statut" name="statut" required>
                <option value="">Sélectionnez un statut</option>
                <option value="En cours" ${task.statut == 'En cours' ? 'selected' : ''}>En cours</option>
                <option value="Terminé" ${task.statut == 'Terminé' ? 'selected' : ''}>Terminé</option>
                <option value="En attente" ${task.statut == 'En attente' ? 'selected' : ''}>En attente</option>
            </select>
        </div>

        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <button type="submit" class="btn btn-primary me-md-2">
                ${empty task ? 'Ajouter' : 'Mettre à jour'}
            </button>
            <a href="tasks" class="btn btn-secondary">Annuler</a>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
