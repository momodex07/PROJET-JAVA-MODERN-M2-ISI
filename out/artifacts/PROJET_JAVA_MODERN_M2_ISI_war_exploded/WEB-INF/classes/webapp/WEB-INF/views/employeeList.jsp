<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Employés</title>
</head>
<body>
<h1>Liste des Employés</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Email</th>
        <th>Rôle</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${employees}" var="employee">
        <tr>
            <td>${employee.id}</td>
            <td>${employee.nom}</td>
            <td>${employee.prenom}</td>
            <td>${employee.email}</td>
            <td>${employee.role}</td>
            <td>
                <form action="employee" method="post">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="${employee.id}">
                    <input type="submit" value="Supprimer">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<h2>Ajouter un Employé</h2>
<form action="employee" method="post">
    <input type="hidden" name="action" value="add">
    Nom: <input type="text" name="nom"><br>
    Prénom: <input type="text" name="prenom"><br>
    Email: <input type="text" name="email"><br>
    Rôle: <input type="text" name="role"><br>
    <input type="submit" value="Ajouter">
</form>
</body>
</html>
