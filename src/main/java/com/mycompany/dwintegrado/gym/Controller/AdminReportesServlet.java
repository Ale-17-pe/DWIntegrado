package com.mycompany.dwintegrado.gym.Controller;

import com.mycompany.dwintegrado.gym.Dao.ReporteDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "AdminReportesServlet", urlPatterns = {"/AdminReportesServlet"})
public class AdminReportesServlet extends HttpServlet {

    private ReporteDao reporteDao;

    public AdminReportesServlet() {
        this.reporteDao = new ReporteDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String tipo = request.getParameter("tipo");
        String fechaInicio = request.getParameter("fechaInicio");
        String fechaFin = request.getParameter("fechaFin");

        try {
            switch (action) {
                case "estadisticasGenerales":
                    obtenerEstadisticasGenerales(request, response);
                    break;
                case "ingresos":
                    obtenerReporteIngresos(request, response, tipo, fechaInicio, fechaFin);
                    break;
                case "usuarios":
                    obtenerReporteUsuarios(request, response, tipo, fechaInicio, fechaFin);
                    break;
                case "contenido":
                    obtenerReporteContenido(request, response, tipo, fechaInicio, fechaFin);
                    break;
                default:
                    response.sendRedirect("portalAdmin.jsp?error=accion_invalida");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("portalAdmin.jsp?error=error_servidor");
        }
    }

    private void obtenerEstadisticasGenerales(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        Map<String, Object> estadisticas = new HashMap<>();

        estadisticas.put("totalUsuarios", reporteDao.obtenerTotalUsuarios());
        estadisticas.put("usuariosActivos", reporteDao.obtenerUsuariosActivos());
        estadisticas.put("totalPlanes", reporteDao.obtenerTotalPlanes());
        estadisticas.put("ingresosMensuales", reporteDao.obtenerIngresosMensuales());
        estadisticas.put("contenidoPublicado", reporteDao.obtenerContenidoPublicado());

        request.setAttribute("estadisticas", estadisticas);
        request.getRequestDispatcher("portalAdmin.jsp").forward(request, response);
    }

    private void obtenerReporteIngresos(HttpServletRequest request, HttpServletResponse response,
                                        String tipo, String fechaInicio, String fechaFin)
            throws SQLException, ServletException, IOException {

        Map<String, Object> reporte = reporteDao.obtenerReporteIngresos(tipo, fechaInicio, fechaFin);
        request.setAttribute("reporteIngresos", reporte);
        request.setAttribute("tipoReporte", "ingresos");
        request.getRequestDispatcher("portalAdmin.jsp").forward(request, response);
    }

    private void obtenerReporteUsuarios(HttpServletRequest request, HttpServletResponse response,
                                        String tipo, String fechaInicio, String fechaFin)
            throws SQLException, ServletException, IOException {

        Map<String, Object> reporte = reporteDao.obtenerReporteUsuarios(tipo, fechaInicio, fechaFin);
        request.setAttribute("reporteUsuarios", reporte);
        request.setAttribute("tipoReporte", "usuarios");
        request.getRequestDispatcher("portalAdmin.jsp").forward(request, response);
    }

    private void obtenerReporteContenido(HttpServletRequest request, HttpServletResponse response,
                                         String tipo, String fechaInicio, String fechaFin)
            throws SQLException, ServletException, IOException {

        Map<String, Object> reporte = reporteDao.obtenerReporteContenido(tipo, fechaInicio, fechaFin);
        request.setAttribute("reporteContenido", reporte);
        request.setAttribute("tipoReporte", "contenido");
        request.getRequestDispatcher("portalAdmin.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("exportar".equals(action)) {
            exportarReporte(request, response);
        } else {
            response.sendRedirect("portalAdmin.jsp?error=accion_invalida");
        }
    }

    private void exportarReporte(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String formato = request.getParameter("formato"); // pdf, excel, csv
        String tipoReporte = request.getParameter("tipoReporte");
        String fechaInicio = request.getParameter("fechaInicio");
        String fechaFin = request.getParameter("fechaFin");

        // Aquí implementarías la lógica de exportación
        // Por ahora redirigimos con un mensaje

        response.sendRedirect("portalAdmin.jsp?success=reporte_exportado&formato=" + formato);
    }
}