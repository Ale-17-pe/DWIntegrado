      // Script básico para interactividad
        document.addEventListener('DOMContentLoaded', function() {
            // Seleccionar elementos de navegación
            const navItems = document.querySelectorAll('.nav-item');
            
            // Agregar evento click a cada elemento de navegación
            navItems.forEach(item => {
                item.addEventListener('click', function() {
                    // Remover clase active de todos los elementos
                    navItems.forEach(i => i.classList.remove('active'));
                    // Agregar clase active al elemento clickeado
                    this.classList.add('active');
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
        });