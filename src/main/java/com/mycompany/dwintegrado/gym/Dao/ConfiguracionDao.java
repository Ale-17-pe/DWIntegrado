package com.mycompany.dwintegrado.gym.Dao;

import com.mycompany.dwintegrado.gym.Config.ConexionDB;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class ConfiguracionDao {

    public Map<String, String> obtenerTodasConfiguraciones() throws SQLException {
        Map<String, String> configuraciones = new HashMap<>();
        String sql = "SELECT clave, valor FROM configuracion_sistema";

        try (Connection conn = ConexionDB.abrir();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                configuraciones.put(rs.getString("clave"), rs.getString("valor"));
            }
        }
        return configuraciones;
    }

    public String obtenerConfiguracion(String clave) throws SQLException {
        String sql = "SELECT valor FROM configuracion_sistema WHERE clave = ?";

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, clave);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("valor");
                }
            }
        }
        return null;
    }

    public boolean actualizarConfiguracion(String clave, String valor) throws SQLException {
        String sql = "UPDATE configuracion_sistema SET valor = ? WHERE clave = ?";

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, valor);
            stmt.setString(2, clave);
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean actualizarConfiguraciones(Map<String, String> configuraciones) throws SQLException {
        String sql = "UPDATE configuracion_sistema SET valor = ? WHERE clave = ?";
        boolean exito = true;

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            for (Map.Entry<String, String> entry : configuraciones.entrySet()) {
                stmt.setString(1, entry.getValue());
                stmt.setString(2, entry.getKey());
                stmt.addBatch();
            }

            int[] resultados = stmt.executeBatch();
            for (int resultado : resultados) {
                if (resultado <= 0) {
                    exito = false;
                    break;
                }
            }
        }
        return exito;
    }

    public boolean insertarConfiguracion(String clave, String valor) throws SQLException {
        String sql = "INSERT INTO configuracion_sistema (clave, valor) VALUES (?, ?)";

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, clave);
            stmt.setString(2, valor);
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean existeConfiguracion(String clave) throws SQLException {
        String sql = "SELECT COUNT(*) FROM configuracion_sistema WHERE clave = ?";

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, clave);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
}