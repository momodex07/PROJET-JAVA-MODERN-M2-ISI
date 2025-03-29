// Initialisation des tooltips Bootstrap
document.addEventListener('DOMContentLoaded', function() {
  const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
  tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
  });

  // Confirmation avant suppression
  document.querySelectorAll('.confirm-delete').forEach(button => {
    button.addEventListener('click', (e) => {
      if (!confirm('Êtes-vous sûr de vouloir supprimer cet élément ?')) {
        e.preventDefault();
      }
    });
  });
});
