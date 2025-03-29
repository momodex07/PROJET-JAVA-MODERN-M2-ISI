<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${empty employee ? 'Ajouter' : 'Modifier'} un Employé</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h1 class="mb-4">${empty employee ? 'Ajouter' : 'Modifier'} un Employé</h1>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <form action="${empty employee ? 'employee/add' : 'employee/edit'}" method="post">
        <c:if test="${not empty employee}">
            <input type="hidden" name="id" value="${employee.id}">
        </c:if>

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="nom" class="form-label">Nom</label>
                <input type="text" class="form-control" id="nom" name="nom"
                       value="${employee.nom}" required>
            </div>
            <div class="col-md-6">
                <label for="prenom" class="form-label">Prénom</label>
                <input type="text" class="form-control" id="prenom" name="prenom"
                       value="${employee.prenom}" required>
            </div>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email"
                   value="${employee.email}" required>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="departmentId" class="form-label">Département</label>
                <select class="form-select" id="departmentId" name="departmentId" required>
                    <option value="">Sélectionnez un département</option>
                    <c:forEach items="${departments}" var="department">
                        <option value="${department.id}"
                            ${employee.department.id == department.id ? 'selected' : ''}>
                                ${department.nom}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-6">
                <label for="role" class="form-label">Rôle</label>
                <select class="form-select" id="role" name="role" required>
                    <option value="">Sélectionnez un rôle</option>
                    <option value="admin" ${employee.role == 'admin' ? 'selected' : ''}>Administrateur</option>
                    <option value="manager" ${employee.role == 'manager' ? 'selected' : ''}>Manager</option>
                    <option value="employee" ${employee.role == 'employee' ? 'selected' : ''}>Employé</option>
                </select>
            </div>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Mot de passe</label>
            <input type="password" class="form-control" id="password" name="password"
                   value="${employee.password}" required>
        </div>

        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <button type="submit" class="btn btn-primary me-md-2">
                ${empty employee ? 'Ajouter' : 'Mettre à jour'}
            </button>
            <a href="employees" class="btn btn-secondary">Annuler</a>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
