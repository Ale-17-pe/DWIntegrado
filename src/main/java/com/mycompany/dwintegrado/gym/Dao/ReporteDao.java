package com.mycompany.dwintegrado.gym.Dao;

import com.mycompany.dwintegrado.gym.Config.ConexionDB;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class ReporteDao {

    public int obtenerTotalUsuarios() throws SQLException {
        String sql = "SELECT COUNT(*) FROM usuario";

        try (Connection conn = ConexionDB.abrir();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    public int obtenerUsuariosActivos() throws SQLException {
        String sql = "SELECT COUNT(*) FROM usuario WHERE estado = 'activo'";

        try (Connection conn = ConexionDB.abrir();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    public int obtenerTotalPlanes() throws SQLException {
        String sql = "SELECT COUNT(*) FROM plan WHERE estado = 'activo'";

        try (Connection conn = ConexionDB.abrir();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    public double obtenerIngresosMensuales() throws SQLException {
        String sql = "SELECT COALESCE(SUM(precio_pagado), 0) FROM usuario_plan " +
                "WHERE estado = 'activa' AND fecha_inicio >= DATE_SUB(NOW(), INTERVAL 30 DAY)";

        try (Connection conn = ConexionDB.abrir();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                return rs.getDouble(1);
            }
        }
        return 0.0;
    }

    public int obtenerContenidoPublicado() throws SQLException {
        String sql = "SELECT COUNT(*) FROM contenido WHERE estado = 'publicado'";

        try (Connection conn = ConexionDB.abrir();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    public Map<String, Object> obtenerReporteIngresos(String tipo, String fechaInicio, String fechaFin) throws SQLException {
        Map<String, Object> reporte = new HashMap<>();
        String sql = "";

        switch (tipo) {
            case "mensual":
                sql = "SELECT DATE_FORMAT(fecha_inicio, '%Y-%m') as periodo, SUM(precio_pagado) as total " +
                        "FROM usuario_plan WHERE fecha_inicio BETWEEN ? AND ? " +
                        "GROUP BY DATE_FORMAT(fecha_inicio, '%Y-%m') ORDER BY periodo";
                break;
            case "diario":
                sql = "SELECT DATE(fecha_inicio) as periodo, SUM(precio_pagado) as total " +
                        "FROM usuario_plan WHERE fecha_inicio BETWEEN ? AND ? " +
                        "GROUP BY DATE(fecha_inicio) ORDER BY periodo";
                break;
            default:
                sql = "SELECT YEAR(fecha_inicio) as periodo, SUM(precio_pagado) as total " +
                        "FROM usuario_plan WHERE fecha_inicio BETWEEN ? AND ? " +
                        "GROUP BY YEAR(fecha_inicio) ORDER BY periodo";
        }

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, fechaInicio);
            stmt.setString(2, fechaFin);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    reporte.put(rs.getString("periodo"), rs.getDouble("total"));
                }
            }
        }
        return reporte;
    }

    public Map<String, Object> obtenerReporteUsuarios(String tipo, String fechaInicio, String fechaFin) throws SQLException {
        Map<String, Object> reporte = new HashMap<>();
        String sql = "";

        switch (tipo) {
            case "mensual":
                sql = "SELECT DATE_FORMAT(fecha_creacion, '%Y-%m') as periodo, COUNT(*) as total " +
                        "FROM usuario WHERE fecha_creacion BETWEEN ? AND ? " +
                        "GROUP BY DATE_FORMAT(fecha_creacion, '%Y-%m') ORDER BY periodo";
                break;
            case "por_rol":
                sql = "SELECT rol, COUNT(*) as total FROM usuario " +
                        "WHERE fecha_creacion BETWEEN ? AND ? GROUP BY rol";
                break;
            default:
                sql = "SELECT DATE(fecha_creacion) as periodo, COUNT(*) as total " +
                        "FROM usuario WHERE fecha_creacion BETWEEN ? AND ? " +
                        "GROUP BY DATE(fecha_creacion) ORDER BY periodo";
        }

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, fechaInicio);
            stmt.setString(2, fechaFin);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    reporte.put(rs.getString("periodo"), rs.getInt("total"));
                }
            }
        }
        return reporte;
    }

    public Map<String, Object> obtenerReporteContenido(String tipo, String fechaInicio, String fechaFin) throws SQLException {
        Map<String, Object> reporte = new HashMap<>();
        String sql = "";

        switch (tipo) {
            case "por_tipo":
                sql = "SELECT tipo, COUNT(*) as total FROM contenido " +
                        "WHERE fecha_creacion BETWEEN ? AND ? GROUP BY tipo";
                break;
            case "por_estado":
                sql = "SELECT estado, COUNT(*) as total FROM contenido " +
                        "WHERE fecha_creacion BETWEEN ? AND ? GROUP BY estado";
                break;
            default:
                sql = "SELECT DATE(fecha_creacion) as periodo, COUNT(*) as total " +
                        "FROM contenido WHERE fecha_creacion BETWEEN ? AND ? " +
                        "GROUP BY DATE(fecha_creacion) ORDER BY periodo";
        }

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, fechaInicio);
            stmt.setString(2, fechaFin);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    reporte.put(rs.getString("periodo"), rs.getInt("total"));
                }
            }
        }
        return reporte;
    }

    public int obtenerNuevosUsuariosUltimos30Dias() throws SQLException {
        String sql = "SELECT COUNT(*) FROM usuario WHERE fecha_creacion >= DATE_SUB(NOW(), INTERVAL 30 DAY)";

        try (Connection conn = ConexionDB.abrir();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    public double obtenerIngresosTotales() throws SQLException {
        String sql = "SELECT COALESCE(SUM(precio_pagado), 0) FROM usuario_plan WHERE estado = 'activa'";

        try (Connection conn = ConexionDB.abrir();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                return rs.getDouble(1);
            }
        }
        return 0.0;
    }
}