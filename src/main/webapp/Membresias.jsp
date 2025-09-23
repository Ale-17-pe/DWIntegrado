<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.dwintegrado.gym.Model.PlanModel"%>
<%@page import="com.mycompany.dwintegrado.gym.Services.AdminService"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
    // Cargar planes desde la base de datos
    AdminService adminService = new AdminService();
    List<PlanModel> planes = adminService.listarPlanes();

    // Filtrar solo planes activos
    List<PlanModel> planesActivos = new ArrayList<>();
    for (PlanModel plan : planes) {
        if ("activo".equalsIgnoreCase(plan.getEstado())) {
            planesActivos.add(plan);
        }
    }
%>

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
        <%
            if (planesActivos != null && !planesActivos.isEmpty()) {
                int planCount = 0;
                for (PlanModel plan : planesActivos) {
                    planCount++;
                    boolean esPopular = planCount == 2; // Ejemplo: segundo plan como "popular"
        %>
        <div class="plan-card <%= esPopular ? "popular" : "" %>">
            <div class="plan-header">
                <h3 class="plan-name"><%= plan.getNombre() %></h3>
                <div class="plan-price">S/. <%= plan.getPrecio() %><span>/<%= plan.getDuration_dias() %> días</span></div>
                <p class="plan-description"><%= plan.getDescripcion() %></p>
            </div>

            <div class="plan-actions">
                <%
                    Object usuarioSesion = session.getAttribute("usuarioSesion");
                    if (usuarioSesion != null) {
                %>
                <button class="btn <%= esPopular ? "btn-primary" : "btn-secondary" %>"
                        onclick="seleccionarPlan(<%= plan.getId_plan() %>)">
                    Seleccionar Plan
                </button>
                <%
                } else {
                %>
                <button class="btn <%= esPopular ? "btn-primary" : "btn-secondary" %>"
                        onclick="redirigirLogin()">
                    Iniciar Sesión para Comprar
                </button>
                <%
                    }
                %>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="no-plans-message">
            <i class="fas fa-info-circle"></i>
            <h3>Próximamente nuevos planes</h3>
            <p>Estamos preparando membresías especiales para ti. Vuelve pronto.</p>
        </div>
        <%
            }
        %>
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

<script>
    function redirigirLogin() {
        if (confirm('Debes iniciar sesión para adquirir un plan. ¿Deseas ir a la página de login?')) {
            window.location.href = 'login.jsp';
        }
    }

    function seleccionarPlan(idPlan) {
        window.location.href = 'procesarCompra.jsp?idPlan=' + idPlan;
    }
    document.querySelectorAll('.faq-question').forEach(question => {
        question.addEventListener('click', () => {
            const answer = question.nextElementSibling;
            answer.style.display = answer.style.display === 'block' ? 'none' : 'block';
            question.querySelector('i').classList.toggle('fa-chevron-up');
            question.querySelector('i').classList.toggle('fa-chevron-down');
        });
    });
</script>

<script src="Recursos/JS/encabezado.js"></script>
<script src="Recursos/JS/Membresias.js"></script>

</body>
</html>
