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
        <div id="settings-section" class="section">
            <div class="settings-management">
                <h2>Configuración del Sistema</h2>

                <form id="settingsForm" action="AdminConfigServlet" method="post" class="settings-form">
                    <input type="hidden" name="action" value="actualizar">

                    <div class="settings-tabs">
                        <div class="tab-buttons">
                            <button type="button" class="tab-btn active" data-tab="general">General</button>
                            <button type="button" class="tab-btn" data-tab="correo">Correo Electrónico</button>
                            <button type="button" class="tab-btn" data-tab="pagos">Pagos</button>
                            <button type="button" class="tab-btn" data-tab="seguridad">Seguridad</button>
                        </div>

                        <div class="tab-content active" id="general-tab">
                            <h3>Configuración General</h3>
                            <div class="form-group">
                                <label for="gymName">Nombre del Gimnasio</label>
                                <input type="text" id="gymName" name="gymName" class="form-control" value="AresFitness" required>
                            </div>
                            <div class="form-group">
                                <label for="gymAddress">Dirección</label>
                                <input type="text" id="gymAddress" name="gymAddress" class="form-control" value="Av. Principal 123" required>
                            </div>
                            <div class="form-group">
                                <label for="gymPhone">Teléfono</label>
                                <input type="tel" id="gymPhone" name="gymPhone" class="form-control" value="+51 123 456 789" required>
                            </div>
                            <div class="form-group">
                                <label for="gymEmail">Email de Contacto</label>
                                <input type="email" id="gymEmail" name="gymEmail" class="form-control" value="info@aresfitness.com" required>
                            </div>
                            <div class="form-group">
                                <label for="businessHours">Horario de Atención</label>
                                <input type="text" id="businessHours" name="businessHours" class="form-control" value="Lunes a Viernes: 5:00 AM - 10:00 PM, Sábados: 6:00 AM - 8:00 PM" required>
                            </div>
                        </div>

                        <div class="tab-content" id="correo-tab">
                            <h3>Configuración de Correo Electrónico</h3>
                            <div class="form-group">
                                <label for="smtpHost">Servidor SMTP</label>
                                <input type="text" id="smtpHost" name="smtpHost" class="form-control" value="smtp.gmail.com">
                            </div>
                            <div class="form-group">
                                <label for="smtpPort">Puerto SMTP</label>
                                <input type="number" id="smtpPort" name="smtpPort" class="form-control" value="587">
                            </div>
                            <div class="form-group">
                                <label for="smtpUser">Usuario SMTP</label>
                                <input type="text" id="smtpUser" name="smtpUser" class="form-control" value="no-reply@aresfitness.com">
                            </div>
                            <div class="form-group">
                                <label for="smtpPass">Contraseña SMTP</label>
                                <input type="password" id="smtpPass" name="smtpPass" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="emailNotifications">Notificaciones por Email</label>
                                <select id="emailNotifications" name="emailNotifications" class="form-control">
                                    <option value="activadas">Activadas</option>
                                    <option value="desactivadas">Desactivadas</option>
                                </select>
                            </div>
                        </div>

                        <div class="tab-content" id="pagos-tab">
                            <h3>Configuración de Pagos</h3>
                            <div class="form-group">
                                <label for="currency">Moneda</label>
                                <select id="currency" name="currency" class="form-control">
                                    <option value="PEN">Soles (S/.)</option>
                                    <option value="USD">Dólares ($)</option>
                                    <option value="EUR">Euros (€)</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="taxRate">Impuesto (%)</label>
                                <input type="number" id="taxRate" name="taxRate" class="form-control" value="18" min="0" max="100" step="0.01">
                            </div>
                            <div class="form-group">
                                <label for="paymentMethods">Métodos de Pago Aceptados</label>
                                <div class="checkbox-group">
                                    <label><input type="checkbox" name="paymentMethods" value="efectivo" checked> Efectivo</label>
                                    <label><input type="checkbox" name="paymentMethods" value="tarjeta" checked> Tarjeta de Crédito/Débito</label>
                                    <label><input type="checkbox" name="paymentMethods" value="transferencia" checked> Transferencia Bancaria</label>
                                    <label><input type="checkbox" name="paymentMethods" value="yape"> Yape / Plin</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="invoiceSeries">Serie de Facturación</label>
                                <input type="text" id="invoiceSeries" name="invoiceSeries" class="form-control" value="F001">
                            </div>
                        </div>

                        <div class="tab-content" id="seguridad-tab">
                            <h3>Configuración de Seguridad</h3>
                            <div class="form-group">
                                <label for="sessionTimeout">Tiempo de Expiración de Sesión (minutos)</label>
                                <input type="number" id="sessionTimeout" name="sessionTimeout" class="form-control" value="30" min="5" max="240">
                            </div>
                            <div class="form-group">
                                <label for="maxLoginAttempts">Intentos Máximos de Login</label>
                                <input type="number" id="maxLoginAttempts" name="maxLoginAttempts" class="form-control" value="3" min="1" max="10">
                            </div>
                            <div class="form-group">
                                <label for="passwordExpiry">Expiración de Contraseñas (días)</label>
                                <input type="number" id="passwordExpiry" name="passwordExpiry" class="form-control" value="90" min="30" max="365">
                            </div>
                            <div class="form-group">
                                <label for="backupFrequency">Frecuencia de Backup Automático</label>
                                <select id="backupFrequency" name="backupFrequency" class="form-control">
                                    <option value="diario">Diario</option>
                                    <option value="semanal" selected>Semanal</option>
                                    <option value="mensual">Mensual</option>
                                </select>
                            </div>
                            <div class="form-group full-width">
                                <button type="button" class="btn btn-warning" onclick="realizarBackup()">
                                    <i class="fas fa-database"></i> Realizar Backup Ahora
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="form-group full-width" style="margin-top: 20px;">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Guardar Configuración
                        </button>
                        <button type="reset" class="btn btn-secondary">
                            <i class="fas fa-times"></i> Restablecer
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </main>
</div>
<script src="Recursos/JS/admin.js"></script>
</body>
</html>
