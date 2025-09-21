/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.dwintegrado.gym.Controller;

import java.io.IOException;
import java.util.List;

import com.mycompany.dwintegrado.gym.Dao.PlanDao;
import com.mycompany.dwintegrado.gym.Model.PlanModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author AlexandroG
 */

@WebServlet("/PlanGestionServlet")
public class PlanGestionServlet extends HttpServlet {
    /*

    private PlanDao dao = new PlanDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        List<PlanModel> listaPlanes = dao.listarTodos();

        if (accion == null || accion.equals("listar")) {
            request.setAttribute("planes", listaPlanes);
            request.getRequestDispatcher("gestionPlanes.jsp").forward(request, response);
            return;
        }

        switch (accion) {
            case "nuevo":
                request.setAttribute("plan", new PlanModel());
                request.setAttribute("planes", listaPlanes);
                request.getRequestDispatcher("gestionPlanes.jsp").forward(request, response);
                break;

            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                PlanModel planEditar = dao.obtenerPorId(idEditar);
                request.setAttribute("plan", planEditar);
                request.setAttribute("planes", listaPlanes);
                request.getRequestDispatcher("gestionPlanes.jsp").forward(request, response);
                break;

            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idEliminar);
                response.sendRedirect("PlanGestionServlet");
                break;

            default:
                request.setAttribute("planes", dao.listarTodos());
                request.getRequestDispatcher("gestionPlanes.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");


        if ("guardar".equals(accion)) {

            String idPlanStr = request.getParameter("idPlan");
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            int duracion = Integer.parseInt(request.getParameter("duracion_dias"));
            double precio = Double.parseDouble(request.getParameter("precio"));
            String tipo = request.getParameter("tipo");
            String estado = request.getParameter("estado");

            PlanModel plan = new PlanModel();
            plan.setNombre(nombre);
            plan.setDescripcion(descripcion);
            plan.setDuracion_dias(duracion);
            plan.setPrecio(precio);
            plan.setTipo(tipo);
            plan.setEstado(estado);

            if (idPlanStr == null || idPlanStr.isEmpty()) {
                dao.insertar(plan);
            } else {
                plan.setId_plan(Integer.parseInt(idPlanStr));
                dao.actualizar(plan);
            }

            List<PlanModel> listaPlanes = dao.obtenerTodos();
            request.setAttribute("planes", listaPlanes);
            request.setAttribute("plan", new PlanModel());
            request.getRequestDispatcher("gestionPlanes.jsp").forward(request, response);
        }else {
            response.sendRedirect("PlanGestionServlet?accion=listar");
        }
    }

 */
}

