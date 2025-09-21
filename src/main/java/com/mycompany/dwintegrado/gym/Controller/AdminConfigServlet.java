package com.mycompany.dwintegrado.gym.Controller;

import com.mycompany.dwintegrado.gym.Dao.ConfiguracionDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "AdminConfigServlet", urlPatterns = {"/AdminConfigServlet"})
public class AdminConfigServlet extends HttpServlet {

    private ConfiguracionDao configuracionDao;

    public AdminConfigServlet() {
        this.configuracionDao = new ConfiguracionDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Map<String, String> configuraciones = configuracionDao.obtenerTodasConfiguraciones();
            request.setAttribute("configuraciones", configuraciones);
            request.getRequestDispatcher("configuracionSistema.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("portalAdmin.jsp?error=error_obtener_configuracion");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            switch (action) {
                case "guardarGeneral":
                    guardarConfiguracionGeneral(request, response);
                    break;
                case "guardarNotificaciones":
                    guardarConfiguracionNotificaciones(request, response);
                    break;
                case "guardarCorreo":
                    guardarConfiguracionCorreo(request, response);
                    break;
                case "guardarPagos":
                    guardarConfiguracionPagos(request, response);
                    break;
                default:
                    response.sendRedirect("portalAdmin.jsp?error=accion_invalida");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("portalAdmin.jsp?error=error_servidor");
        }
    }

    private void guardarConfiguracionGeneral(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        Map<String, String> configuraciones = new HashMap<>();
        configuraciones.put("nombre_gimnasio", request.getParameter("nombre_gimnasio"));
        configuraciones.put("moneda", request.getParameter("moneda"));
        configuraciones.put("zona_horaria", request.getParameter("zona_horaria"));
        configuraciones.put("idioma", request.getParameter("idioma"));
        configuraciones.put("max_usuarios", request.getParameter("max_usuarios"));

        boolean exito = configuracionDao.actualizarConfiguraciones(configuraciones);

        if (exito) {
            response.sendRedirect("portalAdmin.jsp?success=configuracion_guardada");
        } else {
            response.sendRedirect("portalAdmin.jsp?error=error_guardar_configuracion");
        }
    }

    private void guardarConfiguracionNotificaciones(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        Map<String, String> configuraciones = new HashMap<>();
        configuraciones.put("notificaciones_email", request.getParameter("notificaciones_email"));
        configuraciones.put("recordatorios_pago", request.getParameter("recordatorios_pago"));
        configuraciones.put("notificaciones_nuevo_contenido", request.getParameter("notificaciones_nuevo_contenido"));
        configuraciones.put("alertas_sistema", request.getParameter("alertas_sistema"));

        boolean exito = configuracionDao.actualizarConfiguraciones(configuraciones);

        if (exito) {
            response.sendRedirect("portalAdmin.jsp?success=configuracion_notificaciones_guardada");
        } else {
            response.sendRedirect("portalAdmin.jsp?error=error_guardar_configuracion");
        }
    }

    private void guardarConfiguracionCorreo(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        Map<String, String> configuraciones = new HashMap<>();
        configuraciones.put("smtp_host", request.getParameter("smtp_host"));
        configuraciones.put("smtp_puerto", request.getParameter("smtp_puerto"));
        configuraciones.put("smtp_usuario", request.getParameter("smtp_usuario"));
        configuraciones.put("smtp_password", request.getParameter("smtp_password"));
        configuraciones.put("email_from", request.getParameter("email_from"));

        boolean exito = configuracionDao.actualizarConfiguraciones(configuraciones);

        if (exito) {
            response.sendRedirect("portalAdmin.jsp?success=configuracion_correo_guardada");
        } else {
            response.sendRedirect("portalAdmin.jsp?error=error_guardar_configuracion");
        }
    }

    private void guardarConfiguracionPagos(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        Map<String, String> configuraciones = new HashMap<>();
        configuraciones.put("pagos_habilitados", request.getParameter("pagos_habilitados"));
        configuraciones.put("metodo_pago_default", request.getParameter("metodo_pago_default"));
        configuraciones.put("comision_porcentaje", request.getParameter("comision_porcentaje"));
        configuraciones.put("dias_gracias", request.getParameter("dias_gracias"));

        boolean exito = configuracionDao.actualizarConfiguraciones(configuraciones);

        if (exito) {
            response.sendRedirect("portalAdmin.jsp?success=configuracion_pagos_guardada");
        } else {
            response.sendRedirect("portalAdmin.jsp?error=error_guardar_configuracion");
        }
    }

    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Para API RESTful - actualizar configuraciones específicas
        try {
            String clave = request.getParameter("clave");
            String valor = request.getParameter("valor");

            boolean exito = configuracionDao.actualizarConfiguracion(clave, valor);

            if (exito) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("Configuración actualizada");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }

        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}