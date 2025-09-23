package com.mycompany.dwintegrado.gym.Services;

import com.mycompany.dwintegrado.gym.Dao.ConfiguracionDao;

import java.sql.SQLException;
import java.util.Map;

public class ConfiguracionService {

    private ConfiguracionDao configuracionDao = new ConfiguracionDao();

    // Obtener todas las configuraciones
    public Map<String, String> obtenerTodas() throws SQLException {
        return configuracionDao.obtenerTodasConfiguraciones();
    }

    // Obtener una configuración por clave
    public String obtenerPorClave(String clave) throws SQLException {
        return configuracionDao.obtenerConfiguracion(clave);
    }

    // Actualizar una sola configuración
    public boolean actualizar(String clave, String valor) throws SQLException {
        return configuracionDao.actualizarConfiguracion(clave, valor);
    }

    // Actualizar varias configuraciones a la vez
    public boolean actualizarVarias(Map<String, String> configuraciones) throws SQLException {
        return configuracionDao.actualizarConfiguraciones(configuraciones);
    }

    // Insertar nueva configuración
    public boolean insertar(String clave, String valor) throws SQLException {
        return configuracionDao.insertarConfiguracion(clave, valor);
    }

    // Verificar si existe una configuración
    public boolean existe(String clave) throws SQLException {
        return configuracionDao.existeConfiguracion(clave);
    }
}
