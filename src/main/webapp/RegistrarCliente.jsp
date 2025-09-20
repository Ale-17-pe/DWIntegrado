<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Miembro - AresFitness</title>
    <link rel="stylesheet" href="Recursos/Css/registrarCliente.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
    <div class="admin-container">
        <header class="admin-header">
            <div class="header-content">
                <h1>Portal del Recepcionista - AresFitness</h1>
                <div class="user-info">
                    <span>Bienvenido/a, Recepcionista</span>
                    <button class="btn btn-primary" onclick="location.href='portalRecepcionista.jsp'">
                        <i class="fas fa-arrow-left"></i> Volver al Dashboard
                    </button>
                </div>
            </div>
        </header>
        <aside class="sidebar">
            <nav class="admin-nav">
                <ul>
                    <li class="nav-item">
                        <a href="portalRecepcionista.jsp">
                            <span class="icon"><i class="fas fa-home"></i></span>
                            <span>Inicio</span>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a href="#">
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
        <main class="admin-main">
            <div class="breadcrumb">
                <a href="recepcionista.jsp">Dashboard</a>
                <span>/</span>
                <span>Registrar Nuevo Miembro</span>
            </div>
            <div class="alert" id="form-alert"></div>
            <div class="form-container">
                <h2 class="form-title">
                    <i class="fas fa-user-plus"></i> Registrar Nuevo Miembro
                </h2>
                <form id="member-form">
                    <div class="form-grid">
                        <!-- Información básica -->
                        <div class="form-group">
                            <label class="form-label" for="dni">DNI *</label>
                            <input type="text" id="dni" name="dni" class="form-input" required 
                                   maxlength="8" pattern="[0-9]{8}" title="El DNI debe tener 8 dígitos"
                                   placeholder="Ingrese el DNI (8 dígitos)">
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="nombre">Nombre *</label>
                            <input type="text" id="nombre" name="nombre" class="form-input" required
                                   placeholder="Ingrese el nombre">
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="apellido">Apellido *</label>
                            <input type="text" id="apellido" name="apellido" class="form-input" required
                                   placeholder="Ingrese el apellido">
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="correo">Correo electrónico *</label>
                            <input type="email" id="correo" name="correo" class="form-input" required
                                   placeholder="ejemplo@correo.com">
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="telefono">Teléfono *</label>
                            <input type="tel" id="telefono" name="telefono" class="form-input" required
                                   placeholder="Ingrese el teléfono">
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="genero">Género *</label>
                            <select id="genero" name="genero" class="form-select" required>
                                <option value="">Seleccionar género</option>
                                <option value="masculino">Masculino</option>
                                <option value="femenino">Femenino</option>
                                <option value="otro">Otro</option>
                                <option value="prefiero_no_decirlo">Prefiero no decirlo</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="direccion">Dirección</label>
                            <textarea id="direccion" name="direccion" class="form-textarea" rows="3"
                                      placeholder="Ingrese la dirección completa"></textarea>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button type="reset" class="btn btn-secondary">
                            <i class="fas fa-times"></i> Limpiar
                        </button>
                        <button type="#" class="btn btn-primary" id="btnRegistrar">
                            <i class="fas fa-save"></i> Registrar Miembro
                        </button>
                    </div>
                </form>
            </div>
        </main>
    </div>
    <script src="Recursos/JS/RegistarCliente.js"></script>
</body>
</html>
