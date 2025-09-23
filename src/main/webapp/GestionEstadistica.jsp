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
        <div id="stats-section" class="section">
            <div class="stats-management">
                <h2>Estadísticas Detalladas</h2>

                <div class="stats-filters">
                    <div class="form-group">
                        <label for="statsRange">Rango de Fechas</label>
                        <select id="statsRange" class="form-control" onchange="cargarEstadisticas()">
                            <option value="7">Últimos 7 días</option>
                            <option value="30" selected>Últimos 30 días</option>
                            <option value="90">Últimos 3 meses</option>
                            <option value="365">Último año</option>
                            <option value="custom">Personalizado</option>
                        </select>
                    </div>
                    <div class="form-group custom-range" style="display: none;">
                        <label for="startDate">Desde</label>
                        <input type="date" id="startDate" class="form-control">
                    </div>
                    <div class="form-group custom-range" style="display: none;">
                        <label for="endDate">Hasta</label>
                        <input type="date" id="endDate" class="form-control" value="<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>">
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary" onclick="cargarEstadisticas()">
                            <i class="fas fa-sync-alt"></i> Actualizar
                        </button>
                        <button class="btn btn-secondary" onclick="exportarEstadisticas()">
                            <i class="fas fa-download"></i> Exportar
                        </button>
                    </div>
                </div>

                <div class="stats-grid">
                    <div class="stats-card wide">
                        <h3>Registros de Usuarios</h3>
                        <div class="chart-container">
                            <canvas id="userRegistrationsChart"></canvas>
                        </div>
                    </div>

                    <div class="stats-card">
                        <h3>Distribución de Usuarios</h3>
                        <div class="chart-container">
                            <canvas id="userDistributionChart"></canvas>
                        </div>
                    </div>

                    <div class="stats-card">
                        <h3>Planes Más Populares</h3>
                        <div class="chart-container">
                            <canvas id="popularPlansChart"></canvas>
                        </div>
                    </div>

                    <div class="stats-card wide">
                        <h3>Ingresos Mensuales</h3>
                        <div class="chart-container">
                            <canvas id="revenueChart"></canvas>
                        </div>
                    </div>

                    <div class="stats-card">
                        <h3>Resumen General</h3>
                        <div class="stats-summary">
                            <div class="summary-item">
                                <span class="summary-label">Total Usuarios</span>
                                <span class="summary-value"><%= totalUsuarios %></span>
                            </div>
                            <div class="summary-item">
                                <span class="summary-label">Usuarios Activos</span>
                                <span class="summary-value"><%= usuariosActivos %> (<%= totalUsuarios > 0 ? (usuariosActivos * 100 / totalUsuarios) : 0 %>%)</span>
                            </div>
                            <div class="summary-item">
                                <span class="summary-label">Ingresos Mensuales</span>
                                <span class="summary-value">S/. 15,250.00</span>
                            </div>
                            <div class="summary-item">
                                <span class="summary-label">Contenido Publicado</span>
                                <span class="summary-value"><%= contenidoPublicado %></span>
                            </div>
                            <div class="summary-item">
                                <span class="summary-label">Asistencias Diarias</span>
                                <span class="summary-value">87</span>
                            </div>
                        </div>
                    </div>

                    <div class="stats-card">
                        <h3>Dispositivos de Acceso</h3>
                        <div class="chart-container">
                            <canvas id="devicesChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>
