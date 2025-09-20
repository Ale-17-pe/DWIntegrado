package com.mycompany.dwintegrado.gym.Controller;

import com.mycompany.dwintegrado.gym.Dao.UsuarioDao;
import com.mycompany.dwintegrado.gym.Model.UsuarioModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

@WebServlet(name = "AdminUsuarioServlet", urlPatterns = {"/AdminUsuarioServlet"})
public class AdminUsuarioServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("create".equals(action)) {
            crearUsuario(request, response);
        }
    }

    private void crearUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Obtener parámetros del formulario
            String nombre = request.getParameter("nombre");
            String email = request.getParameter("email");
            String dni = request.getParameter("dni");
            String telefono = request.getParameter("telefono");
            String password = request.getParameter("password");
            String rol = request.getParameter("rol");
            String plan = request.getParameter("plan");

            // Validar campos obligatorios
            if (nombre == null || email == null || dni == null ||
                    telefono == null || password == null || rol == null) {

                response.sendRedirect("portalAdmin.jsp?error=campos_obligatorios");
                return;
            }

            // Crear objeto UsuarioModel
            UsuarioModel usuario = new UsuarioModel();
            usuario.setNombre(nombre);
            usuario.setEmail(email);
            usuario.setDni(dni);
            usuario.setTelefono(telefono);
            usuario.setPassword(password);
            usuario.setRol(rol);
            usuario.setUsuario_login(dni); // Usar DNI como login
            usuario.setFecha_Nacimiento(LocalDate.now().minusYears(18)); // Fecha por defecto
            usuario.setEstado("activo");

            // Insertar en base de datos
            UsuarioDao usuarioDao = new UsuarioDao();
            int idGenerado = usuarioDao.insertar(usuario);

            if (idGenerado > 0) {
                // Aquí podrías asignar el plan si se seleccionó uno
                response.sendRedirect("portalAdmin.jsp?success=usuario_creado");
            } else {
                response.sendRedirect("portalAdmin.jsp?error=error_creacion");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("portalAdmin.jsp?error=error_bd");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("portalAdmin.jsp?error=error_general");
        }
    }
}