/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.dwintegrado.gym.Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.mycompany.dwintegrado.gym.DTO.ClienteDTO;
import com.mycompany.dwintegrado.gym.Dao.ClienteDao;
import com.mycompany.dwintegrado.gym.Model.ClienteModel;
import com.mycompany.dwintegrado.gym.Model.UsuarioModel;
import com.mycompany.dwintegrado.gym.Services.LoginService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        String dni = request.getParameter("dni");
        String password = request.getParameter("password");
        if (dni == null || dni.isEmpty() || password == null || password.isEmpty()) {
            response.sendRedirect("login.jsp?error=Debe ingresar DNI y contraseña");
            return;
        }

        LoginService loginService = new LoginService();
        UsuarioModel usuario = loginService.validar(dni, password);

        if (usuario != null) {
            String tipo = usuario.getRol();
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            session.setAttribute("id_usuario", usuario.getId_usuario());

            if ("Cliente".equals(tipo)) {
                ClienteDao clienteDao = new ClienteDao();
                ClienteModel cliente = clienteDao.buscarPorIdUsuario(usuario.getId_usuario());
                if (cliente != null) {

                    System.out.println("ID Cliente: " + cliente.getId_cliente());
                    System.out.println("Nombre: " + cliente.getNombre());
                    System.out.println("Apellido: " + cliente.getApellido());
                    System.out.println("Correo: " + cliente.getCorreo());
                    System.out.println("Teléfono: " + cliente.getTelefono());
                    System.out.println("DNI Usuario: " + usuario.getDni());

                    ClienteDTO clienteDTO = new ClienteDTO(
                            cliente.getId_cliente(),
                            cliente.getNombre(),
                            cliente.getApellido(),
                            cliente.getCorreo(),
                            cliente.getTelefono(),
                            cliente.getDireccion(),
                            cliente.getGenero(),
                            usuario.getDni(),
                            cliente.getFecha_nacimiento()
                    );
                    session.setAttribute("clienteDTO", clienteDTO);
                    System.out.println("✅ Cliente en sesión: " + clienteDTO.getNombre() + " " + clienteDTO.getApellido());// 👈 ahora sí estará disponible en sesión
                    response.sendRedirect("portalCliente.jsp");

                }else {
                    session.setAttribute("error", "El usuario no existe");
                    response.sendRedirect("login.jsp?error=El usuario no existe");
                }


            } else if ("Recepcionista".equals(tipo)) {
                response.sendRedirect("portalRecepcionista.jsp");
            } else if ("Administrador".equals(tipo)) {
                response.sendRedirect("portalAdmin.jsp");
            } else {
                response.sendRedirect("login.jsp?error=Tipo_de_usuario_desconocido");
            }
        } else {
            response.sendRedirect("login.jsp?error=Credenciales_inválidas");
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
            Logger.getLogger(LoginServlet.class

                    .getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("login.jsp?error=Error interno en el servidor");

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
            Logger.getLogger(LoginServlet.class

                    .getName()).log(Level.SEVERE, null, ex);
                    response.sendRedirect("login.jsp?error=Error interno en el servidor");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet de autenticación de usuarios";
    }// </editor-fold>

}




