package com.mycompany.dwintegrado.gym.Services;

import com.mycompany.dwintegrado.gym.Dao.UsuarioDao;
import com.mycompany.dwintegrado.gym.Model.UsuarioModel;

import java.sql.*;

public class UsuarioService {
    private UsuarioDao usuarioDao;


    public UsuarioService() {
        this.usuarioDao = new UsuarioDao();
    }

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
}
