<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://xmlns.jcp.org/jsp/jstl/core" prefix="c" %>


<html>
<head>
    <title>Tableau de Bord</title>
</head>
<body>
<h1>Tableau de Bord</h1>
<p>Bienvenue, ${user}!</p>
<ul>
    <li><a href="employee">Gérer les Employés</a></li>
    <li><a href="department">Gérer les Départements</a></li>
    <li><a href="project">Gérer les Projets</a></li>
    <li><a href="task">Gérer les Tâches</a></li>
</ul>
<form action="logout" method="get">
    <input type="submit" value="Déconnexion">
</form>
</body>
</html>
