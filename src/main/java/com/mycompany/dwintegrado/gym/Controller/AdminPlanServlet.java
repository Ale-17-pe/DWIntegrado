package com.mycompany.dwintegrado.gym.Controller;

import com.mycompany.dwintegrado.gym.Dao.PlanDao;
import com.mycompany.dwintegrado.gym.Model.PlanModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminPlanServlet", urlPatterns = {"/AdminPlanServlet"})
public class AdminPlanServlet extends HttpServlet {

    private PlanDao planDao;

    public AdminPlanServlet() {
        this.planDao = new PlanDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            if ("listar".equals(action)) {
                listarPlanes(request, response);
            } else if ("obtener".equals(action)) {
                obtenerPlan(request, response);
            } else {
                listarPlanes(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("portalAdmin.jsp?error=error_servidor");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción requerida");
            return;
        }

        try {
            switch (action) {
                case "crear":
                    crearPlan(request, response);
                    break;
                case "actualizar":
                    actualizarPlan(request, response);
                    break;
                case "eliminar":
                    eliminarPlan(request, response);
                    break;
                default:
                    response.setContentType("application/json");
                    response.getWriter().write("{\"success\":false, \"message\":\"Acción inválida\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("application/json");
            response.getWriter().write("{\"success\":false, \"message\":\"Error en el servidor\"}");
        }
    }

    private void listarPlanes(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        List<PlanModel> planes = planDao.listarTodos();
        request.setAttribute("planes", planes);
        request.getRequestDispatcher("portalAdmin.jsp").forward(request, response);
    }

    private void obtenerPlan(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        int idPlan = Integer.parseInt(request.getParameter("id"));
        PlanModel plan = planDao.obtenerPorId(idPlan);

        if (plan != null) {
            request.setAttribute("plan", plan);
            request.getRequestDispatcher("editarPlan.jsp").forward(request, response);
        } else {
            response.sendRedirect("portalAdmin.jsp?error=plan_no_encontrado");
        }
    }

    private void crearPlan(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        response.setContentType("application/json");
        try {
            PlanModel plan = new PlanModel();
            plan.setNombre(request.getParameter("nombre"));
            plan.setDescripcion(request.getParameter("descripcion"));
            plan.setDuration_dias(Integer.parseInt(request.getParameter("duration_dias")));
            plan.setPrecio(new BigDecimal(request.getParameter("precio")));
            plan.setTipo(request.getParameter("tipo"));
            plan.setEstado(request.getParameter("estado"));

            boolean exito = planDao.crear(plan);

            if (exito) {
                response.getWriter().write("{\"success\":true, \"message\":\"Plan creado correctamente\"}");
            } else {
                response.getWriter().write("{\"success\":false, \"message\":\"No se pudo crear el plan\"}");
            }
        } catch (NumberFormatException e) {
            response.getWriter().write("{\"success\":false, \"message\":\"Datos inválidos\"}");
        }
    }

    private void actualizarPlan(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        response.setContentType("application/json");
        try {
            PlanModel plan = new PlanModel();
            plan.setId_plan(Integer.parseInt(request.getParameter("id_plan")));
            plan.setNombre(request.getParameter("nombre"));
            plan.setDescripcion(request.getParameter("descripcion"));
            plan.setDuration_dias(Integer.parseInt(request.getParameter("duration_dias")));
            plan.setPrecio(new BigDecimal(request.getParameter("precio")));
            plan.setTipo(request.getParameter("tipo"));
            plan.setEstado(request.getParameter("estado"));

            boolean exito = planDao.actualizar(plan);

            if (exito) {
                response.getWriter().write("{\"success\":true, \"message\":\"Plan actualizado correctamente\"}");
            } else {
                response.getWriter().write("{\"success\":false, \"message\":\"No se pudo actualizar el plan\"}");
            }
        } catch (NumberFormatException e) {
            response.getWriter().write("{\"success\":false, \"message\":\"Datos inválidos\"}");
        }
    }

    private void eliminarPlan(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        response.setContentType("application/json");
        try {
            int idPlan = Integer.parseInt(request.getParameter("id_plan"));
            boolean exito = planDao.eliminar(idPlan);

            if (exito) {
                response.getWriter().write("{\"success\":true, \"message\":\"Plan eliminado correctamente\"}");
            } else {
                response.getWriter().write("{\"success\":false, \"message\":\"No se pudo eliminar el plan\"}");
            }
        } catch (NumberFormatException e) {
            response.getWriter().write("{\"success\":false, \"message\":\"ID inválido\"}");
        }
    }
}
