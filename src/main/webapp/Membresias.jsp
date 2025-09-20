<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Membresías - AresFitness</title>
    <link rel="stylesheet" href="Recursos/Css/index.css">
    <link rel="stylesheet" href="Recursos/Css/Encabezado.css">
    <link rel="stylesheet" href="Recursos/Css/Membresias.css">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
<!-- Header -->
<header class="main-header">
    <div class="header-container">
        <div class="logo-container">
            <a href="index.jsp">
                <img src="Recursos/Imagenes/logo.png" alt="Logo AresFitness">
            </a>
        </div>
        <nav class="main-nav">
            <ul>
                <li><a href="ubicacion.jsp"><i class="fas fa-map-marker-alt"></i> UBICACIÓN</a></li>
                <li><a href="#"><i class="fas fa-running"></i> EJERCICIOS</a></li>
                <li><a href=Membresias.jsp><i class="fas fa-crown"></i> MEMBRESÍAS</a></li>
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
<section class="hero">
    <div class="hero-content">
        <h2>Transforma tu cuerpo, transforma tu vida</h2>
        <p>Elige la membresía perfecta para alcanzar tus objetivos fitness con AresFitness</p>
    </div>
</section>
<section class="plans-section">
    <div class="section-title">
        <h2>Nuestros Planes de Membresía</h2>
        <p>Encuentra el plan perfecto que se adapte a tus necesidades y objetivos fitness</p>
    </div>
    <div class="plans-container">
        <!-- Plan Básico -->
        <div class="plan-card">
            <div class="plan-header">
                <h3 class="plan-name">Plan Básico</h3>
                <div class="plan-price">$19.99<span>/mes</span></div>
                <p class="plan-description">Ideal para quienes comienzan su journey fitness</p>
            </div>
            <div class="plan-features">
                <ul>
                    <li><i class="fas fa-check"></i> Acceso a zona de cardio y peso libre</li>
                    <li><i class="fas fa-check"></i> Horario estándar (5:00 am - 10:00 pm)</li>
                    <li><i class="fas fa-check"></i> Lockers y vestidores</li>
                    <li><i class="fas fa-check"></i> Evaluación física inicial</li>
                    <li><i class="fas fa-times" style="color: #d82c2c;"></i> Clases grupales</li>
                    <li><i class="fas fa-times" style="color: #d82c2c;"></i> Área premium</li>
                    <li><i class="fas fa-times" style="color: #d82c2c;"></i> Entrenador personal</li>
                </ul>
            </div>
            <div class="plan-actions">
                <button class="btn btn-secondary">Seleccionar Plan</button>
            </div>
        </div>
        <div class="plan-card popular">
            <div class="plan-header">
                <h3 class="plan-name">Plan Premium</h3>
                <div class="plan-price">$49.99<span>/mes</span></div>
                <p class="plan-description">La opción más popular con acceso completo</p>
            </div>
            <div class="plan-features">
                <ul>
                    <li><i class="fas fa-check"></i> Acceso a todas las áreas del gimnasio</li>
                    <li><i class="fas fa-check"></i> Horario extendido (24/7)</li>
                    <li><i class="fas fa-check"></i> Acceso ilimitado a clases grupales</li>
                    <li><i class="fas fa-check"></i> 2 sesiones con entrenador personal</li>
                    <li><i class="fas fa-check"></i> Área premium con amenities</li>
                    <li><i class="fas fa-check"></i> Plan nutricional básico</li>
                    <li><i class="fas fa-check"></i> Invitado gratis 2 veces al mes</li>
                </ul>
            </div>
            <div class="plan-actions">
                <button class="btn btn-primary">Seleccionar Plan</button>
            </div>
        </div>
        <div class="plan-card">
            <div class="plan-header">
                <h3 class="plan-name">Plan Elite</h3>
                <div class="plan-price">$89.99<span>/mes</span></div>
                <p class="plan-description">Experiencia fitness completa y personalizada</p>
            </div>
            <div class="plan-features">
                <ul>
                    <li><i class="fas fa-check"></i> Todos los beneficios del plan Premium</li>
                    <li><i class="fas fa-check"></i> Entrenador personal dedicado (4 sesiones/mes)</li>
                    <li><i class="fas fa-check"></i> Plan nutricional personalizado</li>
                    <li><i class="fas fa-check"></i> Acceso a áreas VIP exclusivas</li>
                    <li><i class="fas fa-check"></i> Masajes mensuales de recuperación</li>
                    <li><i class="fas fa-check"></i> Suplementación básica incluida</li>
                    <li><i class="fas fa-check"></i> Invitados ilimitados</li>
                </ul>
            </div>
            <div class="plan-actions">
                <button class="btn btn-secondary">Seleccionar Plan</button>
            </div>
        </div>
    </div>
