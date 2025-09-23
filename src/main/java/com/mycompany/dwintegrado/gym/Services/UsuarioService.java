package com.mycompany.dwintegrado.gym.Services;

import com.mycompany.dwintegrado.gym.Dao.UsuarioDao;
import com.mycompany.dwintegrado.gym.Model.UsuarioModel;
import java.sql.SQLException;
import java.util.List;

public class UsuarioService {

    private UsuarioDao usuarioDao;

    public UsuarioService() {
        this.usuarioDao = new UsuarioDao();
    }

    // ===================== MÉTODOS EXISTENTES =====================
    public boolean existeDNI(String dni) throws SQLException {
        return usuarioDao.existeDni(dni);
    }

    public int agregar(UsuarioModel usuarioModel) throws SQLException {
        int idGenerado = usuarioDao.insertar(usuarioModel);
        if (idGenerado > 0) {
            usuarioModel.setId_usuario(idGenerado); // Asignar el ID al objeto
        }
        return idGenerado;
    }

    public UsuarioModel validarUsuario(String dni, String password) throws SQLException {
        return usuarioDao.validar(dni, password);
    }

    // ===================== CRUD COMPLETO =====================
    public List<UsuarioModel> listarUsuarios() throws SQLException {
        return usuarioDao.obtenerTodos();
    }

    public UsuarioModel obtenerUsuarioPorId(int idUsuario) throws SQLException {
        return usuarioDao.obtenerPorId(idUsuario);
    }

    public boolean actualizarUsuario(UsuarioModel usuario) throws SQLException {
        return usuarioDao.actualizar(usuario);
    }

    public boolean eliminarUsuario(int idUsuario) throws SQLException {
        return usuarioDao.eliminar(idUsuario);
    }

}
