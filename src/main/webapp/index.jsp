<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="AresFitness - Transforma tu vida con el mejor gimnasio. Instalaciones modernas, entrenadores profesionales y planes personalizados.">
        <title>AresFitness  </title>
        <link rel="stylesheet" href="Recursos/Css/index.css">

        <link rel="icon" href="Recursos/Imagenes/logo.png" type="image/png">
        <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    <body>
        <!-- Header mejorado con opción de login -->
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

        <section class="hero" style="background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('Recursos/Imagenes/minionMamado.jpg') no-repeat center center/cover;">
            <div class="hero-overlay">
                <div class="hero-content">
                    <h1>TRANSFORMA TU CUERPO, TRANSFORMA TU VIDA</h1>
                    <p>Únete a la familia AresFitness y alcanza tus metas con los mejores entrenadores y equipos</p>
                    <div class="hero-buttons">
                        <a href="login.jsp" class="btn-primary">COMENZAR AHORA</a>
                        <a href="mutar.jsp" class="btn-secondary">VER PLANES</a>
                    </div>
                </div>
            </div>
        </section>
        <section class="stats-section">
            <div class="stats-container">
                <div class="stat-item">
                    <h3 data-count="5000">0</h3>
                    <p>CLIENTES SATISFECHOS</p>
                </div>
                <div class="stat-item">
                    <h3 data-count="5">0</h3>
                    <p>AÑOS DE EXPERIENCIA</p>
                </div>
                <div class="stat-item">
                    <h3 data-count="50">0</h3>
                    <p>ENTRENADORES CERTIFICADOS</p>
                </div>
                <div class="stat-item">
                    <h3 data-count="100">0</h3>
                    <p>CLASES SEMANALES</p>
                </div>
            </div>
        </section>

        <!-- Sección Quiénes Somos -->
        <section class="about-section">
            <div class="section-title">
                <h2>¿QUIÉNES SOMOS?</h2>
                <div class="title-line"></div>
            </div>

            <div class="about-container">
                <div class="about-content">
                    <p>En <strong>AresFitness</strong>, somos más que un gimnasio: somos una comunidad apasionada por transformar vidas a través del fitness,
                        la disciplina y la superación personal. Con más de 5 años de experiencia, ofrecemos un enfoque integral para mejorar tu bienestar
                        físico y mental.</p>
                    <div class="about-features">
                        <div class="feature">
                            <i class="fas fa-heartbeat"></i>
                            <h4>Salud Integral</h4>
                            <p>Nos preocupamos por tu bienestar físico y mental</p>
                        </div>
                        <div class="feature">
                            <i class="fas fa-users"></i>
                            <h4>Comunidad</h4>
                            <p>Únete a nuestra familia fitness y comparte tus logros</p>
                        </div>
                        <div class="feature">
                            <i class="fas fa-trophy"></i>
                            <h4>Resultados</h4>
                            <p>Programas diseñados para que alcances tus metas</p>
                        </div>
                    </div>
                </div>
                <div class="about-image">
                    <img src="Recursos/Imagenes/Cuerda.jpg" alt="Instalaciones AresFitness">
                </div>
            </div>
        </section>

        <!-- Sección de Experiencia -->
        <section class="experience-section">
            <div class="experience-container">
                <div class="experience-image">
                    <img src="Recursos/Imagenes/remo.jpg" alt="Clientes entrenando en AresFitness">
                </div>
                <div class="experience-content">
                    <h2>MÁS DE 5 AÑOS TRANSFORMANDO VIDAS</h2>
                    <p>Llevamos más de <strong>5 años</strong> en el rubro del fitness, acompañando a miles de personas en su camino hacia
                        una vida más saludable. Nuestra experiencia nos permite brindarte un servicio de calidad con resultados comprobados y un enfoque personalizado.</p>
                    <ul class="experience-list">
                        <li><i class="fas fa-check-circle"></i> Entrenadores certificados y con experiencia</li>
                        <li><i class="fas fa-check-circle"></i> Equipos de última generación</li>
                        <li><i class="fas fa-check-circle"></i> Programas personalizados según tus objetivos</li>
                        <li><i class="fas fa-check-circle"></i> Ambiente motivador y seguro</li>
                    </ul>
                </div>
            </div>
        </section>

        <!-- Sección de Objetivos -->
        <section class="goals-section">
            <div class="section-title">
                <h2>NUESTROS OBJETIVOS</h2>
                <div class="title-line"></div>
            </div>

            <div class="goals-container">
                <div class="goal-content">
                    <p>En <strong>AresFitness</strong>, buscamos ayudarte a alcanzar tu mejor versión. Nuestro objetivo es ofrecer planes de
                        entrenamiento accesibles y personalizados, promover un estilo de vida saludable y abrir nuevas sedes para impactar positivamente en
                        más comunidades.</p>

                    <div class="goal-cards">
                        <div class="goal-card">
                            <div class="goal-icon">
                                <i class="fas fa-bullseye"></i>
                            </div>
                            <h4>MISIÓN</h4>
                            <p>Proporcionar las herramientas y el ambiente perfecto para que cada cliente alcance sus metas fitness y mejore su calidad de vida.</p>
                        </div>
                        <div class="goal-card">
                            <div class="goal-icon">
                                <i class="fas fa-eye"></i>
                            </div>
                            <h4>VISIÓN</h4>
                            <p>Ser el gimnasio líder en la región, reconocido por nuestra excelencia en servicio y resultados transformadores.</p>
                        </div>
                        <div class="goal-card">
                            <div class="goal-icon">
                                <i class="fas fa-star"></i>
                            </div>
                            <h4>VALORES</h4>
                            <p>Compromiso, disciplina, comunidad, innovación y pasión por el fitness son los pilares de nuestro trabajo diario.</p>
                        </div>
                    </div>
                </div>
                <div class="goal-image">
                    <img src="Recursos/Imagenes/girls.jpg" alt="Entrenamiento grupal en AresFitness">
                </div>
            </div>
        </section>

        <!-- Sección de Video -->
        <section class="video-section">
            <div class="section-title">
                <h2>CONOCE MÁS SOBRE NOSOTROS</h2>
                <div class="title-line"></div>
            </div>
            <div class="video-container">
                <iframe width="800" height="500" src="https://www.youtube.com/embed/riWch046AqI?autoplay=1&mute=1&enablejsapi=1" title="Video presentación AresFitness" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            </div>
        </section>

        <!-- Sección de Testimonios -->
        <section class="testimonials-section">
            <div class="section-title">
                <h2>OPINIONES DE NUESTROS CLIENTES</h2>
                <div class="title-line"></div>
            </div>

            <div class="testimonials-container">
                <div class="testimonial">
                    <div class="testimonial-content">
                        <p>"Llevo 2 años entrenando en AresFitness y ha sido la mejor decisión. He perdido 15 kg y ganado mucha confianza en mí mismo."</p>
                    </div>
                    <div class="testimonial-author">
                        <h4>Carlos Mendoza</h4>
                        <p>Cliente desde 2023</p>
                    </div>
                </div>

                <div class="testimonial">
                    <div class="testimonial-content">
                        <p>"Los entrenadores son excelentes profesionales que se preocupan por tu progreso. Las instalaciones siempre impecables."</p>
                    </div>
                    <div class="testimonial-author">
                        <h4>Ana Torres</h4>
                        <p>Cliente desde 2024</p>
                    </div>
                </div>
                <div class="testimonial">
                    <div class="testimonial-content">
                        <p>"La comunidad que se ha formado aquí es increíble. No es solo un gimnasio, es una familia que te motiva a ser mejor."</p>
                    </div>
                    <div class="testimonial-author">
                        <h4>Miguel Ángel Ruiz</h4>
                        <p>Cliente desde 2022</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Llamada a la acción final -->
        <section class="cta-section" style="background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('Recursos/Imagenes/Espalda.PNG') no-repeat center center/cover;">
            <div class="cta-overlay">
                <div class="cta-content">
                    <h2>¿LISTO PARA COMENZAR TU TRANSFORMACIÓN?</h2>
                    <p>Únete hoy mismo y obtén una sesión de evaluación gratuita con uno de nuestros entrenadores</p>
                    <div class="cta-buttons">
                        <a href="login.jsp" class="btn-primary">INSCRIBIRME AHORA</a>
                        <a href="mutar.jsp" class="btn-primary">VER PLANES</a>
                        <a href="ubicacion.jsp" class="btn-secondary">VISITANOS</a>
                    </div>
                </div>
            </div>
        </section>

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
                        <img src="Imagenes/LibroR.png" alt="Libro de Reclamaciones">
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
        <script src="Recursos/JS/index.js"></script>
    </body>
</html>