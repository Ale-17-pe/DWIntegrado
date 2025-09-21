package com.mycompany.dwintegrado.gym.Controller;

import com.mycompany.dwintegrado.gym.Dao.UsuarioDao;
import com.mycompany.dwintegrado.gym.Model.UsuarioModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "AdminUsuarioServlet", urlPatterns = {"/AdminUsuarioServlet"})
public class AdminUsuarioServlet extends HttpServlet {

    private UsuarioDao usuarioDao;

    public AdminUsuarioServlet() {
        this.usuarioDao = new UsuarioDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            switch (action) {
                case "listar":
                    listarUsuarios(request, response);
                    break;
                case "obtener":
                    obtenerUsuario(request, response);
                    break;
                default:
                    response.sendRedirect("portalAdmin.jsp?error=accion_invalida");
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
                    crearUsuario(request, response);
                    break;
                case "actualizar":
                    actualizarUsuario(request, response);
                    break;
                case "eliminar":
                    eliminarUsuario(request, response);
                    break;
                case "cambiarEstado":
                    cambiarEstadoUsuario(request, response);
                    break;
                default:
                    response.sendRedirect("portalAdmin.jsp?error=accion_invalida");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("portalAdmin.jsp?error=error_servidor");
        }
    }

    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        List<UsuarioModel> usuarios = usuarioDao.obtenerTodos();
        request.setAttribute("usuarios", usuarios);
        request.getRequestDispatcher("portalAdmin.jsp").forward(request, response);
    }

    private void obtenerUsuario(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        int idUsuario = Integer.parseInt(request.getParameter("id"));
        UsuarioModel usuario = usuarioDao.obtenerPorId(idUsuario);

        request.setAttribute("usuario", usuario);
        request.getRequestDispatcher("editarUsuario.jsp").forward(request, response);
    }

    private void crearUsuario(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        UsuarioModel usuario = new UsuarioModel();
        usuario.setDni(request.getParameter("dni"));
        usuario.setNombre(request.getParameter("nombre"));
        usuario.setApellido(request.getParameter("apellido"));
        usuario.setEmail(request.getParameter("email"));
        usuario.setTelefono(request.getParameter("telefono"));
        usuario.setRol(request.getParameter("rol"));
        usuario.setUsuario_login(request.getParameter("dni"));
        usuario.setPassword(request.getParameter("password"));
        usuario.setFecha_Nacimiento(LocalDate.parse(request.getParameter("fechaNacimiento")));
        usuario.setEstado("activo");

        int idGenerado = usuarioDao.insertar(usuario);

        if (idGenerado > 0) {
            response.sendRedirect("portalAdmin.jsp?success=usuario_creado&id=" + idGenerado);
        } else {
            response.sendRedirect("portalAdmin.jsp?error=error_crear_usuario");
        }
    }

    private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        UsuarioModel usuario = new UsuarioModel();
        usuario.setId_usuario(Integer.parseInt(request.getParameter("id_usuario")));
        usuario.setNombre(request.getParameter("nombre"));
        usuario.setApellido(request.getParameter("apellido"));
        usuario.setEmail(request.getParameter("email"));
        usuario.setTelefono(request.getParameter("telefono"));
        usuario.setRol(request.getParameter("rol"));
        usuario.setEstado(request.getParameter("estado"));

        boolean exito = usuarioDao.actualizar(usuario);

        if (exito) {
            response.sendRedirect("portalAdmin.jsp?success=usuario_actualizado");
        } else {
            response.sendRedirect("portalAdmin.jsp?error=error_actualizar_usuario");
        }
    }

    private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
        boolean exito = usuarioDao.eliminar(idUsuario);

        if (exito) {
            response.sendRedirect("portalAdmin.jsp?success=usuario_eliminado");
        } else {
            response.sendRedirect("portalAdmin.jsp?error=error_eliminar_usuario");
        }
    }

    private void cambiarEstadoUsuario(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
        String estado = request.getParameter("estado");

        boolean exito = usuarioDao.cambiarEstado(idUsuario, estado);

        if (exito) {
            response.sendRedirect("portalAdmin.jsp?success=estado_actualizado");
        } else {
            response.sendRedirect("portalAdmin.jsp?error=error_cambiar_estado");
        }
    }
}