<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal del Administrador - AresFitness</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --color-primario: #d82c2c;
            --color-primario-hover: #b82424;
            --color-secundario: #ffd500;
            --color-secundario-hover: #ffdf40;
            --color-fondo: #0f0e0d;
            --color-fondo-card: rgba(30, 30, 30, 0.7);
            --color-texto: #ffffff;
            --color-texto-secundario: #b0b0b0;
            --color-bordes: rgba(255, 213, 0, 0.3);
            --sombra: 0 10px 30px rgba(0, 0, 0, 0.4);
            --sombra-hover: 0 15px 40px rgba(0, 0, 0, 0.5);
            --gradiente-dorado: linear-gradient(135deg, #ffd500, #ffed4e);
            --gradiente-rojo: linear-gradient(135deg, #d82c2c, #ff5252);
            --gradiente-verde: linear-gradient(135deg, #06d6a0, #1b9aaa);
            --gradiente-azul: linear-gradient(135deg, #118ab2, #073b4c);
            --gradiente-purpura: linear-gradient(135deg, #7209b7, #560bad);
            --transicion: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            --sidebar-width: 280px;
            --header-height: 80px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #0a0a0a 0%, #1a1a1a 100%);
            color: var(--color-texto);
            font-family: 'Montserrat', sans-serif;
            line-height: 1.6;
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* Animaciones */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideIn {
            from { transform: translateX(-50px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        @keyframes glow {
            0% { box-shadow: 0 0 10px rgba(255, 215, 0, 0.4); }
            50% { box-shadow: 0 0 20px rgba(255, 215, 0, 0.7); }
            100% { box-shadow: 0 0 10px rgba(255, 215, 0, 0.4); }
        }

        /* Contenedor principal */
        .admin-container {
            display: flex;
            min-height: 100vh;
        }

        /* Header Styles */
        .admin-header {
            position: fixed;
            top: 0;
            left: var(--sidebar-width);
            right: 0;
            height: var(--header-height);
            background: rgba(20, 20, 20, 0.9);
            box-shadow: var(--sombra);
            z-index: 100;
            display: flex;
            align-items: center;
            padding: 0 30px;
            backdrop-filter: blur(10px);
            border-bottom: 1px solid var(--color-bordes);
            animation: fadeIn 0.8s ease-out;
        }

        .header-content {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .admin-header h1 {
            font-size: 24px;
            font-weight: 700;
            color: var(--color-secundario);
            text-shadow: 0 0 10px rgba(255, 213, 0, 0.3);
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .user-info span {
            font-weight: 500;
            color: var(--color-texto-secundario);
        }

        .logout-btn {
            background: var(--gradiente-rojo);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 30px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transicion);
            display: flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 4px 15px rgba(216, 44, 44, 0.3);
        }

        .logout-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 7px 20px rgba(216, 44, 44, 0.4);
        }

        /* Sidebar Styles */
        .sidebar {
            width: var(--sidebar-width);
            background: var(--color-fondo);
            color: white;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            padding: 30px 0;
            overflow-y: auto;
            border-right: 1px solid var(--color-bordes);
        }

        .admin-nav ul {
            list-style: none;
        }

        .nav-item {
            margin-bottom: 5px;
        }

        .nav-item a {
            display: flex;
            align-items: center;
            padding: 15px 30px;
            color: var(--color-texto-secundario);
            text-decoration: none;
            transition: var(--transicion);
            font-weight: 500;
        }

        .nav-item a:hover {
            background: rgba(255, 255, 255, 0.05);
            color: var(--color-texto);
            padding-left: 35px;
        }

        .nav-item.active a {
            background: rgba(216, 44, 44, 0.15);
            color: var(--color-texto);
            border-left: 4px solid var(--color-secundario);
        }

        .nav-item .icon {
            margin-right: 15px;
            font-size: 18px;
            width: 24px;
            text-align: center;
            color: var(--color-secundario);
        }

        /* Main Content Styles */
        .admin-main {
            flex: 1;
            margin-left: var(--sidebar-width);
            margin-top: var(--header-height);
            padding: 30px;
        }

        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }

        .card {
            background: var(--color-fondo-card);
            border-radius: 15px;
            box-shadow: var(--sombra);
            overflow: hidden;
            transition: var(--transicion);
            border: 1px solid var(--color-bordes);
            backdrop-filter: blur(10px);
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: var(--sombra-hover);
            border-color: rgba(255, 213, 0, 0.5);
        }

        .card-header {
            padding: 20px;
            border-bottom: 1px solid var(--color-bordes);
        }

        .card-header h3 {
            font-size: 16px;
            font-weight: 600;
            color: var(--color-secundario);
            margin: 0;
        }

        .card-content {
            padding: 20px;
            display: flex;
            flex-direction: column;
        }

        .stat-number {
            font-size: 32px;
            font-weight: 700;
            color: var(--color-texto);
            margin-bottom: 10px;
            text-shadow: 0 0 10px rgba(255, 255, 255, 0.2);
        }

        .stat-change {
            font-size: 14px;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

        .stat-change.positive {
            color: #06d6a0;
        }

        .stat-change.negative {
            color: var(--color-primario);
        }

        /* Recent Activity Styles */
        .recent-activity {
            background: var(--color-fondo-card);
            border-radius: 15px;
            box-shadow: var(--sombra);
            padding: 25px;
            border: 1px solid var(--color-bordes);
            backdrop-filter: blur(10px);
        }

        .recent-activity h2 {
            font-size: 20px;
            font-weight: 600;
            color: var(--color-secundario);
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid var(--color-bordes);
            text-shadow: 0 0 10px rgba(255, 213, 0, 0.3);
        }

        .activity-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .activity-item {
            display: flex;
            align-items: flex-start;
            gap: 15px;
            padding: 15px;
            border-radius: 10px;
            transition: var(--transicion);
        }

        .activity-item:hover {
            background: rgba(255, 255, 255, 0.05);
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: rgba(255, 213, 0, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            color: var(--color-secundario);
            flex-shrink: 0;
        }

        .activity-details {
            flex: 1;
        }

        .activity-details p {
            font-weight: 500;
            margin-bottom: 5px;
        }

        .activity-time {
            font-size: 13px;
            color: var(--color-texto-secundario);
        }

        /* Plan Management Styles */
        .plan-management {
            background: var(--color-fondo-card);
            border-radius: 15px;
            box-shadow: var(--sombra);
            padding: 25px;
            border: 1px solid var(--color-bordes);
            backdrop-filter: blur(10px);
            margin-bottom: 40px;
        }

        .plan-management h2 {
            font-size: 20px;
            font-weight: 600;
            color: var(--color-secundario);
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid var(--color-bordes);
            text-shadow: 0 0 10px rgba(255, 213, 0, 0.3);
        }

        .plan-form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--color-texto-secundario);
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            background: rgba(20, 20, 20, 0.7);
            border: 1px solid var(--color-bordes);
            border-radius: 8px;
            color: var(--color-texto);
            font-family: 'Montserrat', sans-serif;
            transition: var(--transicion);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--color-secundario);
            box-shadow: 0 0 0 2px rgba(255, 213, 0, 0.2);
        }

        textarea.form-control {
            min-height: 100px;
            resize: vertical;
        }

        .form-group.full-width {
            grid-column: span 2;
        }

        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transicion);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .btn-primary {
            background: var(--gradiente-dorado);
            color: #000;
            box-shadow: 0 4px 15px rgba(255, 213, 0, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 7px 20px rgba(255, 213, 0, 0.4);
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            color: var(--color-texto);
            border: 1px solid var(--color-bordes);
        }

        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.15);
        }

        .btn-success {
            background: var(--gradiente-verde);
            color: white;
        }

        .btn-info {
            background: var(--gradiente-azul);
            color: white;
        }

        .plans-list {
            margin-top: 30px;
        }

        .plans-list h3 {
            font-size: 18px;
            font-weight: 600;
            color: var(--color-secundario);
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid var(--color-bordes);
        }

        .plan-item {
            background: rgba(20, 20, 20, 0.5);
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 15px;
            border: 1px solid var(--color-bordes);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .plan-info h4 {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 5px;
            color: var(--color-texto);
        }

        .plan-info p {
            font-size: 14px;
            color: var(--color-texto-secundario);
            margin-bottom: 5px;
        }

        .plan-price {
            font-weight: 700;
            color: var(--color-secundario);
            font-size: 18px;
        }

        .plan-actions {
            display: flex;
            gap: 10px;
        }

        .btn-icon {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.1);
            color: var(--color-texto);
            border: 1px solid var(--color-bordes);
            cursor: pointer;
            transition: var(--transicion);
        }

        .btn-icon:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        .btn-edit {
            color: var(--color-secundario);
        }

        .btn-delete {
            color: var(--color-primario);
        }

        /* Section Styles */
        .section {
            display: none;
        }

        .section.active {
            display: block;
            animation: fadeIn 0.5s ease-out;
        }

        /* Table Styles */
        .data-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background: var(--color-fondo-card);
            border-radius: 10px;
            overflow: hidden;
        }

        .data-table th, .data-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid var(--color-bordes);
        }

        .data-table th {
            background: rgba(216, 44, 44, 0.2);
            color: var(--color-secundario);
            font-weight: 600;
        }

        .data-table tr:hover {
            background: rgba(255, 255, 255, 0.05);
        }

        /* User Management */
        .user-filters {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }

        /* Content Management */
        .content-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }

        .content-card {
            background: rgba(20, 20, 20, 0.5);
            border-radius: 10px;
            padding: 20px;
            border: 1px solid var(--color-bordes);
        }

        /* Stats Section */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .chart-container {
            background: var(--color-fondo-card);
            border-radius: 15px;
            padding: 20px;
            border: 1px solid var(--color-bordes);
            margin-bottom: 20px;
        }

        /* Permissions Section */
        .permissions-grid {
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 30px;
        }

        .role-list {
            background: var(--color-fondo-card);
            border-radius: 15px;
            padding: 20px;
            border: 1px solid var(--color-bordes);
        }

        .permission-details {
            background: var(--color-fondo-card);
            border-radius: 15px;
            padding: 20px;
            border: 1px solid var(--color-bordes);
        }

        /* Settings Section */
        .settings-category {
            margin-bottom: 30px;
        }

        .settings-option {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            border-bottom: 1px solid var(--color-bordes);
        }

        /* Responsive Styles */
        @media (max-width: 992px) {
            .dashboard-cards {
                grid-template-columns: repeat(2, 1fr);
            }

            .plan-form {
                grid-template-columns: 1fr;
            }

            .form-group.full-width {
                grid-column: span 1;
            }

            .permissions-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            :root {
                --sidebar-width: 70px;
            }

            .sidebar {
                width: var(--sidebar-width);
            }

            .nav-item span:not(.icon) {
                display: none;
            }

            .nav-item a {
                justify-content: center;
                padding: 15px;
            }

            .nav-item .icon {
                margin-right: 0;
                font-size: 20px;
            }

            .admin-header {
                left: var(--sidebar-width);
            }

            .admin-main {
                margin-left: var(--sidebar-width);
            }

            .dashboard-cards {
                grid-template-columns: 1fr;
            }

            .admin-header h1 {
                font-size: 20px;
            }

            .user-info span {
                display: none;
            }

            .plan-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .plan-actions {
                align-self: flex-end;
            }

            .user-filters {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 576px) {
            .admin-header {
                padding: 0 15px;
            }

            .admin-main {
                padding: 15px;
            }

            .card {
                margin-bottom: 15px;
            }

            .data-table {
                font-size: 14px;
            }

            .data-table th, .data-table td {
                padding: 10px;
            }
        }

        /* Animation for page load */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .admin-main > * {
            animation: fadeIn 0.5s ease-out;
        }

        .card:nth-child(1) { animation-delay: 0.1s; }
        .card:nth-child(2) { animation-delay: 0.2s; }
        .card:nth-child(3) { animation-delay: 0.3s; }
        .card:nth-child(4) { animation-delay: 0.4s; }

        .recent-activity, .plan-management {
            animation-delay: 0.5s;
        }
    </style>
</head>
<body>
<div class="admin-container">
    <!-- Header con información del usuario -->
    <header class="admin-header">
        <div class="header-content">
            <h1>Portal del Administrador</h1>
            <div class="user-info">
                <span>Bienvenido, Admin</span>
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
                    <a href="#">
                        <span class="icon"><i class="fas fa-chart-bar"></i></span>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="nav-item" data-section="users">
                    <a href="#">
                        <span class="icon"><i class="fas fa-users"></i></span>
                        <span>Gestión de Usuarios</span>
                    </a>
                </li>
                <li class="nav-item" data-section="plans">
                    <a href="#">
                        <span class="icon"><i class="fas fa-crown"></i></span>
                        <span>Gestión de Planes</span>
                    </a>
                </li>
                <li class="nav-item" data-section="content">
                    <a href="#">
                        <span class="icon"><i class="fas fa-file-alt"></i></span>
                        <span>Gestión de Contenido</span>
                    </a>
                </li>
                <li class="nav-item" data-section="settings">
                    <a href="#">
                        <span class="icon"><i class="fas fa-cog"></i></span>
                        <span>Configuración del Sistema</span>
                    </a>
                </li>
                <li class="nav-item" data-section="stats">
                    <a href="#">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span>Estadísticas Detalladas</span>
                    </a>
                </li>
                <li class="nav-item" data-section="permissions">
                    <a href="#">
                        <span class="icon"><i class="fas fa-lock"></i></span>
                        <span>Gestión de Permisos</span>
                    </a>
                </li>
            </ul>
        </nav>
    </aside>

    <!-- Contenido principal -->
    <main class="admin-main">
        <!-- Dashboard Section -->
        <div id="dashboard-section" class="section active">
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
                            <p>Nuevo usuario registrado: María González</p>
                            <span class="activity-time">Hace 10 minutos</span>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-file-alt"></i>
                        </div>
                        <div class="activity-details">
                            <p>Artículo "Nuevas Funcionalidades" fue actualizado</p>
                            <span class="activity-time">Hace 45 minutos</span>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-cog"></i>
                        </div>
                        <div class="activity-details">
                            <p>Configuración del sistema modificada</p>
                            <span class="activity-time">Hace 2 horas</span>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <div class="activity-details">
                            <p>Problema #2347 fue resuelto</p>
                            <span class="activity-time">Hace 5 horas</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Users Management Section -->
        <div id="users-section" class="section">
            <div class="plan-management">
                <h2>Gestión de Usuarios</h2>

                <div class="user-filters">
                    <div class="form-group">
                        <label for="userSearch">Buscar Usuario</label>
                        <input type="text" id="userSearch" class="form-control" placeholder="Nombre, email o ID">
                    </div>
                    <div class="form-group">
                        <label for="userStatus">Estado</label>
                        <select id="userStatus" class="form-control">
                            <option value="">Todos</option>
                            <option value="active">Activo</option>
                            <option value="inactive">Inactivo</option>
                            <option value="suspended">Suspendido</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="userPlan">Plan</label>
                        <select id="userPlan" class="form-control">
                            <option value="">Todos</option>
                            <option value="basic">Básico</option>
                            <option value="premium">Premium</option>
                            <option value="elite">Elite</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>&nbsp;</label>
                        <button class="btn btn-primary"><i class="fas fa-filter"></i> Filtrar</button>
                    </div>
                </div>

                <table class="data-table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Email</th>
                        <th>Plan</th>
                        <th>Estado</th>
                        <th>Registro</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1001</td>
                        <td>María González</td>
                        <td>maria@example.com</td>
                        <td>Premium</td>
                        <td><span class="stat-change positive">Activo</span></td>
                        <td>2023-10-15</td>
                        <td>
                            <div class="plan-actions">
                                <button class="btn-icon btn-edit"><i class="fas fa-edit"></i></button>
                                <button class="btn-icon btn-delete"><i class="fas fa-trash"></i></button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>1002</td>
                        <td>Carlos Rodríguez</td>
                        <td>carlos@example.com</td>
                        <td>Básico</td>
                        <td><span class="stat-change positive">Activo</span></td>
                        <td>2023-11-02</td>
                        <td>
                            <div class="plan-actions">
                                <button class="btn-icon btn-edit"><i class="fas fa-edit"></i></button>
                                <button class="btn-icon btn-delete"><i class="fas fa-trash"></i></button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>1003</td>
                        <td>Ana Martínez</td>
                        <td>ana@example.com</td>
                        <td>Elite</td>
                        <td><span class="stat-change negative">Inactivo</span></td>
                        <td>2023-09-20</td>
                        <td>
                            <div class="plan-actions">
                                <button class="btn-icon btn-edit"><i class="fas fa-edit"></i></button>
                                <button class="btn-icon btn-delete"><i class="fas fa-trash"></i></button>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <div class="form-group full-width" style="margin-top: 20px;">
                    <button class="btn btn-primary">
                        <i class="fas fa-plus"></i> Agregar Nuevo Usuario
                    </button>
                    <button class="btn btn-secondary">
                        <i class="fas fa-download"></i> Exportar Datos
                    </button>
                </div>
            </div>
        </div>

        <!-- Plan Management Section -->
        <div id="plans-section" class="section">
            <div class="plan-management">
                <h2>Gestión de Planes</h2>
                <form id="planForm" class="plan-form">
                    <div class="form-group">
                        <label for="planName">Nombre del Plan</label>
                        <input type="text" id="planName" class="form-control" placeholder="Ej: Plan Premium" required>
                    </div>
                    <div class="form-group">
                        <label for="planPrice">Precio ($)</label>
                        <input type="number" id="planPrice" class="form-control" placeholder="Ej: 29.99" min="0" step="0.01" required>
                    </div>
                    <div class="form-group">
                        <label for="planDuration">Duración (días)</label>
                        <input type="number" id="planDuration" class="form-control" placeholder="Ej: 30" min="1" required>
                    </div>
                    <div class="form-group">
                        <label for="planStatus">Estado</label>
                        <select id="planStatus" class="form-control" required>
                            <option value="active">Activo</option>
                            <option value="inactive">Inactivo</option>
                        </select>
                    </div>
                    <div class="form-group full-width">
                        <label for="planDescription">Descripción</label>
                        <textarea id="planDescription" class="form-control" placeholder="Describe los beneficios y características del plan..." required></textarea>
                    </div>
                    <div class="form-group full-width">
                        <label for="planFeatures">Características (separadas por coma)</label>
                        <input type="text" id="planFeatures" class="form-control" placeholder="Ej: Acceso a todas las clases, Entrenador personal, Nutricionista..." required>
                    </div>
                    <div class="form-group full-width">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-plus"></i> Crear Plan
                        </button>
                        <button type="reset" class="btn btn-secondary">
                            <i class="fas fa-times"></i> Limpiar
                        </button>
                    </div>
                </form>

                <div class="plans-list">
                    <h3>Planes Existentes</h3>
                    <div class="plan-item">
                        <div class="plan-info">
                            <h4>Plan Básico</h4>
                            <p>Acceso a clases básicas y seguimiento mensual</p>
                            <span class="plan-price">$19.99/mes</span>
                        </div>
                        <div class="plan-actions">
                            <button class="btn-icon btn-edit">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="btn-icon btn-delete">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                    </div>
                    <div class="plan-item">
                        <div class="plan-info">
                            <h4>Plan Premium</h4>
                            <p>Acceso completo a todas las funciones premium</p>
                            <span class="plan-price">$49.99/mes</span>
                        </div>
                        <div class="plan-actions">
                            <button class="btn-icon btn-edit">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="btn-icon btn-delete">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                    </div>
                    <div class="plan-item">
                        <div class="plan-info">
                            <h4>Plan Anual Premium</h4>
                            <p>Acceso completo con descuento por pago anual</p>
                            <span class="plan-price">$399.99/año</span>
                        </div>
                        <div class="plan-actions">
                            <button class="btn-icon btn-edit">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="btn-icon btn-delete">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Content Management Section -->
        <div id="content-section" class="section">
            <div class="plan-management">
                <h2>Gestión de Contenido</h2>

                <div class="user-filters">
                    <div class="form-group">
                        <label for="contentSearch">Buscar Contenido</label>
                        <input type="text" id="contentSearch" class="form-control" placeholder="Título, categoría o ID">
                    </div>
                    <div class="form-group">
                        <label for="contentType">Tipo</label>
                        <select id="contentType" class="form-control">
                            <option value="">Todos</option>
                            <option value="article">Artículo</option>
                            <option value="video">Video</option>
                            <option value="workout">Rutina</option>
                            <option value="diet">Plan Dietético</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="contentStatus">Estado</label>
                        <select id="contentStatus" class="form-control">
                            <option value="">Todos</option>
                            <option value="published">Publicado</option>
                            <option value="draft">Borrador</option>
                            <option value="archived">Archivado</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>&nbsp;</label>
                        <button class="btn btn-primary"><i class="fas fa-filter"></i> Filtrar</button>
                    </div>
                </div>

                <div class="content-grid">
                    <div class="content-card">
                        <h4>Rutina Principiante</h4>
                        <p>Rutina de entrenamiento para usuarios que recién comienzan</p>
                        <div class="plan-actions" style="margin-top: 15px;">
                            <button class="btn-icon btn-edit"><i class="fas fa-edit"></i></button>
                            <button class="btn-icon btn-delete"><i class="fas fa-trash"></i></button>
                            <span class="stat-change positive">Publicado</span>
                        </div>
                    </div>

                    <div class="content-card">
                        <h4>Video: Técnica de Sentadilla</h4>
                        <p>Guía completa para realizar sentadillas con la forma correcta</p>
                        <div class="plan-actions" style="margin-top: 15px;">
                            <button class="btn-icon btn-edit"><i class="fas fa-edit"></i></button>
                            <button class="btn-icon btn-delete"><i class="fas fa-trash"></i></button>
                            <span class="stat-change positive">Publicado</span>
                        </div>
                    </div>

                    <div class="content-card">
                        <h4>Dieta Mediterránea</h4>
                        <p>Plan alimenticio basado en la dieta mediterránea</p>
                        <div class="plan-actions" style="margin-top: 15px;">
                            <button class="btn-icon btn-edit"><i class="fas fa-edit"></i></button>
                            <button class="btn-icon btn-delete"><i class="fas fa-trash"></i></button>
                            <span class="stat-change">Borrador</span>
                        </div>
                    </div>
                </div>

                <div class="form-group full-width" style="margin-top: 20px;">
                    <button class="btn btn-primary">
                        <i class="fas fa-plus"></i> Crear Nuevo Contenido
                    </button>
                    <button class="btn btn-info">
                        <i class="fas fa-folder"></i> Gestionar Categorías
                    </button>
                </div>
            </div>
        </div>

        <!-- System Settings Section -->
        <div id="settings-section" class="section">
            <div class="plan-management">
                <h2>Configuración del Sistema</h2>

                <div class="settings-category">
                    <h3>Configuración General</h3>
                    <div class="settings-option">
                        <div>
                            <h4>Nombre del Gimnasio</h4>
                            <p>Nombre que aparece en el sitio web y aplicaciones</p>
                        </div>
                        <input type="text" class="form-control" value="AresFitness" style="width: 200px;">
                    </div>
                    <div class="settings-option">
                        <div>
                            <h4>Moneda</h4>
                            <p>Moneda utilizada para precios y pagos</p>
                        </div>
                        <select class="form-control" style="width: 200px;">
                            <option selected>Dólares (USD)</option>
                            <option>Euros (EUR)</option>
                            <option>Pesos (MXN)</option>
                        </select>
                    </div>
                    <div class="settings-option">
                        <div>
                            <h4>Zona Horaria</h4>
                            <p>Zona horaria para registros y programación</p>
                        </div>
                        <select class="form-control" style="width: 200px;">
                            <option selected>UTC-05:00 (EST)</option>
                            <option>UTC-06:00 (CST)</option>
                            <option>UTC-08:00 (PST)</option>
                        </select>
                    </div>
                </div>

                <div class="settings-category">
                    <h3>Configuración de Notificaciones</h3>
                    <div class="settings-option">
                        <div>
                            <h4>Notificaciones por Email</h4>
                            <p>Enviar notificaciones por correo electrónico</p>
                        </div>
                        <label class="switch">
                            <input type="checkbox" checked>
                            <span class="slider round"></span>
                        </label>
                    </div>
                    <div class="settings-option">
                        <div>
                            <h4>Recordatorios de Pago</h4>
                            <p>Enviar recordatorios de pago automáticamente</p>
                        </div>
                        <label class="switch">
                            <input type="checkbox" checked>
                            <span class="slider round"></span>
                        </label>
                    </div>
                    <div class="settings-option">
                        <div>
                            <h4>Notificaciones de Nuevo Contenido</h4>
                            <p>Notificar a usuarios sobre nuevo contenido</p>
                        </div>
                        <label class="switch">
                            <input type="checkbox">
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <div class="form-group full-width" style="margin-top: 20px;">
                    <button class="btn btn-primary">
                        <i class="fas fa-save"></i> Guardar Configuración
                    </button>
                </div>
            </div>
        </div>

        <!-- Statistics Section -->
        <div id="stats-section" class="section">
            <div class="plan-management">
                <h2>Estadísticas Detalladas</h2>

                <div class="stats-grid">
                    <div class="card">
                        <div class="card-header">
                            <h3>Ingresos Mensuales</h3>
                        </div>
                        <div class="card-content">
                            <span class="stat-number">$24,568</span>
                            <span class="stat-change positive">
                                    <i class="fas fa-arrow-up"></i> +12% desde el mes pasado
                                </span>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <h3>Nuevos Usuarios</h3>
                        </div>
                        <div class="card-content">
                            <span class="stat-number">142</span>
                            <span class="stat-change positive">
                                    <i class="fas fa-arrow-up"></i> +8% desde el mes pasado
                                </span>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <h3>Retención de Usuarios</h3>
                        </div>
                        <div class="card-content">
                            <span class="stat-number">87%</span>
                            <span class="stat-change positive">
                                    <i class="fas fa-arrow-up"></i> +3% desde el mes pasado
                                </span>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <h3>Contenido Consumido</h3>
                        </div>
                        <div class="card-content">
                            <span class="stat-number">3,452</span>
                            <span class="stat-change positive">
                                    <i class="fas fa-arrow-up"></i> +15% desde el mes pasado
                                </span>
                        </div>
                    </div>
                </div>

                <div class="chart-container">
                    <h3>Ingresos por Plan (Últimos 6 meses)</h3>
                    <div style="height: 300px; background: rgba(255,255,255,0.05); border-radius: 10px; display: flex; align-items: center; justify-content: center; color: var(--color-texto-secundario);">
                        Gráfico de Ingresos
                    </div>
                </div>

                <div class="chart-container">
                    <h3>Distribución de Usuarios por Plan</h3>
                    <div style="height: 300px; background: rgba(255,255,255,0.05); border-radius: 10px; display: flex; align-items: center; justify-content: center; color: var(--color-texto-secundario);">
                        Gráfico de Distribución
                    </div>
                </div>
            </div>
        </div>

        <!-- Permissions Section -->
        <div id="permissions-section" class="section">
            <div class="plan-management">
                <h2>Gestión de Permisos</h2>

                <div class="permissions-grid">
                    <div class="role-list">
                        <h3>Roles del Sistema</h3>
                        <ul style="list-style: none;">
                            <li style="padding: 15px; border-bottom: 1px solid var(--color-bordes); cursor: pointer; background: rgba(255,213,0,0.1);">Administrador</li>
                            <li style="padding: 15px; border-bottom: 1px solid var(--color-bordes); cursor: pointer;">Entrenador</li>
                            <li style="padding: 15px; border-bottom: 1px solid var(--color-bordes); cursor: pointer;">Nutricionista</li>
                            <li style="padding: 15px; border-bottom: 1px solid var(--color-bordes); cursor: pointer;">Recepcionista</li>
                            <li style="padding: 15px; cursor: pointer;">Usuario</li>
                        </ul>

                        <button class="btn btn-secondary" style="margin-top: 20px; width: 100%;">
                            <i class="fas fa-plus"></i> Nuevo Rol
                        </button>
                    </div>

                    <div class="permission-details">
                        <h3>Permisos del Rol: Administrador</h3>
                        <p>Los administradores tienen acceso completo a todas las funciones del sistema.</p>

                        <div style="margin-top: 20px;">
                            <h4>Permisos de Módulos</h4>
                            <div class="settings-option">
                                <div>
                                    <h4>Gestión de Usuarios</h4>
                                    <p>Ver, editar y eliminar usuarios</p>
                                </div>
                                <label class="switch">
                                    <input type="checkbox" checked disabled>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                            <div class="settings-option">
                                <div>
                                    <h4>Gestión de Contenido</h4>
                                    <p>Crear, editar y publicar contenido</p>
                                </div>
                                <label class="switch">
                                    <input type="checkbox" checked disabled>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                            <div class="settings-option">
                                <div>
                                    <h4>Configuración del Sistema</h4>
                                    <p>Modificar configuraciones globales</p>
                                </div>
                                <label class="switch">
                                    <input type="checkbox" checked disabled>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                            <div class="settings-option">
                                <div>
                                    <h4>Reportes y Estadísticas</h4>
                                    <p>Acceder a reportes y análisis</p>
                                </div>
                                <label class="switch">
                                    <input type="checkbox" checked disabled>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group full-width" style="margin-top: 20px;">
                            <button class="btn btn-primary">
                                <i class="fas fa-save"></i> Guardar Permisos
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<script>
    // Script para navegación entre secciones
    document.addEventListener('DOMContentLoaded', function() {
        // Seleccionar elementos de navegación
        const navItems = document.querySelectorAll('.nav-item');
        const sections = document.querySelectorAll('.section');

        // Agregar evento click a cada elemento de navegación
        navItems.forEach(item => {
            item.addEventListener('click', function() {
                const sectionId = this.getAttribute('data-section');

                // Remover clase active de todos los elementos
                navItems.forEach(i => i.classList.remove('active'));
                sections.forEach(s => s.classList.remove('active'));

                // Agregar clase active al elemento clickeado
                this.classList.add('active');

                // Mostrar la sección correspondiente
                document.getElementById(`${sectionId}-section`).classList.add('active');
            });
        });

        // Función para cerrar sesión y redirigir a index.html
        const logoutButton = document.getElementById('logoutButton');
        logoutButton.addEventListener('click', function() {
            if(confirm('¿Estás seguro de que quieres cerrar sesión?')) {
                // Aquí puedes agregar lógica adicional para limpiar la sesión si es necesario

                // Redirigir a la página index.html después de 1 segundo
                setTimeout(function() {
                    window.location.href = 'index.jsp';
                }, 1000);

                // Mensaje de confirmación
                alert('Sesión cerrada con éxito. Redirigiendo...');
            }
        });

        // Agregar animaciones a las tarjetas al hacer hover
        const cards = document.querySelectorAll('.card');
        cards.forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-5px)';
            });

            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0)';
            });
        });

        // Manejo del formulario de creación de planes
        const planForm = document.getElementById('planForm');
        if (planForm) {
            planForm.addEventListener('submit', function(e) {
                e.preventDefault();

                // Obtener valores del formulario
                const planName = document.getElementById('planName').value;
                const planPrice = document.getElementById('planPrice').value;
                const planDuration = document.getElementById('planDuration').value;
                const planStatus = document.getElementById('planStatus').value;
                const planDescription = document.getElementById('planDescription').value;
                const planFeatures = document.getElementById('planFeatures').value;

                // Aquí iría la lógica para enviar los datos al servidor
                // Por ahora, solo mostraremos un mensaje de éxito
                alert(`Plan "${planName}" creado exitosamente!\nPrecio: $${planPrice}\nDuración: ${planDuration} días`);

                // Limpiar formulario
                planForm.reset();
            });
        }

        // Funcionalidad para botones de editar y eliminar planes
        const editButtons = document.querySelectorAll('.btn-edit');
        const deleteButtons = document.querySelectorAll('.btn-delete');

        editButtons.forEach(button => {
            button.addEventListener('click', function() {
                const card = this.closest('.plan-item, .content-card');
                const title = card.querySelector('h4').textContent;
                alert(`Editando: ${title}`);
                // Aquí iría la lógica para cargar los datos en el formulario
            });
        });

        deleteButtons.forEach(button => {
            button.addEventListener('click', function() {
                const card = this.closest('.plan-item, .content-card');
                const title = card.querySelector('h4').textContent;

                if(confirm(`¿Estás seguro de que quieres eliminar "${title}"?`)) {
                    card.remove();
                    alert(`"${title}" eliminado exitosamente`);
                }
            });
        });

        // Switch styling
        const switches = document.querySelectorAll('.switch');
        switches.forEach(switchElem => {
            switchElem.addEventListener('click', function() {
                const checkbox = this.querySelector('input[type="checkbox"]');
                checkbox.checked = !checkbox.checked;
            });
        });
    });
</script>
</body>
</html>