</section>
<section class="benefits-section">
    <div class="section-title">
        <h2>Beneficios de ser miembro</h2>
        <p>Descubre todo lo que AresFitness tiene para ofrecerte</p>
    </div>
    <div class="benefits-container">
        <div class="benefit-card">
            <div class="benefit-icon">
                <i class="fas fa-dumbbell"></i>
            </div>
            <h3>Equipo de última generación</h3>
            <p>Acceso a maquinaria y equipos fitness de la más alta calidad para optimizar tus entrenamientos.</p>
        </div>
        <div class="benefit-card">
            <div class="benefit-icon">
                <i class="fas fa-users"></i>
            </div>
            <h3>Clases grupales ilimitadas</h3>
            <p>Desde yoga hasta HIIT, participa en todas las clases grupales que desees sin costo adicional.</p>
        </div>
        <div class="benefit-card">
            <div class="benefit-icon">
                <i class="fas fa-user-md"></i>
            </div>
            <h3>Asesoramiento profesional</h3>
            <p>Nuestros entrenadores certificados te guiarán para alcanzar tus objetivos de manera segura y efectiva.</p>
        </div>
    </div>
</section>
<section class="faq-section">
    <div class="section-title">
        <h2>Preguntas Frecuentes</h2>
        <p>Resolvemos todas tus dudas sobre membresías y servicios</p>
    </div>
    <div class="faq-list">
        <div class="faq-item">
            <div class="faq-question">
                ¿Puedo congelar mi membresía? <i class="fas fa-chevron-down"></i>
            </div>
            <div class="faq-answer">
                Sí, puedes congelar tu membresía hasta por 3 meses al año por motivos médicos o de viaje. Se requiere notificación previa y documentación justificativa.
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question">
                ¿Hay costos de inscripción? <i class="fas fa-chevron-down"></i>
            </div>
            <div class="faq-answer">
                Actualmente estamos exentos de costos de inscripción para nuevos miembros. Esta promoción puede variar según la temporada.
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question">
                ¿Ofrecen prueba gratuita? <i class="fas fa-chevron-down"></i>
            </div>
            <div class="faq-answer">
                Sí, ofrecemos un pase de prueba de 3 días para que experimentes nuestras instalaciones y servicios antes de comprometerte con una membresía.
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question">
                ¿Cómo cancelar mi membresía? <i class="fas fa-chevron-down"></i>
            </div>
            <div class="faq-answer">
                Puedes cancelar tu membresía en cualquier momento con un preaviso de 30 días. Deberás completar un formulario de cancelación en recepción.
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="footer">
    <div class="footer-content">
        <div class="footer-column">
            <h3>AresFitness</h3>
            <p>Transformando vaces a través del fitness desde 2010. Nuestra misión es ayudar a cada miembro a alcanzar su máximo potencial.</p>
        </div>
        <div class="footer-column">
            <h3>Enlaces Rápidos</h3>
            <ul>
                <li><a href="#">Inicio</a></li>
                <li><a href="#">Servicios</a></li>
                <li><a href="#">Membresías</a></li>
                <li><a href="#">Horarios</a></li>
                <li><a href="#">Contacto</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>Contacto</h3>
            <ul>
                <li><i class="fas fa-map-marker-alt"></i> Av. Fitness 123, Ciudad</li>
                <li><i class="fas fa-phone"></i> (123) 456-7890</li>
                <li><i class="fas fa-envelope"></i> info@aresfitness.com</li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>Síguenos</h3>
            <div class="social-links">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2023 AresFitness. Todos los derechos reservados.</p>
    </div>
</footer>
<script src="Recursos/JS/encabezado.js"></script>
<script src="Recursos/JS/Membresias.js"></script>
</body>
</html>