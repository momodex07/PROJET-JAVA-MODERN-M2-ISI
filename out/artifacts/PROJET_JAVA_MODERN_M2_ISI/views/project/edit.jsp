<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modifier un Projet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <%@include file="../partial/sidebar.jsp" %>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Modifier le Projet</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <a href="${pageContext.request.contextPath}/projects" class="btn btn-secondary">
                        <i class="bi bi-arrow-left"></i> Retour
                    </a>
                </div>
            </div>

            <div class="card shadow">
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/project/edit" method="post">
                        <input type="hidden" name="id" value="${project.id}">

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="nom" class="form-label">Nom du projet</label>
                                <input type="text" class="form-control" id="nom" name="nom"
                                       value="${project.nom}" required>
                            </div>
                            <div class="col-md-6">
                                <label for="statut" class="form-label">Statut</label>
                                <select class="form-select" id="statut" name="statut" required>
                                    <option value="En attente" ${project.statut == 'En attente' ? 'selected' : ''}>En attente</option>
                                    <option value="En cours" ${project.statut == 'En cours' ? 'selected' : ''}>En cours</option>
                                    <option value="Terminé" ${project.statut == 'Terminé' ? 'selected' : ''}>Terminé</option>
                                </select>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="dateDebut" class="form-label">Date de début</label>
                                <input type="date" class="form-control" id="dateDebut" name="dateDebut"
                                       value="<fmt:formatDate value="${project.dateDebut}" pattern="yyyy-MM-dd" />" required>
                            </div>
                            <div class="col-md-6">
                                <label for="dateFin" class="form-label">Date de fin</label>
                                <input type="date" class="form-control" id="dateFin" name="dateFin"
                                       value="<fmt:formatDate value="${project.dateFin}" pattern="yyyy-MM-dd" />" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="3">${project.description}</textarea>
                        </div>

                        <div class="text-end">
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-save"></i> Enregistrer les modifications
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</body>
</html>
