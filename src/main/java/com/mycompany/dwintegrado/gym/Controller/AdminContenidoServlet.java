package com.mycompany.dwintegrado.gym.Controller;

import com.mycompany.dwintegrado.gym.Dao.ContenidoDao;
import com.mycompany.dwintegrado.gym.Model.ContenidoModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "AdminContenidoServlet", urlPatterns = {"/AdminContenidoServlet"})
public class AdminContenidoServlet extends HttpServlet {

    private ContenidoDao contenidoDao;

    public AdminContenidoServlet() {
        this.contenidoDao = new ContenidoDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            if ("listar".equals(action)) {
                listarContenidos(request, response);
            } else if ("obtener".equals(action)) {
                obtenerContenido(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("portalAdmin.jsp?error=error_servidor");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            switch (action) {
                case "crear":
                    crearContenido(request, response);
                    break;
                case "actualizar":
                    actualizarContenido(request, response);
                    break;
                case "eliminar":
                    eliminarContenido(request, response);
                    break;
                case "cambiarEstado":
                    cambiarEstadoContenido(request, response);
                    break;
                default:
                    response.sendRedirect("portalAdmin.jsp?error=accion_invalida");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("portalAdmin.jsp?error=error_servidor");
        }
    }

    private void listarContenidos(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        List<ContenidoModel> contenidos = contenidoDao.listarTodos();
        request.setAttribute("contenidos", contenidos);
        request.getRequestDispatcher("portalAdmin.jsp").forward(request, response);
    }

    private void obtenerContenido(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        int idContenido = Integer.parseInt(request.getParameter("id"));
        ContenidoModel contenido = contenidoDao.obtenerPorId(idContenido);

        request.setAttribute("contenido", contenido);
        request.getRequestDispatcher("editarContenido.jsp").forward(request, response);
    }

    private void crearContenido(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        ContenidoModel contenido = new ContenidoModel();
        contenido.setTitulo(request.getParameter("titulo"));
        contenido.setDescripcion(request.getParameter("descripcion"));
        contenido.setTipo(request.getParameter("tipo"));
        contenido.setContenido(request.getParameter("contenido"));
        contenido.setEstado(request.getParameter("estado"));
        contenido.setId_usuario_creador(Integer.parseInt(request.getParameter("id_usuario_creador")));
        contenido.setFecha_creacion(LocalDateTime.now());

        boolean exito = contenidoDao.crear(contenido);

        if (exito) {
            response.sendRedirect("portalAdmin.jsp?success=contenido_creado");
        } else {
            response.sendRedirect("portalAdmin.jsp?error=error_crear_contenido");
        }
    }

    private void actualizarContenido(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        ContenidoModel contenido = new ContenidoModel();
        contenido.setId_contenido(Integer.parseInt(request.getParameter("id_contenido")));
        contenido.setTitulo(request.getParameter("titulo"));
        contenido.setDescripcion(request.getParameter("descripcion"));
        contenido.setTipo(request.getParameter("tipo"));
        contenido.setContenido(request.getParameter("contenido"));
        contenido.setEstado(request.getParameter("estado"));

        boolean exito = contenidoDao.actualizar(contenido);

        if (exito) {
            response.sendRedirect("portalAdmin.jsp?success=contenido_actualizado");
        } else {
            response.sendRedirect("portalAdmin.jsp?error=error_actualizar_contenido");
        }
    }

    private void eliminarContenido(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        int idContenido = Integer.parseInt(request.getParameter("id_contenido"));
        boolean exito = contenidoDao.eliminar(idContenido);

        if (exito) {
            response.sendRedirect("portalAdmin.jsp?success=contenido_eliminado");
        } else {
            response.sendRedirect("portalAdmin.jsp?error=error_eliminar_contenido");
        }
    }

    private void cambiarEstadoContenido(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        int idContenido = Integer.parseInt(request.getParameter("id_contenido"));
        String estado = request.getParameter("estado");

        boolean exito = contenidoDao.cambiarEstado(idContenido, estado);

        if (exito) {
            response.sendRedirect("portalAdmin.jsp?success=estado_contenido_actualizado");
        } else {
            response.sendRedirect("portalAdmin.jsp?error=error_cambiar_estado_contenido");
        }
    }
}