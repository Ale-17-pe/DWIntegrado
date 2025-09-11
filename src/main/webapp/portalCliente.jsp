<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Perfil - AresFitness</title>
    <link rel="stylesheet" href="Recursos/Css/perfiluser.css">
    <link rel="icon" href="Imagenes/logo.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Header -->
    <header>
        <div class="logo-container">
            <a href="index.jsp">
                <img src="Recursos/Imagenes/logo.png" alt="Logo AresFitness">
            </a>
        </div>
         <nav>
                <a href="index.jsp" class="btn_cerrar">
                    <i class="cerrar"></i>Cerrar sesión
                </a>
            </nav>
    </header>

    <!-- Perfil -->
    <main class="main-perfil">
        <section class="perfil-panel">
            <div class="perfil-contenedor">

                <!-- Imagen de perfil -->
                <div class="perfil-imagen">
                    <div class="imagen-wrapper">
                        <div class="avatar-container">
                            <i class="fas fa-user-circle icono-usuario"></i>
                            <label class="icono-camara">
                                <i class="fas fa-camera"></i>
                                <input type="file" accept="image/*" hidden>
                                <span class="tooltip">Cambiar foto</span>
                            </label>
                        </div>
                        <div class="nivel-usuario">
                            <div class="barra-progreso">
                                <div class="progreso" style="width: 65%;"></div>
                            </div>
                            <span>FOTOGRAFIA</span>
                        </div>
                    </div>
                </div>

                <!-- Línea divisoria -->
                <div class="linea-divisoria">
                    <div class="circulo-divisor"></div>
                    <div class="circulo-divisor"></div>
                </div>

                <!-- Datos del perfil -->
                <div class="perfil-datos">
                    <h1 class="titulo-perfil">Mi Perfil</h1>

                    <div class="dato-perfil">
                        <div class="icono-dato"><i class="fas fa-user"></i></div>
                        <div class="contenido-dato">
                            <label>Nombre:</label>
                         
                        </div>
                    </div>

                    <div class="dato-perfil">
                        <div class="icono-dato"><i class="fas fa-envelope"></i></div>
                        <div class="contenido-dato">
                            <label>Correo:</label>
                         
                        </div>
                    </div>

                    <div class="dato-perfil">
                        <div class="icono-dato"><i class="fas fa-phone"></i></div>
                        <div class="contenido-dato">
                            <label>Teléfono:</label>
                        </div>
                    </div>

                    <div class="dato-perfil">
                        <div class="icono-dato"><i class="fas fa-id-card"></i></div>
                        <div class="contenido-dato">
                            <label>DNI:</label>
                           
                        </div>
                    </div>

                    <div class="dato-perfil">
                        <div class="icono-dato"><i class="fas fa-venus-mars"></i></div>
                        <div class="contenido-dato">
                            <label>Género:</label>
                            
                      </div>
                    </div>

                    <div class="dato-perfil">
                        <div class="icono-dato"><i class="fas fa-calendar-alt"></i></div>
                        <div class="contenido-dato">
                            <label>Fecha de Nacimiento:</label>
                        </div>
                    </div>

                    <div class="dato-perfil">
                        <div class="icono-dato"><i class="fas fa-map-marker-alt"></i></div>
                        <div class="contenido-dato">
                            <label>Dirección:</label>
                        </div>
                    </div>

                    <div class="dato-perfil">
                        <div class="icono-dato"><i class="fas fa-dumbbell"></i></div>
                        <div class="contenido-dato">
                            <label>Plan Ares Fitness:</label>
                            <p class="valor-dato">
                                <span class="plan-tag plan-premium"></span>
                                <span class="fecha-renovacion">Renovación: </span>
                            </p>
                        </div>
                    </div>

                    <div class="acciones-perfil">
                        <a href="#" class="btn-editar"><i class="fas fa-user-edit"></i> Editar perfil</a>
                        <a href="#" class="btn-progreso"><i class="fas fa-chart-line"></i> Ver mi progreso</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- Estadísticas -->
        <section class="estadisticas-perfil">
            <div class="tarjeta-estadistica">
                <i class="fas fa-fire icono-estadistica"></i>
                <h3>Días entrenados</h3>
                <p class="valor-estadistica">24</p>
                <p class="meta-estadistica">Meta: 30 este mes</p>
            </div>
            <div class="tarjeta-estadistica">
                <i class="fas fa-weight-hanging icono-estadistica"></i>
                <h3>Logros</h3>
                <p class="valor-estadistica">8</p>
                <p class="meta-estadistica">¡Sigue así!</p>
            </div>
            <div class="tarjeta-estadistica">
                <i class="fas fa-trophy icono-estadistica"></i>
                <h3>Puntos</h3>
                <p class="valor-estadistica">1,250</p>
                <p class="meta-estadistica">Top 15%</p>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 AresFitness. Todos los derechos reservados.</p>
    </footer>

    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>