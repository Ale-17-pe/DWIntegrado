<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.dwintegrado.gym.DTO.ClienteDTO"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
    System.out.println("=== DEBUG portalCliente.jsp ===");

    // Verificar todas las variables de sesión
    java.util.Enumeration<String> sessionAttributes = session.getAttributeNames();
    while (sessionAttributes.hasMoreElements()) {
        String attrName = sessionAttributes.nextElement();
        Object attrValue = session.getAttribute(attrName);
        System.out.println("Sesión - " + attrName + ": " + attrValue);
    }

    ClienteDTO cliente = (ClienteDTO) session.getAttribute("clienteDTO");
    System.out.println("Cliente en sesión: " + cliente);

    if (cliente != null) {
        System.out.println("DEBUG - ID: " + cliente.getId_cliente());
        System.out.println("DEBUG - Nombre: " + cliente.getNombre());
        System.out.println("DEBUG - Apellido: " + cliente.getApellido());
        System.out.println("DEBUG - Email: " + cliente.getCorreo());
        System.out.println("DEBUG - DNI: " + cliente.getDni());
        System.out.println("DEBUG - Teléfono: " + cliente.getTelefono());
        System.out.println("DEBUG - Direccion: " + cliente.getDireccion());
        System.out.println("DEBUG - Genero: " + cliente.getGenero());
    }

    if (cliente == null) {
        System.out.println("DEBUG - No hay cliente en sesión, redirigiendo a login");
        response.sendRedirect("login.jsp?error=no_autenticado");
        return;
    }

    if ("logout".equals(request.getParameter("action"))) {
        session.invalidate();
        response.sendRedirect("login.jsp");
        return;
    }

    // Formatear la fecha de nacimiento
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    String fechaNacimientoFormateada = "";
    if (cliente.getFecha_nacimiento() != null) {
        fechaNacimientoFormateada = sdf.format(cliente.getFecha_nacimiento());
    }

    String nombreCompleto = cliente.getNombre() + " " + (cliente.getApellido() != null ? cliente.getApellido() : "");
