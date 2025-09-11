<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gesti髇 de Usuarios - AresFitness</title>
    <link rel="stylesheet" href="Recursos/Css/rigistarUsuario.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
    <div class="admin-container">
        <!-- Header con informaci贸n del usuario -->
        <header class="admin-header">
            <div class="header-content">
                <h1>Gesti髇 de Usuarios - AresFitness</h1>
                <div class="user-info">
                    <span>Bienvenido, Admin</span>
                    <button class="logout-btn" id="logoutButton">
                        <i class="fas fa-sign-out-alt"></i> Cerrar Sesi髇
                    </button>
                </div>
            </div>
        </header>

        <!-- Panel lateral de navegaci贸n -->
        <aside class="sidebar">
            <nav class="admin-nav">
                <ul>
                    <li class="nav-item">
                        <a href="portalAdmin.jsp">
                            <span class="icon"><i class="fas fa-chart-bar"></i></span>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a href="registroUsuario.jsp">
                            <span class="icon"><i class="fas fa-users"></i></span>
                            <span>Usuarios</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#">
                            <span class="icon"><i class="fas fa-file-alt"></i></span>
                            <span>Contenido</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#">
                            <span class="icon"><i class="fas fa-cog"></i></span>
                            <span>Configuraci髇</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#">
                            <span class="icon"><i class="fas fa-chart-line"></i></span>
                            <span>Estada璼ticas</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#">
                            <span class="icon"><i class="fas fa-lock"></i></span>
                            <span>Permisos</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </aside>

        <!-- Contenido principal -->
        <main class="admin-main">
            <div class="form-container">
                <h2 class="form-title"><i class="fas fa-user-plus"></i> Registrar Nuevo Usuario</h2>

                <form id="user-form">
                    <div class="form-grid">
                        <!-- Informaci贸n b谩sica -->
                        <div class="form-group">
                            <label class="form-label" for="dni">DNI *</label>
                            <input type="text" id="dni" class="form-input" required maxlength="8" pattern="[0-9]{8}" title="El DNI debe tener 8 d铆gitos">
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="nombre">Nombre *</label>
                            <input type="text" id="nombre" class="form-input" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="apellido">Apellido *</label>
                            <input type="text" id="apellido" class="form-input" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="email">Correo electr髇ico *</label>
                            <input type="email" id="email" class="form-input" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="telefono">Telefono *</label>
                            <input type="tel" id="telefono" class="form-input" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="direccion">Direcci髇</label>
                            <textarea id="direccion" class="form-textarea" rows="2"></textarea>
                        </div>

                        <!-- Fechas importantes -->
                        <div class="form-group">
                            <label class="form-label" for="fechaNacimiento">Fecha de nacimiento *</label>
                            <input type="date" id="fechaNacimiento" class="form-input" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="fechaContratacion">Fecha de contrataci髇 *</label>
                            <input type="date" id="fechaContratacion" class="form-input" required>
                        </div>

                        <!-- Credenciales de acceso -->
                        <div class="form-group">
                            <label class="form-label" for="usuarioLogin">Usuario de login *</label>
                            <input type="text" id="usuarioLogin" class="form-input" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="password">Contrase馻 *</label>
                            <input type="password" id="password" class="form-input" required minlength="6">
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="confirmPassword">Confirmar contrase馻 *</label>
                            <input type="password" id="confirmPassword" class="form-input" required>
                        </div>

                        <!-- Roles y estado -->
                        <div class="form-group">
                            <label class="form-label" for="rol">Rol *</label>
                            <select id="rol" class="form-select" required>
                                <option value="">Seleccionar rol</option>
                                <option value="cliente">Cliente</option>
                                <option value="entrenador">Entrenador</option>
                                <option value="administrador">Administrador</option>
                                <option value="recepcion">Recepcionista</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="estado">Estado *</label>
                            <select id="estado" class="form-select" required>
                                <option value="">Seleccionar estado</option>
                                <option value="activo">Activo</option>
                                <option value="inactivo">Inactivo</option>
                                <option value="pendiente">Pendiente</option>
                                <option value="suspendido">Suspendido</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group form-checkbox">
                        <input type="checkbox" id="sendEmail" checked>
                        <label for="sendEmail">Enviar credenciales por correo electr贸nico</label>
                    </div>

                    <div class="form-group form-checkbox">
                        <input type="checkbox" id="forcePasswordChange">
                        <label for="forcePasswordChange">Forzar cambio de contrase帽a en primer inicio</label>
                    </div>

                    <div class="form-actions">
                        <button type="reset" class="btn btn-secondary">
                            <i class="fas fa-times"></i> Limpiar
                        </button>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Registrar Usuario
                        </button>
                    </div>
                </form>
            </div>
        </main>
    </div>
    <script src="Recursos/JS/registroUsuario.js"></script>
</body>
</html>