<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Inicio - AresFitness</title>
        <link rel="stylesheet" href="Recursos/Css/login.css">
        <link rel="icon" href="Recursos/Imagenes/logo.png" type="image/png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
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
                    <h1 id="title">ENTRAR  </h1>
                    <p class="subtitle">Ingresa tus credenciales para acceder a tu cuenta</p>

                    <form id="loginForm" action="LoginServlet" method="post">
                        <div class="input-group">
                            <div class="input-field" id="nameInput">
                                <i class="fa-solid fa-envelope"></i>
                                <input type="number" name="dni" id="dni" placeholder="dni" maxlength="8" pattern="\d{8}" required />
                            </div>
                            <div class="input-field">
                                <i class="fa-solid fa-lock"></i>
                                <input type="password" name="password" id="password" placeholder="Password"  required />

                            </div>
                            <div class="OLVIDE">
                                <a href="olvide.jsp">Recuperar cuenta</a>
                            </div>
                        </div>
                        <button type="submit" class="btn-login">Ingresar</button>
                    </form>
                    <div class="Registrar">  
                        <span>¿Aun no tienes cuenta?</span>
                        <a href="registro.jsp">REGISTRAR</a>
                    </div> 

                </div>
            </div>
        </div>
        <footer>
            <p style="text-align: center; color: #888;">&copy; 2025 AresFitness. Todos los derechos reservados.</p>
        </footer>