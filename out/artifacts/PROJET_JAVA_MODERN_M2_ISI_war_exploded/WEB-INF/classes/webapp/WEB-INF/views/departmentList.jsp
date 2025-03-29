<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Départements</title>
</head>
<body>
<h1>Liste des Départements</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Description</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${departments}" var="department">
        <tr>
            <td>${department.id}</td>
            <td>${department.nom}</td>
            <td>${department.description}</td>
            <td>
                <form action="department" method="post">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="${department.id}">
                    <input type="submit" value="Supprimer">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<h2>Ajouter un Département</h2>
<form action="department" method="post">
    <input type="hidden" name="action" value="add">
    Nom: <input type="text" name="nom"><br>
    Description: <input type="text" name="description"><br>
    <input type="submit" value="Ajouter">
</form>
</body>
</html>
