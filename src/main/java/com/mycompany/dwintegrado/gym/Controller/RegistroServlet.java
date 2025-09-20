/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.dwintegrado.gym.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.mycompany.dwintegrado.gym.Dao.ClienteDao;
import com.mycompany.dwintegrado.gym.Model.ClienteModel;
import com.mycompany.dwintegrado.gym.Model.UsuarioModel;
import com.mycompany.dwintegrado.gym.Services.ClienteService;
import com.mycompany.dwintegrado.gym.Services.UsuarioService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RegistroServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        UsuarioService usuarioService = new UsuarioService();
        ClienteService clienteService = new ClienteService(); // ← ClienteService inicializado
        UsuarioModel usuario = new UsuarioModel();

        // [Obtener parámetros del formulario]
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String direccion = request.getParameter("direccion");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        String genero = request.getParameter("genero");
        String password = request.getParameter("contrasena");
        String confirmarContrasena = request.getParameter("confirmarContrasena");

        // Validar campos vacíos
        if (nombre == null || nombre.isEmpty() ||
                apellido == null || apellido.isEmpty() ||
                dni == null || dni.isEmpty() ||
                telefono == null || telefono.isEmpty() ||
                correo == null || correo.isEmpty() ||
                direccion == null || direccion.isEmpty() ||
                fechaNacimiento == null || fechaNacimiento.isEmpty() ||
                genero == null || genero.isEmpty() ||
                password == null || password.isEmpty() ||
                confirmarContrasena == null || confirmarContrasena.isEmpty()) {

            response.sendRedirect("registro.jsp?error=campos_incompletos");
            return;
        }

        // Validar que las contraseñas coincidan
        if (!password.equals(confirmarContrasena)) {
            response.sendRedirect("registro.jsp?error=contrasenas_no_coinciden");
            return;
        }

        // Verificar si el DNI ya existe
        try {
            if (usuarioService.existeDNI(dni)) {
                response.sendRedirect("registro.jsp?error=dni_duplicado");
                return;
            }
        } catch (SQLException e) {
            response.sendRedirect("registro.jsp?error=servidor");
            return;
        }

        // Crear objeto UsuarioModel
        usuario.setDni(dni);
        usuario.setNombre(nombre);
        usuario.setApellido(apellido);
        usuario.setEmail(correo);
        usuario.setTelefono(telefono);
        usuario.setFecha_Nacimiento(LocalDate.parse(fechaNacimiento));
        usuario.setPassword(password);
        usuario.setUsuario_login(dni);
        usuario.setRol("Cliente");

        // 1. CREAR USUARIO en tabla usuario
        int idUsuarioGenerado;
        try {
            idUsuarioGenerado = usuarioService.agregar(usuario);
        } catch (SQLException e) {
            System.out.println("ERROR al crear usuario: " + e.getMessage());
            response.sendRedirect("registro.jsp?error=error_usuario");
            return;
        }

        System.out.println("DEBUG - ID Usuario generado: " + idUsuarioGenerado);

        if (idUsuarioGenerado <= 0) {
            response.sendRedirect("registro.jsp?error=error_usuario");
            return;
        }

        // 2. CREAR CLIENTE en tabla cliente
        ClienteModel cliente = new ClienteModel();
        cliente.setId_usuario(idUsuarioGenerado);
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setCorreo(correo);
        cliente.setTelefono(telefono);
        cliente.setDni(dni);
        cliente.setDireccion(direccion);
        cliente.setGenero(genero);
        cliente.setFecha_nacimiento(java.sql.Date.valueOf(LocalDate.parse(fechaNacimiento)));

        boolean clienteCreado = clienteService.agregar(cliente);

        if (clienteCreado) {
            System.out.println("DEBUG - Cliente creado exitosamente");
            // Guardar en sesión
            HttpSession session = request.getSession();
            session.setAttribute("usuarioTemp", usuario);
            response.sendRedirect("portalCliente.jsp");
        } else {
            System.out.println("DEBUG - Error al crear cliente");
            response.sendRedirect("registro.jsp?error=error_cliente");
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
/**
 * Handles the HTTP <code>GET</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        processRequest(request, response);
    } catch (SQLException ex) {
        Logger.getLogger(RegistroServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
}

/**
 * Handles the HTTP <code>POST</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        processRequest(request, response);
    } catch (SQLException ex) {
        Logger.getLogger(RegistroServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
}

/**
 * Returns a short description of the servlet.
 *
 * @return a String containing servlet description
 */
@Override
public String getServletInfo() {
    return "Short description";
}// </editor-fold>

}

