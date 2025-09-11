<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ubicación - AresFitness</title>
        <link rel="stylesheet" href="Recursos/Css/ubicacion.css">
        <link rel="icon" href="Recursos/Imagenes/logo.png" type="image/png">
        <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    <body>
        <header class="main-header">
            <div class="header-container">
                <div class="logo-container">
                    <a href="index.jsp">
                        <img src="Recursos/Imagenes/logo.png" alt="Logo AresFitness">
                    </a>
                </div>
                <nav class="main-nav">
                    <ul>
                        <li><a href="planes.jsp"><i class="fas fa-dumbbell"></i> PLANES</a></li>
                        <li><a href="ubicacion.jsp"><i class="fas fa-map-marker-alt"></i> UBICACIÓN</a></li>
                        <li><a href="EjerciciosServlet"><i class="fas fa-running"></i> EJERCICIOS</a></li>
                        <li><a href="planes2.jsp"><i class="fas fa-crown"></i> MEMBRESÍAS</a></li>
                    </ul>
                </nav>
                <div class="header-actions">
                    <button class="user-btn" id="userMenuBtn">
                        <i class="fas fa-user"></i> Mi Cuenta
                    </button>
                    <div class="auth-dropdown" id="authDropdown">
                        <a href="login.jsp">
                            <i class="fas fa-sign-in-alt"></i> Iniciar Sesión
                        </a>
                        <a href="registro.jsp">
                            <i class="fas fa-user-plus"></i> Registrarse
                        </a>
                    </div>
                    <div class="mobile-menu-btn">
                        <i class="fas fa-bars"></i>
                    </div>
                </div>
        </header>
        <style>
/* ESTILOS PARA EL MENÚ DE USUARIO */
.header-actions {
    display: flex;
    align-items: center;
    gap: 15px;
    position: relative;
}

.user-btn {
    background: linear-gradient(45deg, rgba(255, 213, 0, 0.2), rgba(216, 44, 44, 0.2));
    color: #ffd500 !important;
    border: 1px solid rgba(255, 213, 0, 0.3);
    padding: 10px 20px;
    border-radius: 30px;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 8px;
    font-weight: 600;
    transition: all 0.3s ease;
    font-size: 14px;
    position: relative;
    z-index: 10;
}

.user-btn:hover {
    background: linear-gradient(45deg, rgba(255, 213, 0, 0.3), rgba(216, 44, 44, 0.3));
    color: #fff !important;
    border-color: #ffd500;
    box-shadow: 0 0 15px rgba(255, 213, 0, 0.3);
    transform: translateY(-2px);
}

.user-btn i {
    font-size: 16px;
}

.auth-dropdown {
    position: absolute;
    top: calc(100% + 10px);
    right: 0;
    background: rgba(0, 0, 0, 0.95);
    border-radius: 10px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5), 0 0 0 1px rgba(255, 213, 0, 0.2);
    width: 220px;
    padding: 15px 0;
    margin-top: 5px;
    display: none;
    flex-direction: column;
    gap: 5px;
    z-index: 1000;
    backdrop-filter: blur(10px);
    opacity: 0;
    transform: translateY(-10px);
    transition: all 0.3s ease;
}

.auth-dropdown.show {
    display: flex;
    opacity: 1;
    transform: translateY(0);
    animation: fadeIn 0.4s ease-out forwards;
}

.auth-dropdown a {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 12px 20px;
    text-decoration: none;
    color: #ccc !important;
    font-weight: 500;
    transition: all 0.3s ease;
    position: relative;
}

.auth-dropdown a:hover {
    color: #ffd500 !important;
    background: rgba(255, 213, 0, 0.05);
}

.auth-dropdown a:hover::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    height: 100%;
    width: 3px;
    background: linear-gradient(to bottom, #ffd500, #d82c2c);
}

.auth-dropdown a i {
    width: 20px;
    text-align: center;
    font-size: 16px;
    color: #ffd500;
}

.mobile-menu-btn {
    display: none;
    color: #ffd500;
    font-size: 24px;
    cursor: pointer;
    background: rgba(255, 213, 0, 0.1);
    width: 40px;
    height: 40px;
    border-radius: 50%;
    justify-content: center;
    align-items: center;
    transition: all 0.3s ease;
}

