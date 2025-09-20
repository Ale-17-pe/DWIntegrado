// Script para navegación entre secciones
document.addEventListener('DOMContentLoaded', function() {
    // Seleccionar elementos de navegación
    const navItems = document.querySelectorAll('.nav-item');
    const sections = document.querySelectorAll('.section');

    // Agregar evento click a cada elemento de navegación
    navItems.forEach(item => {
        item.addEventListener('click', function() {
            const sectionId = this.getAttribute('data-section');

            navItems.forEach(i => i.classList.remove('active'));
            sections.forEach(s => s.classList.remove('active'));

            this.classList.add('active');

            // Mostrar la sección correspondiente
            document.getElementById(`${sectionId}-section`).classList.add('active');
        });
    });

    // Función para cerrar sesión y redirigir a index.html
    const logoutButton = document.getElementById('logoutButton');
    logoutButton.addEventListener('click', function() {
        if(confirm('¿Estás seguro de que quieres cerrar sesión?')) {
            // Aquí puedes agregar lógica adicional para limpiar la sesión si es necesario

            // Redirigir a la página index.html después de 1 segundo
            setTimeout(function() {
                window.location.href = 'index.jsp';
            }, 1000);

            // Mensaje de confirmación
            alert('Sesión cerrada con éxito. Redirigiendo...');
        }
    });

    // Agregar animaciones a las tarjetas al hacer hover
    const cards = document.querySelectorAll('.card');
    cards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-5px)';
        });

        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
        });
    });

    // Manejo del formulario de creación de planes
    const planForm = document.getElementById('planForm');
    if (planForm) {
        planForm.addEventListener('submit', function(e) {
            e.preventDefault();

            // Obtener valores del formulario
            const planName = document.getElementById('planName').value;
            const planPrice = document.getElementById('planPrice').value;
            const planDuration = document.getElementById('planDuration').value;
            const planStatus = document.getElementById('planStatus').value;
            const planDescription = document.getElementById('planDescription').value;
            const planFeatures = document.getElementById('planFeatures').value;

            // Aquí iría la lógica para enviar los datos al servidor
            // Por ahora, solo mostraremos un mensaje de éxito
            alert(`Plan "${planName}" creado exitosamente!\nPrecio: $${planPrice}\nDuración: ${planDuration} días`);

            // Limpiar formulario
            planForm.reset();
        });
    }

    // Funcionalidad para botones de editar y eliminar planes
    const editButtons = document.querySelectorAll('.btn-edit');
    const deleteButtons = document.querySelectorAll('.btn-delete');

    editButtons.forEach(button => {
        button.addEventListener('click', function() {
            const card = this.closest('.plan-item, .content-card');
            const title = card.querySelector('h4').textContent;
            alert(`Editando: ${title}`);
            // Aquí iría la lógica para cargar los datos en el formulario
        });
    });

    deleteButtons.forEach(button => {
        button.addEventListener('click', function() {
            const card = this.closest('.plan-item, .content-card');
            const title = card.querySelector('h4').textContent;

            if(confirm(`¿Estás seguro de que quieres eliminar "${title}"?`)) {
                card.remove();
                alert(`"${title}" eliminado exitosamente`);
            }
        });
    });

    // Switch styling
    const switches = document.querySelectorAll('.switch');
    switches.forEach(switchElem => {
        switchElem.addEventListener('click', function() {
            const checkbox = this.querySelector('input[type="checkbox"]');
            checkbox.checked = !checkbox.checked;
        });
    });
});
