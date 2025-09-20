<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio - AresFitness</title>
    <link rel="stylesheet" href="Recursos/Css/login.css">
    <link rel="icon" href="Recursos/Imagenes/logo.png" type="image/png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .error-message {
            color: #ff4d4d;
            background-color: #ffe6e6;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 15px;
            text-align: center;
            border: 1px solid #ff4d4d;
        }
    </style>
</head>
<body class="bg-light">
<!-- Encabezado -->
<header>
    <div class="logo-container">
        <a href="index.jsp">
            <img src="Recursos/Imagenes/logo.png" alt="Logo AresFitness">
        </a>
    </div>
</header>
<div class="main-wrapper">
    <div class="container">
        <div class="form-content">
            <div class="user-icon">
                <img src="Recursos/Imagenes/usuario.png" alt="Icono de usuario" />
            </div>
            <h1 id="title">ENTRAR</h1>
            <p class="subtitle">Ingresa tus credenciales para acceder a tu cuenta</p>

            <!-- Mostrar mensajes de error -->
            <%
                String error = request.getParameter("error");
                if (error != null) {
            %>
            <div class="error-message">
                <%
                    if ("Credenciales_inválidas".equals(error)) {
                        out.print("DNI o contraseña incorrectos");
                    } else if ("No_se_encontró_información_del_cliente".equals(error)) {
                        out.print("Error al cargar información del perfil");
                    } else if ("Debe ingresar DNI y contraseña".equals(error)) {
                        out.print("Por favor, complete todos los campos");
                    } else {
                        out.print("Error: " + error);
                    }
                %>
            </div>
            <% } %>

            <form id="loginForm" action="LoginServlet" method="post">
                <div class="input-group">
                    <div class="input-field" id="nameInput">
                        <i class="fa-solid fa-id-card"></i>
                        <input type="text" name="dni" id="dni" placeholder="DNI" maxlength="8" pattern="\d{8}" title="Ingrese 8 dígitos numéricos" required />
                    </div>
                    <div class="input-field">
                        <i class="fa-solid fa-lock"></i>
                        <input type="password" name="password" id="password" placeholder="Contraseña" required />
                    </div>
                    <div class="OLVIDE">
                        <a href="olvide.jsp">Recuperar cuenta</a>
                    </div>
                </div>
                <button type="submit" class="btn-login">Ingresar</button>
            </form>
            <div class="Registrar">
                <span>¿Aún no tienes cuenta?</span>
                <a href="registro.jsp">REGISTRAR</a>
            </div>
        </div>
    </div>
</div>
<footer>
    <p style="text-align: center; color: #888;">&copy; 2025 AresFitness. Todos los derechos reservados.</p>
</footer>

<script>
    // Validación del DNI en el cliente
    document.getElementById('dni').addEventListener('input', function(e) {
        this.value = this.value.replace(/[^0-9]/g, '');
        if (this.value.length > 8) {
            this.value = this.value.slice(0, 8);
        }
    });
</script>
</body>
</html>