.mobile-menu-btn:hover {
    background: rgba(255, 213, 0, 0.2);
    transform: scale(1.05);
}

/* Responsive para el menú de usuario */
@media (max-width: 992px) {
    .header-actions {
        order: 3;
        margin-left: auto;
    }
    
    .auth-dropdown {
        position: fixed;
        top: auto;
        bottom: 0;
        left: 0;
        width: 100%;
        border-radius: 15px 15px 0 0;
        transform: translateY(100%);
        box-shadow: 0 -5px 30px rgba(0, 0, 0, 0.3);
    }
    
    .auth-dropdown.show {
        transform: translateY(0);
    }
    
    .mobile-menu-btn {
        display: flex;
    }
}

@media (max-width: 576px) {
    .user-btn span {
        display: none;
    }
    
    .user-btn {
        padding: 10px;
        width: 40px;
        height: 40px;
        justify-content: center;
    }
}
</style>

        <!-- Sección de ubicación mejorada -->
        <main>
            <section class="hero-location" style="background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('Recursos/Imagenes/extencion.jpg') no-repeat center center/cover;">
                <div class="hero-overlay">
                    <div class="hero-content">
                        <h1>ENCUÉNTRANOS FÁCILMENTE</h1>
                        <p>Ven y conoce nuestras modernas instalaciones en un lugar estratégico de la ciudad</p>
                    </div>
                </div>
            </section>

            <section class="location-section">
                <div class="section-title">
                    <h2>NUESTRA UBICACIÓN</h2>
                    <div class="title-line"></div>
                    <p>Estamos ubicados en un lugar estratégico para tu comodidad</p>
                </div>

                <div class="location-container">
                    <div class="map-container">
                        <div class="map-frame">
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d975.6893812773908!2d-76.82245228381464!3d-11.991272776981225!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105e988107f9313%3A0xf42c35c05adcef9f!2sARES%20FITNESS!5e0!3m2!1ses-419!2spe!4v1745024811727!5m2!1ses-419!2spe"
                                width="100%"
                                height="450"
                                style="border:0;"
                                allowfullscreen=""
                                loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade">
                            </iframe>
                        </div>
                    </div>

                    <div class="location-info">
                        <div class="info-card">
                            <div class="info-icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="info-content">
                                <h3>Dirección</h3>
                                <p>Av. Principal 123, Lima, Perú</p>
                            </div>
                        </div>

                        <div class="info-card">
                            <div class="info-icon">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div class="info-content">
                                <h3>Horario de Atención</h3>
                                <p>Lunes a Viernes: 5:00 am - 11:00 pm</p>
                                <p>Sábados: 6:00 am - 10:00 pm</p>
                                <p>Domingos: 7:00 am - 9:00 pm</p>
                            </div>
                        </div>

                        <div class="info-card">
                            <div class="info-icon">
                                <i class="fas fa-phone"></i>
                            </div>
                            <div class="info-content">
                                <h3>Teléfono</h3>
                                <p>(01) 123-4567</p>
                            </div>
                        </div>

                        <div class="info-card">
                            <div class="info-icon">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <div class="info-content">
                                <h3>Email</h3>
                                <p>info@aresfitness.com</p>
                            </div>
                        </div>

                        <div class="action-buttons">
                            <a href="https://maps.google.com/?q=Av. Principal 123, Lima, Perú" target="_blank" class="btn-direction">
                                <i class="fas fa-directions"></i> CÓMO LLEGAR
                            </a>
                            <a href="https://api.whatsapp.com/send?phone=51987654321" target="_blank" class="btn-whatsapp">
                                <i class="fab fa-whatsapp"></i> ESCRIBENOS
                            </a>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Sección de transporte -->
            <section class="transport-section">
                <div class="section-title">
                    <h2>MEDIOS DE TRANSPORTE</h2>
                    <div class="title-line"></div>
                    <p>Llega fácilmente a nuestras instalaciones</p>
                </div>

                <div class="transport-options">
                    <div class="transport-card">
                        <div class="transport-icon">
                            <i class="fas fa-bus"></i>
                        </div>
                        <h3>Transporte Público</h3>
                        <p>Líneas de buses 102, 204 y 305 con parada a media cuadra</p>
                    </div>

                    <div class="transport-card">
                        <div class="transport-icon">
                            <i class="fas fa-subway"></i>
                        </div>
                        <h3>Metro</h3>
                        <p>Estación Central a 3 cuadras de distancia</p>
                    </div>

                    <div class="transport-card">
                        <div class="transport-icon">
                            <i class="fas fa-parking"></i>
                        </div>
                        <h3>Estacionamiento</h3>
                        <p>Amplio estacionamiento gratuito para clientes</p>
                    </div>
                </div>
            </section>
        </main>

        <!-- Footer mejorado -->
        <footer class="main-footer">
            <div class="footer-container">
                <div class="footer-section">
                    <div class="logo-footer">
                        <a href="index.jsp">
                            <img src="Recursos/Imagenes/logo.png" alt="Logo AresFitness">
                        </a>
                    </div>
                    <p>Transformando vidas a través del fitness desde 2020</p>
                    <div class="footer-social">
                        <a href="#" target="_blank" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://www.instagram.com/aresfitness.peru/" target="_blank" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                        <a href="#" target="_blank" aria-label="TikTok"><i class="fab fa-tiktok"></i></a>
                        <a href="#" target="_blank" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>

                <div class="footer-section">
                    <h3>Enlaces rápidos</h3>
                    <ul>
                        <li><a href="index.jsp">Inicio</a></li>
                        <li><a href="mutar.jsp">Planes</a></li>
                        <li><a href="ubicacion.jsp">Ubicación</a></li>
                        <li><a href="EjerciciosServlet">Ejercicios</a></li>
                        <li><a href="planes2.jsp">Membresías</a></li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h3>Contáctanos</h3>
                    <div class="contact-info">
                        <p><i class="fas fa-map-marker-alt"></i> Av. Principal 123, Lima, Perú</p>
                        <p><i class="fas fa-phone"></i> (01) 123-4567</p>
                        <p><i class="fas fa-envelope"></i> info@aresfitness.com</p>
                        <p><i class="fab fa-whatsapp"></i> +51 987 654 321</p>
                    </div>
                </div>

                <div class="footer-section">
                    <h3>Horario de atención</h3>
                    <p>Lunes a Viernes: 5:00 am - 11:00 pm</p>
                    <p>Sábados: 6:00 am - 10:00 pm</p>
                    <p>Domingos: 7:00 am - 9:00 pm</p>
                    <div class="reclamation">
                        <img src="Recursos/Imagenes/LibroR.png" alt="Libro de Reclamaciones">
                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <div class="footer-bottom-content">
                    <p>&copy; 2025 AresFitness. Todos los derechos reservados.</p>
                    <div class="legal-links">
                        <a href="#">Términos y Condiciones</a>
                        <a href="#">Políticas de Privacidad</a>
                        <a href="#">Quejas y Reclamaciones</a>
                    </div>
                </div>
            </div>
        </footer>
        <script src="Recursos/JS/index.js"></script>
        <!-- Script para funcionalidades -->
       <script>
// JavaScript para controlar la visualización del menú desplegable
document.addEventListener('DOMContentLoaded', function() {
    const userMenuBtn = document.getElementById('userMenuBtn');
    const authDropdown = document.getElementById('authDropdown');
    
    if (userMenuBtn && authDropdown) {
        // Alternar menú al hacer clic en el botón
        userMenuBtn.addEventListener('click', function(e) {
            e.stopPropagation();
            authDropdown.classList.toggle('show');
        });
        
        // Cerrar menú al hacer clic fuera
        document.addEventListener('click', function(e) {
            if (!userMenuBtn.contains(e.target) && !authDropdown.contains(e.target)) {
                authDropdown.classList.remove('show');
            }
        });
        
        // Prevenir que el clic en el menú lo cierre
        authDropdown.addEventListener('click', function(e) {
            e.stopPropagation();
        });
    }
});
</script>
    </body>
</html>