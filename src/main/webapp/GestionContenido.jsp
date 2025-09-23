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

        <div id="content-section" class="section">
            <div class="content-management">
                <h2>Gestión de Contenido</h2>

                <div class="content-actions">
                    <button class="btn btn-primary" data-target="addContentModal">
                        <i class="fas fa-plus"></i> Crear Nuevo Contenido
                    </button>
                    <div class="content-filters">
                        <div class="form-group">
                            <label for="contentFilter">Filtrar por:</label>
                            <select id="contentFilter" class="form-control" onchange="filtrarContenido()">
                                <option value="todos">Todos</option>
                                <option value="publicado">Publicados</option>
                                <option value="borrador">Borradores</option>
                                <option value="destacado">Destacados</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="contentSearch">Buscar:</label>
                            <input type="text" id="contentSearch" class="form-control" placeholder="Título o descripción" onkeyup="filtrarContenido()">
                        </div>
                    </div>
                </div>

                <div class="content-list">
                    <h3>Contenidos Existentes</h3>
                    <div class="content-grid">
                        <% for (ContenidoModel contenido : contenidos) { %>
                        <div class="content-card" data-estado="<%= contenido.getEstado() %>" data-destacado="<%= contenido.isDestacado() %>">
                            <div class="content-header">
                                <h4><%= contenido.getTitulo() %></h4>
                                <span class="content-badge <%= contenido.getEstado() %>">
                                    <%= contenido.getEstado() %>
                                </span>
                                <% if (contenido.isDestacado()) { %>
                                <span class="content-badge destacado">
                                    <i class="fas fa-star"></i> Destacado
                                </span>
                                <% } %>
                            </div>

                            <div class="content-actions">
                                <button class="btn-icon btn-edit" onclick="editarContenido(<%= contenido.getContenido() %>)">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button class="btn-icon btn-delete" onclick="eliminarContenido(<%= contenido.getContenido() %>)">
                                    <i class="fas fa-trash"></i>
                                </button>
                                <button class="btn-icon <%= contenido.isDestacado() ? "btn-warning" : "btn-secondary" %>"
                                        onclick="toggleDestacado(<%= contenido.getId_contenido() %>, <%= !contenido.isDestacado() %>)">
                                    <i class="fas <%= contenido.isDestacado() ? "fa-star" : "fa-star-half-alt" %>"></i>
                                </button>
                                <button class="btn-icon <%= "publicado".equals(contenido.getEstado()) ? "btn-secondary" : "btn-success" %>"
                                        onclick="cambiarEstadoContenido(<%= contenido.getTipo() %>, '<%= "publicado".equals(contenido.getEstado()) ? "borrador" : "publicado" %>')">
                                    <i class="fas <%= "publicado".equals(contenido.getEstado()) ? "fa-eye-slash" : "fa-eye" %>"></i>
                                </button>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<div class="modal" id="addContentModal">
    <div class="modal-contenido">
        <div class="modal-header">
            <h2 class="modal-titulo">Crear Nuevo Contenido</h2>
            <button class="modal-cerrar" data-dismiss="modal">&times;</button>
        </div>
        <form id="addContentForm" action="AdminContenidoServlet" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="crear">

            <div class="plan-form">
                <div class="form-group full-width">
                    <label for="contentTitle">Título *</label>
                    <input type="text" id="contentTitle" name="titulo" class="form-control" required>
                </div>

                <div class="form-group full-width">
                    <label for="contentDescription">Descripción *</label>
                    <textarea id="contentDescription" name="descripcion" class="form-control" rows="3" required></textarea>
                </div>

                <div class="form-group full-width">
                    <label for="contentBody">Contenido *</label>
                    <textarea id="contentBody" name="contenido" class="form-control" rows="6" required></textarea>
                </div>

                <div class="form-group">
                    <label for="contentCategory">Categoría *</label>
                    <select id="contentCategory" name="categoria" class="form-control" required>
                        <option value="">Seleccionar categoría</option>
                        <option value="ejercicios">Ejercicios</option>
                        <option value="nutricion">Nutrición</option>
                        <option value="salud">Salud y Bienestar</option>
                        <option value="entrenamiento">Entrenamiento</option>
                        <option value="motivacion">Motivación</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="contentStatus">Estado *</label>
                    <select id="contentStatus" name="estado" class="form-control" required>
                        <option value="borrador">Borrador</option>
                        <option value="publicado">Publicado</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="contentFeatured">Destacado</label>
                    <select id="contentFeatured" name="destacado" class="form-control">
                        <option value="false">No</option>
                        <option value="true">Sí</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="contentImage">Imagen Principal</label>
                    <input type="file" id="contentImage" name="imagen" class="form-control" accept="image/*">
                </div>

                <div class="form-group full-width">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Crear Contenido
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
