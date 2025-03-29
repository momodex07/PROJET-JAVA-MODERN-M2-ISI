<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Gestion des Employés</title>
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
    </tr>
    <c:forEach items="${employees}" var="employee">
        <tr>
            <td>${employee.id}</td>
            <td>${employee.nom}</td>
            <td>${employee.prenom}</td>
            <td>${employee.email}</td>
            <td>${employee.role}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
