<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Tâches</title>
</head>
<body>
<h1>Liste des Tâches</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Description</th>
        <th>Statut</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${tasks}" var="task">
        <tr>
            <td>${task.id}</td>
            <td>${task.description}</td>
            <td>${task.statut}</td>
            <td>
                <form action="task" method="post">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="${task.id}">
                    <input type="submit" value="Supprimer">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<h2>Ajouter une Tâche</h2>
<form action="task" method="post">
    <input type="hidden" name="action" value="add">
    Description: <input type="text" name="description"><br>
    Statut: <input type="text" name="statut"><br>
    <input type="submit" value="Ajouter">
</form>
</body>
</html>
