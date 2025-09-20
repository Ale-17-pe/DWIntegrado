<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal del Recepcionista - AresFitness</title>
    <link rel="stylesheet" href="Recursos/Css/Recepcionista.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
    <div class="admin-container">
        <!-- Header con información del usuario -->
        <header class="admin-header">
            <div class="header-content">
                <h1>Portal del Recepcionista - AresFitness</h1>
                <div class="user-info">
                    <span>Bienvenido/a, Recepcionista</span>
                    <button class="logout-btn" id="logoutButton">
                        <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
                    </button>
                </div>
            </div>
        </header>
        <aside class="sidebar">
            <nav class="admin-nav">
                <ul>
                    <li class="nav-item active">
                        <a href="#">
                            <span class="icon"><i class="fas fa-home"></i></span>
                            <span>Inicio</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="RegistrarCliente.jsp">
                            <span class="icon"><i class="fas fa-user-plus"></i></span>
                            <span>Registrar Miembro</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#">
                            <span class="icon"><i class="fas fa-dumbbell"></i></span>
                            <span>Control Acceso</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#">
                            <span class="icon"><i class="fas fa-calendar-alt"></i></span>
                            <span>Reservas</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#">
                            <span class="icon"><i class="fas fa-credit-card"></i></span>
                            <span>Pagos</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#">
                            <span class="icon"><i class="fas fa-chart-bar"></i></span>
                            <span>Reportes</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </aside>

        <!-- Contenido principal -->
        <main class="admin-main">
            <!-- Tarjetas de estadísticas -->
            <div class="dashboard-cards">
                <div class="card">
                    <div class="card-header">
                        <h3>Miembros Activos</h3>
                        <div class="icon"><i class="fas fa-users"></i></div>
                    </div>
                    <div class="card-content">
                        <div class="stat-number">124</div>
                        <div class="stat-description">Total de miembros activos</div>
                    </div>
                    <div class="card-actions">
                        <a href="#" class="btn btn-primary btn-sm">Ver todos</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h3>Visitantes Hoy</h3>
                        <div class="icon"><i class="fas fa-walking"></i></div>
                    </div>
                    <div class="card-content">
                        <div class="stat-number">47</div>
                        <div class="stat-description">Accesos registrados hoy</div>
                    </div>
                    <div class="card-actions">
                        <a href="#" class="btn btn-primary btn-sm">Ver registro</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h3>Pagos Pendientes</h3>
                        <div class="icon"><i class="fas fa-exclamation-circle"></i></div>
                    </div>
                    <div class="card-content">
                        <div class="stat-number">8</div>
                        <div class="stat-description">Miembros con pagos atrasados</div>
                    </div>
                    <div class="card-actions">
                        <a href="#" class="btn btn-primary btn-sm">Gestionar</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h3>Reservas Hoy</h3>
                        <div class="icon"><i class="fas fa-calendar-check"></i></div>
                    </div>
                    <div class="card-content">
                        <div class="stat-number">15</div>
                        <div class="stat-description">Clases reservadas para hoy</div>
                    </div>
                    <div class="card-actions">
                        <a href="#" class="btn btn-primary btn-sm">Ver calendario</a>
                    </div>
                </div>
            </div>

            <!-- Acciones rápidas -->
            <div class="quick-actions">
                <div class="action-btn" onclick="location.href='#'">
                    <div class="action-icon"><i class="fas fa-user-plus"></i></div>
                    <div class="action-text">Registrar Nuevo Miembro</div>
                </div>

                <div class="action-btn" onclick="location.href='#'">
                    <div class="action-icon"><i class="fas fa-qrcode"></i></div>
                    <div class="action-text">Escanear Acceso</div>
                </div>

                <div class="action-btn" onclick="location.href='#'">
                    <div class="action-icon"><i class="fas fa-credit-card"></i></div>
                    <div class="action-text">Registrar Pago</div>
                </div>

                <div class="action-btn" onclick="location.href='#'">
                    <div class="action-icon"><i class="fas fa-calendar-plus"></i></div>
                    <div class="action-text">Nueva Reserva</div>
                </div>
            </div>

            <!-- Actividad reciente -->
            <div class="recent-activity">
                <h2>Actividad Reciente</h2>
                <div class="activity-list">
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-walking"></i>
                        </div>
                        <div class="activity-details">
                            <p>María González ingresó al gimnasio</p>
                            <span class="activity-time">Hace 5 minutos</span>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-credit-card"></i>
                        </div>
                        <div class="activity-details">
                            <p>Pago registrado - Carlos Rodríguez</p>
                            <span class="activity-time">Hace 25 minutos</span>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        <div class="activity-details">
                            <p>Nuevo miembro registrado: Ana Torres</p>
                            <span class="activity-time">Hace 1 hora</span>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-dumbbell"></i>
                        </div>
                        <div class="activity-details">
                            <p>Clase de Yoga llena (20/20 participantes)</p>
                            <span class="activity-time">Hace 2 horas</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Lista de miembros -->
            <div class="members-list">
                <div class="members-header">
                    <h2>Miembros Recientes</h2>
                    <div class="search-box">
                        <input type="text" class="search-input" placeholder="Buscar miembro...">
                        <button class="search-btn">Buscar</button>
                    </div>
                </div>

                <table class="members-table">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>DNI</th>
                            <th>Plan</th>
                            <th>Fecha de Ingreso</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Ana Torres</td>
                            <td>71234567</td>
                            <td>Premium</td>
                            <td>15/05/2023</td>
                            <td><span class="member-status status-active">Activo</span></td>
                            <td>
                                <a href="#" class="btn btn-secondary btn-sm">Editar</a>
                            </td>
                        </tr>
                        <tr>
                            <td>Carlos Rodríguez</td>
                            <td>76543210</td>
                            <td>Básico</td>
                            <td>22/05/2023</td>
                            <td><span class="member-status status-active">Activo</span></td>
                            <td>
                                <a href="#" class="btn btn-secondary btn-sm">Editar</a>
                            </td>
                        </tr>
                        <tr>
                            <td>María González</td>
                            <td>72345678</td>
                            <td>VIP</td>
                            <td>10/05/2023</td>
                            <td><span class="member-status status-pending">Pendiente pago</span></td>
                            <td>
                                <a href="#" class="btn btn-secondary btn-sm">Editar</a>
                            </td>
                        </tr>
                        <tr>
                            <td>Jorge Pérez</td>
                            <td>73456789</td>
                            <td>Premium</td>
                            <td>28/04/2023</td>
                            <td><span class="member-status status-inactive">Inactivo</span></td>
                            <td>
                                <a href="#" class="btn btn-secondary btn-sm">Editar</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </main>
        <script src="Recursos/JS/Recepcionista.js"></script>
    </div>
</body>
</html>