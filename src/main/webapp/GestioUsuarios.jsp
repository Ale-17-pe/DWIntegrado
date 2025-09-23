<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.dwintegrado.gym.Services.AdminService"%>
<%@page import="com.mycompany.dwintegrado.gym.Model.UsuarioModel"%>
<%@page import="com.mycompany.dwintegrado.gym.Model.PlanModel"%>
<%@page import="com.mycompany.dwintegrado.gym.Model.ContenidoModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
    // Verificar si el usuario es administrador
    UsuarioModel usuarioSesion = (UsuarioModel) session.getAttribute("usuario");
    if (usuarioSesion == null || !"Administrador".equals(usuarioSesion.getRol())) {
        response.sendRedirect("login.jsp?error=acceso_no_autorizado");
        return;
    }

    AdminService adminService = new AdminService();
    List<UsuarioModel> usuarios = new ArrayList<>();
    List<PlanModel> planes = new ArrayList<>();
    List<ContenidoModel> contenidos = new ArrayList<>();

    // Cargar datos reales
    try {
        usuarios = adminService.listarUsuarios();
        planes = adminService.listarPlanes();
        contenidos = adminService.listarContenidos();
    } catch (Exception e) {
        e.printStackTrace();
    }

    // Obtener estadísticas
    int totalUsuarios = usuarios.size();
    int usuariosActivos = (int) usuarios.stream().filter(u -> "activo".equals(u.getEstado())).count();
    int totalPlanes = planes.size();
    int contenidoPublicado = (int) contenidos.stream().filter(c -> "publicado".equals(c.getEstado())).count();
    int contenidoBorrador = (int) contenidos.stream().filter(c -> "borrador".equals(c.getEstado())).count();

    // Estadísticas adicionales
    int usuariosClientes = (int) usuarios.stream().filter(u -> "Cliente".equals(u.getRol())).count();
    int usuariosEntrenadores = (int) usuarios.stream().filter(u -> "Entrenador".equals(u.getRol())).count();
    int usuariosRecepcionistas = (int) usuarios.stream().filter(u -> "Recepcionista".equals(u.getRol())).count();

    // Obtener fecha actual
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
    String fechaActual = sdf.format(new Date());

    // Mensajes de éxito/error
    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal del Administrador - AresFitness</title>
    <link rel="stylesheet" href="Recursos/Css/UsuarioAdmin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
