package com.mycompany.dwintegrado.gym.Services;

import com.mycompany.dwintegrado.gym.DTO.ClienteDTO;
import com.mycompany.dwintegrado.gym.DTO.RecepcionistaDTO;
import com.mycompany.dwintegrado.gym.Dao.ClienteDao;
import com.mycompany.dwintegrado.gym.Dao.RecepcionistaDao;
import com.mycompany.dwintegrado.gym.Dao.UsuarioDao;
import com.mycompany.dwintegrado.gym.Model.ClienteModel;
import com.mycompany.dwintegrado.gym.Model.RecepcionistaModel;
import com.mycompany.dwintegrado.gym.Model.UsuarioModel;

import java.sql.SQLException;

public class LoginService {
    private UsuarioDao usuarioDao;
    private ClienteDao clienteDao;
    private RecepcionistaDao recepcionistaDAO;

    // ✅ Constructor que inicializa los DAOs
    public LoginService() {
        this.usuarioDao = new UsuarioDao();
        this.clienteDao = new ClienteDao();
        this.recepcionistaDAO = new RecepcionistaDao();
    }
    ClienteModel clienteModel;
    RecepcionistaModel recepcionistaModel;

    public UsuarioModel validar(String dni, String contrasena) throws SQLException {
        return usuarioDao.validar(dni, contrasena);
    }

    public ClienteDTO obetenerClienteDTO(UsuarioModel usuarioModel) {
        // Buscar cliente por el idUsuario
        clienteModel = clienteDao.buscarPorIdUsuario(usuarioModel.getId_usuario());
        // Si encuentra el cliente, construir y devolver el DTO
        if (clienteModel != null) {
            return new ClienteDTO(

            );
        }
        return null; // o puedes lanzar una excepción si lo prefieres
    }

    public RecepcionistaDTO obetenerRecepcionistaDTO(UsuarioModel usuarioModel) {
        // Buscar cliente por el idUsuario
        recepcionistaModel = recepcionistaDAO.buscarPorIdUsuario(usuarioModel.getId_usuario());
        // Si encuentra el cliente, construir y devolver el DTO
        if (recepcionistaModel != null) {
            return new RecepcionistaDTO(
                    recepcionistaModel.getNombre(),
                    recepcionistaModel.getApellido(),
                    recepcionistaModel.getTelefono(),
                    usuarioModel.getDni()
            );
        }
        return null; // o puedes lanzar una excepción si lo prefieres
    }
}
