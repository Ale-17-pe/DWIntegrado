/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.dwintegrado.gym.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.mycompany.dwintegrado.gym.Dao.ClienteDao;
import com.mycompany.dwintegrado.gym.Model.ClienteModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/perfil")
public class ClienteServlet extends HttpServlet {

    protected void doget(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();

        Integer id_usuario = (Integer) sesion.getAttribute("id_usuario");

        if (id_usuario == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            ClienteDao clienteDao = new ClienteDao();
            ClienteModel cliente = (ClienteModel) sesion.getAttribute("cliente");

            if (cliente == null) {
                response.sendRedirect("error.jsp?mensaje=cliente.inexistente");
                return;
            }
            request.setAttribute("cliente", cliente);
            request.getRequestDispatcher("portalCliente.jsp").forward(request, response);
        }catch (Exception e){
            e.printStackTrace();
            response.sendRedirect("error.jsp?mensaje=ERROR AL CARGAR EL PERFIL");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       doget(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doget(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
