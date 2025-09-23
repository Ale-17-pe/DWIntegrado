package com.mycompany.dwintegrado.gym.Services;

import com.mycompany.dwintegrado.gym.Dao.ContenidoDao;
import com.mycompany.dwintegrado.gym.Model.ContenidoModel;

import java.sql.SQLException;
import java.util.List;

public class ContenidoService {

    private ContenidoDao contenidoDao = new ContenidoDao();

    public List<ContenidoModel> listarTodos() throws SQLException {
        return contenidoDao.listarTodos();
    }

    public List<ContenidoModel> listarPorTipo(String tipo) throws SQLException {
        return contenidoDao.listarPorTipo(tipo);
    }

    public ContenidoModel obtenerPorId(int idContenido) throws SQLException {
        return contenidoDao.obtenerPorId(idContenido);
    }

    public boolean crearContenido(ContenidoModel contenido) throws SQLException {
        return contenidoDao.crear(contenido);
    }

    public boolean actualizarContenido(ContenidoModel contenido) throws SQLException {
        return contenidoDao.actualizar(contenido);
    }

    public boolean eliminarContenido(int idContenido) throws SQLException {
        return contenidoDao.eliminar(idContenido);
    }
}
