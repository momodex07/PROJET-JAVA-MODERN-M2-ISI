<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Supprimer une Tâche</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <div class="card">
        <div class="card-header bg-danger text-white">
            <h3>Confirmation de suppression</h3>
        </div>
        <div class="card-body">
            <p>Êtes-vous sûr de vouloir supprimer cette tâche ? Cette action est irréversible.</p>
            <form action="${pageContext.request.contextPath}/task/delete" method="post">
                <input type="hidden" name="id" value="${param.id}">
                <button type="submit" class="btn btn-danger">Confirmer la suppression</button>
                <a href="../tasks" class="btn btn-secondary">Annuler</a>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
