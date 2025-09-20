package com.mycompany.dwintegrado.gym.Controller;

import com.mycompany.dwintegrado.gym.Dao.ClienteDao;
import com.mycompany.dwintegrado.gym.Model.ClienteModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "EditarPerfilServlet", urlPatterns = {"/EditarPerfilServlet"})
public class EditarPerfilServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Verificar si el usuario está autenticado
        ClienteModel clienteSesion = (ClienteModel) session.getAttribute("clienteDTO");
        if (clienteSesion == null) {
            response.sendRedirect("login.jsp?error=no_autenticado");
            return;
        }

        try {
            // Obtener parámetros del formulario
            int idCliente = Integer.parseInt(request.getParameter("id_cliente"));
            String correo = request.getParameter("correo");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");

            System.out.println("DEBUG - Editando perfil:");
            System.out.println("ID Cliente: " + idCliente);
            System.out.println("Correo: " + correo);
            System.out.println("Teléfono: " + telefono);
            System.out.println("Dirección: " + direccion);

            // Validar que el ID de la sesión coincida con el del formulario
            if (clienteSesion.getId_cliente() != idCliente) {
                response.sendRedirect("portalCliente.jsp?error=acceso_no_autorizado");
                return;
            }

            // Crear objeto con los datos actualizados
            ClienteModel clienteActualizado = new ClienteModel();
            clienteActualizado.setId_cliente(idCliente);
            clienteActualizado.setCorreo(correo);
            clienteActualizado.setTelefono(telefono);
            clienteActualizado.setDireccion(direccion);

            // Actualizar en la base de datos
            ClienteDao clienteDao = new ClienteDao();
            boolean exito = clienteDao.actualizarDatosCliente(clienteActualizado);

            if (exito) {
                // Actualizar los datos en la sesión
                clienteSesion.setCorreo(correo);
                clienteSesion.setTelefono(telefono);
                clienteSesion.setDireccion(direccion);
                session.setAttribute("clienteDTO", clienteSesion);

                response.sendRedirect("portalCliente.jsp?success=perfil_actualizado");
            } else {
                response.sendRedirect("portalCliente.jsp?error=error_actualizacion");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("portalCliente.jsp?error=id_invalido");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("portalCliente.jsp?error=servidor");
        }
    }
}