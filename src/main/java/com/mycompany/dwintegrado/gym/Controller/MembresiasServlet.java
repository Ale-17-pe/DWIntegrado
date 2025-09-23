package com.mycompany.dwintegrado.gym.Controller;

import com.mycompany.dwintegrado.gym.Dao.PlanDao;
import com.mycompany.dwintegrado.gym.Model.PlanModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "MembresiasServlet", urlPatterns = {"/MembresiasServlet"})
public class MembresiasServlet extends HttpServlet {

    private PlanDao planDao;

    public MembresiasServlet() {
        this.planDao = new PlanDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Solo traer planes activos
            List<PlanModel> planes = planDao.listarActivos();
            request.setAttribute("planes", planes);

            // Enviar a la vista pública
            request.getRequestDispatcher("Membresias.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=Error al cargar planes");
        }
    }
}
