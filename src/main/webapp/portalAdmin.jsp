<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal del Administrador - AresFitness</title>
    <link rel="stylesheet" href="Recursos/Css/admin.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
    <div class="admin-container">
        <header class="admin-header">
            <div class="header-content">
                <h1>Portal del Administrador</h1>
                <div class="user-info">
                    <span>Bienvenido, Admin</span>
                    <button class="logout-btn" id="logoutButton">
                        <i class="fas fa-sign-out-alt"></i> Cerrar Sesion
                    </button>
                </div>
            </div>
        </header>

        <aside class="sidebar">
            <nav class="admin-nav">
                <ul>
                    <li class="nav-item active">
                        <a href="portalAdmin.jsp">
                            <span class="icon"><i class="fas fa-chart-bar"></i></span>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item">
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
                            <span>Configuración</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#">
                            <span class="icon"><i class="fas fa-chart-line"></i></span>
                            <span>Estadisticas</span>
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
            <div class="dashboard-cards">
                <div class="card">
                    <div class="card-header">
                        <h3>Usuarios Registrados</h3>
                    </div>
                    <div class="card-content">
                        <span class="stat-number">1,248</span>
                        <span class="stat-change positive">
                            <i class="fas fa-arrow-up"></i> +5% desde ayer
                        </span>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h3>Contenido Activo</h3>
                    </div>
                    <div class="card-content">
                        <span class="stat-number">567</span>
                        <span class="stat-change positive">
                            <i class="fas fa-arrow-up"></i> +2% desde ayer
                        </span>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h3>Problemas Reportados</h3>
                    </div>
                    <div class="card-content">
                        <span class="stat-number">12</span>
                        <span class="stat-change negative">
                            <i class="fas fa-arrow-down"></i> -3% desde ayer
                        </span>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h3>Rendimiento</h3>
                    </div>
                    <div class="card-content">
                        <span class="stat-number">98.7%</span>
                        <span class="stat-change positive">
                            <i class="fas fa-arrow-up"></i> +0.5% desde ayer
                        </span>
                    </div>
                </div>
            </div>

            <div class="recent-activity">
                <h2>Actividad Reciente</h2>
                <div class="activity-list">
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="activity-details">
                            <p>Nuevo usuario registrado:</p>
                            <span class="activity-time">Hace 0 minutos</span>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-file-alt"></i>
                        </div>
                        <div class="activity-details">
                            <p></p>
                            <span class="activity-time">Hace 0 minutos</span>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-cog"></i>
                        </div>
                        <div class="activity-details">
                            <p></p>
                            <span class="activity-time">Hace 0 horas</span>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <div class="activity-details">
                            <p></p>
                            <span class="activity-time">Hace 0 horas</span>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>