// Mostrar mensajes de éxito/error
    String success = request.getParameter("success");
    String error = request.getParameter("error");

    if (success != null) {
%>
<div class="alert alert-success">
    <i class="fas fa-check-circle"></i>
    <%
        if ("perfil_actualizado".equals(success)) {
            out.print("Perfil actualizado correctamente");
        }
    %>
</div>
<%
    }

    if (error != null) {
%>
<div class="alert alert-danger">
    <i class="fas fa-exclamation-circle"></i>
    <%
        if ("error_actualizacion".equals(error)) {
            out.print("Error al actualizar el perfil");
        } else if ("acceso_no_autorizado".equals(error)) {
            out.print("Acceso no autorizado");
        } else if ("id_invalido".equals(error)) {
            out.print("ID de cliente inválido");
        } else if ("servidor".equals(error)) {
            out.print("Error del servidor");
        }
    %>
</div>
<%
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Perfil - AresFitness</title>
    <link rel="stylesheet" href="Recursos/Css/perfiluser.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        /* Estilos básicos para el modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
        }

        .modal-contenido {
            background-color: #000000;
            margin: 10% auto;
            padding: 20px;
            border-radius: 8px;
            width: 50%;
            max-width: 500px;
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .modal-cerrar {
            font-size: 24px;
            cursor: pointer;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .btn {
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        .alert {
            padding: 15px;
            margin: 20px auto;
            border-radius: 5px;
            max-width: 600px;
            text-align: center;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>
<header>
    <div class="logo-container">
        <a href="index.jsp">
            <img src="Recursos/Imagenes/logo.png" alt="Logo AresFitness">
        </a>
    </div>
    <nav>
        <a href="MiPerfil.jsp?action=logout" class="btn_cerrar">
            <i class="fas fa-sign-out-alt"></i> Cerrar sesión
        </a>
    </nav>
</header>

<!-- Perfil -->
<main class="main-perfil">
    <section class="perfil-panel">
        <div class="perfil-contenedor">

            <!-- Imagen de perfil -->
            <div class="perfil-imagen">
                <div class="imagen-wrapper">
                    <div class="avatar-container">
                        <i class="fas fa-user-circle icono-usuario"></i>
                        <label class="icono-camara">
                            <i class="fas fa-camera"></i>
                            <input type="file" accept="image/*" hidden id="fotoPerfil">
                            <span class="tooltip">Cambiar foto</span>
                        </label>
                    </div>
                    <div class="nivel-usuario">
                        <div class="barra-progreso">
                            <div class="progreso" style="width: 65%;"></div>
                        </div>
                        <span>NIVEL 4</span>
                    </div>
                </div>
            </div>

            <!-- Línea divisoria -->
            <div class="linea-divisoria">
                <div class="circulo-divisor"></div>
                <div class="circulo-divisor"></div>
            </div>

            <!-- Datos del perfil -->
            <div class="perfil-datos">
                <h1 class="titulo-perfil">Mi Perfil</h1>

                <div class="dato-perfil">
                    <div class="icono-dato"><i class="fas fa-user"></i></div>
                    <div class="contenido-dato">
                        <label>Nombre:</label>
                        <p class="valor-dato"><%= nombreCompleto %></p>
                    </div>
                </div>

                <div class="dato-perfil">
                    <div class="icono-dato"><i class="fas fa-envelope"></i></div>
                    <div class="contenido-dato">
                        <label>Correo:</label>
                        <p class="valor-dato"><%= cliente.getCorreo() != null ? cliente.getCorreo() : "No especificado" %></p>
                    </div>
                </div>

                <div class="dato-perfil">
                    <div class="icono-dato"><i class="fas fa-phone"></i></div>
                    <div class="contenido-dato">
                        <label>Teléfono:</label>
                        <p class="valor-dato"><%= cliente.getTelefono() != null ? cliente.getTelefono() : "No especificado" %></p>
                    </div>
                </div>

                <div class="dato-perfil">
                    <div class="icono-dato"><i class="fas fa-id-card"></i></div>
                    <div class="contenido-dato">
                        <label>DNI:</label>
                        <p class="valor-dato"><%= cliente.getDni() != null ? cliente.getDni() : "No especificado" %></p>
                    </div>
                </div>

                <div class="dato-perfil">
                    <div class="icono-dato"><i class="fas fa-venus-mars"></i></div>
                    <div class="contenido-dato">
                        <label>Género:</label>
                        <p class="valor-dato"><%= cliente.getGenero() != null ? cliente.getGenero() : "No especificado" %></p>
                    </div>
                </div>

                <div class="dato-perfil">
                    <div class="icono-dato"><i class="fas fa-calendar-alt"></i></div>
                    <div class="contenido-dato">
                        <label>Fecha de Nacimiento:</label>
                        <p class="valor-dato"><%= !fechaNacimientoFormateada.isEmpty() ? fechaNacimientoFormateada : "No especificado" %></p>
                    </div>
                </div>

                <div class="dato-perfil">
                    <div class="icono-dato"><i class="fas fa-map-marker-alt"></i></div>
                    <div class="contenido-dato">
                        <label>Dirección:</label>
                        <p class="valor-dato"><%= cliente.getDireccion() != null ? cliente.getDireccion() : "No especificado" %></p>
                    </div>
                </div>

                <div class="dato-perfil">
                    <div class="icono-dato"><i class="fas fa-dumbbell"></i></div>
                    <div class="contenido-dato">
                        <label>Plan Ares Fitness:</label>
                        <p class="valor-dato">
                            <%
                                // Aquí deberías obtener el plan real del cliente desde la base de datos
                                String planCliente = "Premium"; // Este valor debería venir de la BD
                                String fechaRenovacion = "15/05/2025"; // Este valor debería venir de la BD
                            %>
                            <span class="plan-tag plan-premium"><%= planCliente %></span>
                            <span class="fecha-renovacion">Renovación: <%= fechaRenovacion %></span>
                        </p>
                    </div>
                </div>

                <div class="acciones-perfil">
                    <a href="#" class="btn-editar" id="btnEditarPerfil"><i class="fas fa-user-edit"></i> Editar perfil</a>
                </div>
            </div>
        </div>
    </section>
</main>

<!-- Footer -->
<footer>
    <p>&copy; 2025 AresFitness. Todos los derechos reservados.</p>
</footer>

<!-- Modal de Edición -->
<div class="modal" id="modalEditarPerfil">
    <div class="modal-contenido">
        <div class="modal-header">
            <h2 class="modal-titulo">Editar Perfil</h2>
            <button class="modal-cerrar" id="cerrarModal">&times;</button>
        </div>

        <form action="EditarPerfilServlet" method="post">
            <input type="hidden" name="id_cliente" value="<%= cliente.getId_cliente() %>">

            <div class="form-group">
                <label for="correo">Correo:</label>
                <input type="email" class="form-control" id="correo" name="correo" value="<%= cliente.getCorreo() != null ? cliente.getCorreo() : "" %>" required>
            </div>

            <div class="form-group">
                <label for="telefono">Teléfono:</label>
                <input type="text" class="form-control" id="telefono" name="telefono" value="<%= cliente.getTelefono() != null ? cliente.getTelefono() : "" %>" required>
            </div>

            <div class="form-group">
                <label for="direccion">Dirección:</label>
                <input type="text" class="form-control" id="direccion" name="direccion" value="<%= cliente.getDireccion() != null ? cliente.getDireccion() : "" %>" required>
            </div>

            <button type="submit" class="btn btn-primary">Guardar cambios</button>
        </form>
    </div>
</div>

<script>
    // JavaScript para controlar el modal de edición
    document.addEventListener('DOMContentLoaded', function() {
        const modal = document.getElementById('modalEditarPerfil');
        const btnEditar = document.getElementById('btnEditarPerfil');
        const cerrarModal = document.getElementById('cerrarModal');

        if (btnEditar && modal && cerrarModal) {
            btnEditar.addEventListener('click', function(e) {
                e.preventDefault();
                modal.style.display = 'block';
            });

            cerrarModal.addEventListener('click', function() {
                modal.style.display = 'none';
            });

            window.addEventListener('click', function(e) {
                if (e.target === modal) {
                    modal.style.display = 'none';
                }
            });
        }
    });
</script>
</body>
</html>