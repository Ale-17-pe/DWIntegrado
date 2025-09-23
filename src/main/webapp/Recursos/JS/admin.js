// JavaScript para el portal de administrador
document.addEventListener('DOMContentLoaded', function() {
    // Navegación entre secciones
    const navItems = document.querySelectorAll('.nav-item');
    const sections = document.querySelectorAll('.section');

    navItems.forEach(item => {
        item.addEventListener('click', function() {
            const sectionId = this.getAttribute('data-section');
            navItems.forEach(i => i.classList.remove('active'));
            sections.forEach(s => s.classList.remove('active'));
            this.classList.add('active');
            document.getElementById(`${sectionId}-section`).classList.add('active');
        });
    });

    // Modal functionality
    const modals = document.querySelectorAll('.modal');
    const openModalButtons = document.querySelectorAll('[data-target]');
    const closeModalButtons = document.querySelectorAll('[data-dismiss="modal"]');

    openModalButtons.forEach(button => {
        button.addEventListener('click', function() {
            const modalId = this.getAttribute('data-target');
            document.getElementById(modalId).style.display = 'block';
        });
    });

    closeModalButtons.forEach(button => {
        button.addEventListener('click', function() {
            this.closest('.modal').style.display = 'none';
        });
    });

    modals.forEach(modal => {
        modal.addEventListener('click', function(e) {
            if (e.target === this) this.style.display = 'none';
        });
    });

    // Logout
    document.getElementById('logoutButton').addEventListener('click', function() {
        if(confirm('¿Estás seguro de que quieres cerrar sesión?')) {
            window.location.href = 'LogoutServlet';
        }
    });

    // Validación de formularios
    const forms = document.querySelectorAll('form');
    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            if (!this.checkValidity()) {
                e.preventDefault();
                alert('Por favor, complete todos los campos requeridos correctamente.');
            }
        });
    });
});

// Funciones para usuarios
function filtrarUsuarios() {
    const searchText = document.getElementById('userSearch').value.toLowerCase();
    const filterStatus = document.getElementById('userStatus').value;
    const filterRole = document.getElementById('userRole').value;

    const rows = document.querySelectorAll('#tablaUsuarios tbody tr');

    rows.forEach(row => {
        const nombre = row.cells[1].textContent.toLowerCase();
        const email = row.cells[2].textContent.toLowerCase();
        const estado = row.getAttribute('data-estado');
        const rol = row.getAttribute('data-rol');

        const matchesSearch = nombre.includes(searchText) || email.includes(searchText);
        const matchesStatus = !filterStatus || estado === filterStatus;
        const matchesRole = !filterRole || rol === filterRole;

        row.style.display = (matchesSearch && matchesStatus && matchesRole) ? '' : 'none';
    });
}

function editarUsuario(idUsuario) {
    fetch(`AdminUsuarioServlet?action=obtener&id=${idUsuario}`)
        .then(response => {
            if (!response.ok) {
                throw new Error("Error al obtener usuario");
            }
            return response.json();
        })
        .then(usuario => {
            document.getElementById("editUserId").value = usuario.id_usuario;
            document.getElementById("editUserName").value = usuario.nombre;
            document.getElementById("editUserLastName").value = usuario.apellido;
            document.getElementById("editUserEmail").value = usuario.email;
            document.getElementById("editUserDNI").value = usuario.dni;
            document.getElementById("editUserPhone").value = usuario.telefono;
            document.getElementById("editUserRole").value = usuario.rol;
            document.getElementById("editUserStatus").value = usuario.estado;
            document.getElementById("editUserBirthdate").value = usuario.fecha_Nacimiento;

            // Mostrar modal
            document.getElementById("editUserModal").style.display = "block";
        })
        .catch(error => {
            console.error(error);
            alert("No se pudo cargar el usuario");
        });
}


function eliminarUsuario(idUsuario) {
    if(confirm('¿Está seguro de eliminar este usuario? Esta acción no se puede deshacer.')) {
        fetch('AdminUsuarioServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `action=eliminar&id_usuario=${idUsuario}`
        })
            .then(response => response.json())
            .then(data => {
                if(data.success) {
                    location.reload();
                } else {
                    alert('Error al eliminar usuario');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Error al eliminar usuario');
            });
    }
}

function cambiarEstadoUsuario(idUsuario, nuevoEstado) {
    fetch('AdminUsuarioServlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `action=cambiarEstado&id_usuario=${idUsuario}&estado=${nuevoEstado}`
    })
        .then(response => response.json())
        .then(data => {
            if(data.success) {
                location.reload();
            } else {
                alert('Error al cambiar estado');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Error al cambiar estado');
        });
}

function exportarUsuarios() {
    // Implementar exportación a Excel/CSV
    alert('Funcionalidad de exportación en desarrollo');
}

// Funciones para planes
function editarPlan(idPlan) {
    window.location.href = `AdminPlanServlet?action=obtener&id=${idPlan}`;
}

function eliminarPlan(idPlan) {
    if(confirm('¿Está seguro de eliminar este plan? Los usuarios con este plan se verán afectados.')) {
        fetch('AdminPlanServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `action=eliminar&id_plan=${idPlan}`
        })
            .then(response => response.json())
            .then(data => {
                if(data.success) {
                    location.reload();
                } else {
                    alert('Error al eliminar plan');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Error al eliminar plan');
            });
    }
}

// Funciones para responsive
function toggleSidebar() {
    document.querySelector('.sidebar').classList.toggle('active');
}