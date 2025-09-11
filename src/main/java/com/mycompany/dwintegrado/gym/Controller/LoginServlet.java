/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.dwintegrado.gym.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.mycompany.dwintegrado.gym.DTO.ClienteDTO;
import com.mycompany.dwintegrado.gym.DTO.RecepcionistaDTO;
import com.mycompany.dwintegrado.gym.Model.UsuarioModel;
import com.mycompany.dwintegrado.gym.Services.ClienteService;
import com.mycompany.dwintegrado.gym.Services.LoginService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException, SQLException {
            String dni = request.getParameter("dni");
            String password = request.getParameter("password");
            ClienteService clienteService = new ClienteService();
            LoginService loginService = new LoginService();
            UsuarioModel usuario;
            ClienteDTO clienteDTO;
            RecepcionistaDTO recepcionistaDTO;

            System.out.println("11");
            usuario = loginService.validar(dni, password);
            System.out.println("2222");

            if (usuario != null) {
                String tipo = usuario.getRol();
                System.out.println("33333333 - Tipo: " + tipo);

                // Guardar usuario en sesión
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);

                if ("Cliente".equals(tipo)) {
                    response.sendRedirect("portalCliente.jsp");
                } else if ("Recepcionista".equals(tipo)) {
                    response.sendRedirect("portalRecepcionista.jsp");
                } else if ("Administrador".equals(tipo)) {
                    response.sendRedirect("portalAdmin.jsp");
                } else {
                    response.sendRedirect("login.jsp?error=tipo_desconocido");
                }

            } else {
                response.sendRedirect("login.jsp?error=credenciales_invalidas");
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