<div class="admin-container">
    <!-- Header con información del usuario -->
    <header class="admin-header">
        <div class="header-content">
            <h1>Portal del Administrador</h1>
            <div class="user-info">
                <span>Bienvenido, <%= usuarioSesion.getNombre() %></span>
                <button class="logout-btn" id="logoutButton">
                    <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
                </button>
            </div>
        </div>
    </header>
    <!-- Panel lateral de navegación -->
    <aside class="sidebar">
        <nav class="admin-nav">
            <ul>
                <li class="nav-item active" data-section="dashboard">
                    <a href="portalAdmin.jsp">
                        <span class="icon"><i class="fas fa-chart-bar"></i></span>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="nav-item" data-section="users">
                    <a href="GestioUsuarios.jsp">
                        <span class="icon"><i class="fas fa-users"></i></span>
                        <span>Gestión de Usuarios</span>
                    </a>
                </li>
                <li class="nav-item" data-section="plans">
                    <a href="GestionPlanes.jsp">
                        <span class="icon"><i class="fas fa-crown"></i></span>
                        <span>Gestión de Planes</span>
                    </a>
                </li>
                <li class="nav-item" data-section="content">
                    <a href="GestionContenido.jsp">
                        <span class="icon"><i class="fas fa-file-alt"></i></span>
                        <span>Gestión de Contenido</span>
                    </a>
                </li>
                <li class="nav-item" data-section="settings">
                    <a href="ConfSistema.jsp">
                        <span class="icon"><i class="fas fa-cog"></i></span>
                        <span>Configuración del Sistema</span>
                    </a>
                </li>
                <li class="nav-item" data-section="stats">
                    <a href="GestionEstadistica.jsp">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span>Estadísticas Detalladas</span>
                    </a>
                </li>
            </ul>
        </nav>
    </aside>
    <main class="admin-main">
        <!-- Mostrar mensajes de éxito/error -->
            <% if (success != null) { %>
        <div class="alert alert-success">
            <i class="fas fa-check-circle"></i>
            <%
                switch(success) {
                    case "usuario_creado":
                        out.print("Usuario creado exitosamente");
                        break;
                    case "usuario_actualizado":
                        out.print("Usuario actualizado exitosamente");
                        break;
                    case "usuario_eliminado":
                        out.print("Usuario eliminado exitosamente");
                        break;
                    case "plan_creado":
                        out.print("Plan creado exitosamente");
                        break;
                    case "plan_actualizado":
                        out.print("Plan actualizado exitosamente");
                        break;
                    case "plan_eliminado":
                        out.print("Plan eliminado exitosamente");
                        break;
                    default:
                        out.print("Operación realizada con éxito");
                }
            %>
        </div>
            <% } %>

            <% if (error != null) { %>
        <div class="alert alert-danger">
            <i class="fas fa-exclamation-circle"></i>
            <%
                switch(error) {
                    case "acceso_no_autorizado":
                        out.print("Acceso no autorizado");
                        break;
                    case "error_crear_usuario":
                        out.print("Error al crear usuario");
                        break;
                    case "error_actualizar_usuario":
                        out.print("Error al actualizar usuario");
                        break;
                    case "error_crear_plan":
                        out.print("Error al crear plan");
                        break;
                    case "error_crear_contenido":
                        out.print("Error al crear contenido");
                        break;
                    case "error_actualizar_contenido":
                        out.print("Error al actualizar contenido");
                        break;
                    case "error_actualizar_configuración":
                        out.print("Error al actualizar configuración");
                        break;
                    default:
                        out.print("Error en la operación");
                }
            %>
        </div>
            <% } %>
        <div id="users-section" class="section">
            <div class="plan-management">
                <h2>Gestión de Usuarios</h2>

                <div class="user-filters">
                    <div class="form-group">
                        <label for="userSearch">Buscar Usuario</label>
                        <input type="text" id="userSearch" class="form-control" placeholder="Nombre, email o ID" onkeyup="filtrarUsuarios()">
                    </div>
                    <div class="form-group">
                        <label for="userStatus">Estado</label>
                        <select id="userStatus" class="form-control" onchange="filtrarUsuarios()">
                            <option value="">Todos</option>
                            <option value="activo">Activo</option>
                            <option value="inactivo">Inactivo</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="userRole">Rol</label>
                        <select id="userRole" class="form-control" onchange="filtrarUsuarios()">
                            <option value="">Todos</option>
                            <option value="Cliente">Cliente</option>
                            <option value="Recepcionista">Recepcionista</option>
                            <option value="Entrenador">Entrenador</option>
                            <option value="Administrador">Administrador</option>
                        </select>
                    </div>
                </div>

                <table class="data-table" id="tablaUsuarios">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Email</th>
                        <th>DNI</th>
                        <th>Rol</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (UsuarioModel usuario : usuarios) { %>
                    <tr data-estado="<%= usuario.getEstado() %>" data-rol="<%= usuario.getRol() %>">
                        <td><%= usuario.getId_usuario() %></td>
                        <td><%= usuario.getNombre() %> <%= usuario.getApellido() %></td>
                        <td><%= usuario.getEmail() %></td>
                        <td><%= usuario.getDni() %></td>
                        <td><%= usuario.getRol() %></td>
                        <td>
                                <span class="stat-change <%= "activo".equals(usuario.getEstado()) ? "positive" : "negative" %>">
                                    <%= usuario.getEstado() %>
                                </span>
                        </td>
                        <td>
                            <div class="plan-actions">
                                <button class="btn-icon btn-edit" onclick="editarUsuario(<%= usuario.getId_usuario() %>)">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button class="btn-icon btn-delete" onclick="eliminarUsuario(<%= usuario.getId_usuario() %>)">
                                    <i class="fas fa-trash"></i>
                                </button>
                                <button class="btn-icon <%= "activo".equals(usuario.getEstado()) ? "btn-delete" : "btn-success" %>"
                                        onclick="cambiarEstadoUsuario(<%= usuario.getId_usuario() %>, '<%= "activo".equals(usuario.getEstado()) ? "inactivo" : "activo" %>')">
                                    <i class="fas <%= "activo".equals(usuario.getEstado()) ? "fa-times" : "fa-check" %>"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>

                <div class="form-group full-width" style="margin-top: 20px;">
                    <button class="btn btn-primary" data-target="addUserModal">
                        <i class="fas fa-plus"></i> Agregar Nuevo Usuario
                    </button>
                    <button class="btn btn-secondary" onclick="exportarUsuarios()">
                        <i class="fas fa-download"></i> Exportar Datos
                    </button>
                </div>
            </div>
        </div>
    </main>
</div>
<!-- Modal para Agregar Usuario -->
<div class="modal" id="addUserModal">
    <div class="modal-contenido">
        <div class="modal-header">
            <h2 class="modal-titulo">Agregar Nuevo Usuario</h2>
            <button class="modal-cerrar" data-dismiss="modal">&times;</button>
        </div>
        <form id="addUserForm" action="AdminUsuarioServlet" method="post">
            <input type="hidden" name="action" value="crear">

            <div class="plan-form">
                <div class="form-group">
                    <label for="newUserName">Nombre Completo *</label>
                    <input type="text" id="newUserName" name="nombre" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="newUserLastName">Apellidos *</label>
                    <input type="text" id="newUserLastName" name="apellido" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="newUserEmail">Email *</label>
                    <input type="email" id="newUserEmail" name="email" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="newUserDNI">DNI *</label>
                    <input type="text" id="newUserDNI" name="dni" class="form-control" pattern="[0-9]{8}" required>
                </div>

                <div class="form-group">
                    <label for="newUserPhone">Teléfono *</label>
                    <input type="tel" id="newUserPhone" name="telefono" class="form-control" pattern="[0-9]{9}" required>
                </div>

                <div class="form-group">
                    <label for="newUserPassword">Contraseña *</label>
                    <input type="password" id="newUserPassword" name="password" class="form-control" minlength="6" required>
                </div>

                <div class="form-group">
                    <label for="newUserRole">Rol *</label>
                    <select id="newUserRole" name="rol" class="form-control" required>
                        <option value="">Seleccionar rol</option>
                        <option value="Cliente">Cliente</option>
                        <option value="Recepcionista">Recepcionista</option>
                        <option value="Entrenador">Entrenador</option>
                        <option value="Administrador">Administrador</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="newUserBirthdate">Fecha de Nacimiento *</label>
                    <input type="date" id="newUserBirthdate" name="fechaNacimiento" class="form-control" required>
                </div>

                <div class="form-group full-width">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Crear Usuario
                    </button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        <i class="fas fa-times"></i> Cancelar
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- Modal para Editar Usuario -->
<div class="modal" id="editUserModal">
    <div class="modal-contenido">
        <div class="modal-header">
            <h2 class="modal-titulo">Editar Usuario</h2>
            <button class="modal-cerrar" data-dismiss="modal">&times;</button>
        </div>
        <form id="editUserForm" action="AdminUsuarioServlet" method="post">
            <input type="hidden" name="action" value="actualizar">
            <input type="hidden" id="editUserId" name="id_usuario">

            <div class="plan-form">
                <div class="form-group">
                    <label for="editUserName">Nombre Completo *</label>
                    <input type="text" id="editUserName" name="nombre" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="editUserLastName">Apellidos *</label>
                    <input type="text" id="editUserLastName" name="apellido" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="editUserEmail">Email *</label>
                    <input type="email" id="editUserEmail" name="email" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="editUserDNI">DNI *</label>
                    <input type="text" id="editUserDNI" name="dni" class="form-control" pattern="[0-9]{8}" required>
                </div>

                <div class="form-group">
                    <label for="editUserPhone">Teléfono *</label>
                    <input type="tel" id="editUserPhone" name="telefono" class="form-control" pattern="[0-9]{9}" required>
                </div>

                <div class="form-group">
                    <label for="editUserRole">Rol *</label>
                    <select id="editUserRole" name="rol" class="form-control" required>
                        <option value="">Seleccionar rol</option>
                        <option value="Cliente">Cliente</option>
                        <option value="Recepcionista">Recepcionista</option>
                        <option value="Entrenador">Entrenador</option>
                        <option value="Administrador">Administrador</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="editUserStatus">Estado *</label>
                    <select id="editUserStatus" name="estado" class="form-control" required>
                        <option value="activo">Activo</option>
                        <option value="inactivo">Inactivo</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="editUserBirthdate">Fecha de Nacimiento *</label>
                    <input type="date" id="editUserBirthdate" name="fechaNacimiento" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="editUserPlan">Plan Asignado</label>
                    <select id="editUserPlan" name="id_plan" class="form-control">
                        <option value="">Sin plan</option>
                        <% for (PlanModel plan : planes) { %>
                        <option value="<%= plan.getId_plan() %>"><%= plan.getNombre() %> - S/. <%= plan.getPrecio() %></option>
                        <% } %>
                    </select>
                </div>

                <div class="form-group">
                    <label for="editUserStartDate">Fecha de Inicio</label>
                    <input type="date" id="editUserStartDate" name="fechaInicio" class="form-control">
                </div>

                <div class="form-group">
                    <label for="editUserEndDate">Fecha de Fin</label>
                    <input type="date" id="editUserEndDate" name="fechaFin" class="form-control">
                </div>

                <div class="form-group full-width">
                    <div class="password-toggle">
                        <label for="editUserPassword">Cambiar Contraseña (dejar vacío para mantener la actual)</label>
                        <input type="password" id="editUserPassword" name="password" class="form-control" minlength="6">
                        <button type="button" class="toggle-password" onclick="togglePasswordVisibility('editUserPassword')">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>

                <div class="form-group full-width">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Actualizar Usuario
                    </button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        <i class="fas fa-times"></i> Cancelar
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="Recursos/JS/admin.js"></script>
</body>
</html>
