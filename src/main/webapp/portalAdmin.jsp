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

        <div id="dashboard-section" class="section active">
            <div class="dashboard-cards">
                <div class="card">
                    <div class="card-header">
                        <h3>Usuarios Registrados</h3>
                    </div>
                    <div class="card-content">
                        <span class="stat-number" data-stat="total-usuarios"><%= totalUsuarios %></span>
                        <span class="stat-change positive">
                            <i class="fas fa-arrow-up"></i> +<%= totalUsuarios > 0 ? ((usuariosActivos * 100) / totalUsuarios) : 0 %>% activos
                        </span>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h3>Planes Activos</h3>
                    </div>
                    <div class="card-content">
                        <span class="stat-number"><%= totalPlanes %></span>
                        <span class="stat-change positive">
                            <i class="fas fa-crown"></i> Disponibles
                        </span>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h3>Contenido Publicado</h3>
                    </div>
                    <div class="card-content">
                        <span class="stat-number"><%= contenidoPublicado %></span>
                        <span class="stat-change positive">
                            <i class="fas fa-file-alt"></i> Artículos y recursos
                        </span>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h3>Usuarios Activos</h3>
                    </div>
                    <div class="card-content">
                        <span class="stat-number"><%= usuariosActivos %></span>
                        <span class="stat-change positive">
                            <i class="fas fa-user-check"></i> En plataforma
                        </span>
                    </div>
                </div>
            </div>

            <div class="recent-activity">
                <h2>Actividad Reciente</h2>
                <div class="activity-list">
                    <%
                        // Mostrar últimos 5 usuarios registrados
                        int count = 0;
                        for (UsuarioModel usuario : usuarios) {
                            if (count >= 5) break;
                    %>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        <div class="activity-details">
                            <p>Nuevo usuario: <%= usuario.getNombre() %> <%= usuario.getApellido() %></p>
                            <span class="activity-time">Rol: <%= usuario.getRol() %></span>
                        </div>
                    </div>
                    <%
                            count++;
                        }
                    %>
                </div>
            </div>
        </div>
    </main>
</div>

</body>
</html>
