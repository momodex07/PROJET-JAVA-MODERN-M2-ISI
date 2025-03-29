<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Projets</title>
</head>
<body>
<h1>Liste des Projets</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Description</th>
        <th>Date de Début</th>
        <th>Date de Fin</th>
        <th>Statut</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${projects}" var="project">
        <tr>
            <td>${project.id}</td>
            <td>${project.nom}</td>
            <td>${project.description}</td>
            <td>${project.dateDebut}</td>
            <td>${project.dateFin}</td>
            <td>${project.statut}</td>
            <td>
                <form action="project" method="post">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="${project.id}">
                    <input type="submit" value="Supprimer">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<h2>Ajouter un Projet</h2>
<form action="project" method="post">
    <input type="hidden" name="action" value="add">
    Nom: <input type="text" name="nom"><br>
    Description: <input type="text" name="description"><br>
    Date de Début: <input type="date" name="dateDebut"><br>
    Date de Fin: <input type="date" name="dateFin"><br>
    Statut: <input type="text" name="statut"><br>
    <input type="submit" value="Ajouter">
</form>
</body>
</html>
