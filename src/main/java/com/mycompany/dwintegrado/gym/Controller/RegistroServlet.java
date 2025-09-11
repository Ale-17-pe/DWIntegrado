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

import com.mycompany.dwintegrado.gym.Model.UsuarioModel;
import com.mycompany.dwintegrado.gym.Services.ClienteService;
import com.mycompany.dwintegrado.gym.Services.UsuarioService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {

protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, SQLException {

    UsuarioService usuarioService = new UsuarioService();
    UsuarioModel usuario = new UsuarioModel();

    ClienteService service = new ClienteService();
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
    if (nombre == null || nombre.isEmpty()
            || apellido == null || apellido.isEmpty()
            || dni == null || dni.isEmpty()
            || telefono == null || telefono.isEmpty()
            || correo == null || correo.isEmpty()
            || direccion == null || direccion.isEmpty()
            || fechaNacimiento == null || fechaNacimiento.isEmpty()
            || genero == null || genero.isEmpty()
            || password == null || password.isEmpty()
            || confirmarContrasena == null || confirmarContrasena.isEmpty()) {

        response.sendRedirect("registro.jsp?error=campos_incompletos");
        return;
    }

    // Crear objeto UsuarioModel con todos los datos
    usuario.setDni(dni);
    usuario.setNombre(nombre);
    usuario.setApellido(apellido);
    usuario.setEmail(correo);
    usuario.setTelefono(telefono);
    usuario.setDireccion(direccion);
    usuario.setFecha_Nacimiento(LocalDate.parse(fechaNacimiento));
    usuario.setPassword(password);
    usuario.setUsuario_login(dni); // Puedes usar el DNI como usuario_login
    usuario.setRol("Cliente"); // Rol por defecto para registros
    usuario.setEstado("activo"); // Estado por defecto

    //metodo para insertar
    usuarioService.agregar(usuario);
    // Guardar en sesión
    HttpSession session = request.getSession();
    session.setAttribute("usuarioTemp", usuario);

    // Redirigir a pago.jsp
    response.sendRedirect("portalCliente.jsp");
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

