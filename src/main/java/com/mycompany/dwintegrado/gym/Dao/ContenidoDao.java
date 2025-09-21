package com.mycompany.dwintegrado.gym.Dao;

import com.mycompany.dwintegrado.gym.Config.ConexionDB;
import com.mycompany.dwintegrado.gym.Model.ContenidoModel;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContenidoDao {

    public List<ContenidoModel> listarTodos() throws SQLException {
        List<ContenidoModel> contenidos = new ArrayList<>();
        String sql = "SELECT c.*, u.nombre as creador_nombre FROM contenido c " +
                "LEFT JOIN usuario u ON c.id_usuario_creador = u.id_usuario " +
                "ORDER BY c.fecha_creacion DESC";

        try (Connection conn = ConexionDB.abrir();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                contenidos.add(mapearContenido(rs));
            }
        }
        return contenidos;
    }

    public List<ContenidoModel> listarPorTipo(String tipo) throws SQLException {
        List<ContenidoModel> contenidos = new ArrayList<>();
        String sql = "SELECT c.*, u.nombre as creador_nombre FROM contenido c " +
                "LEFT JOIN usuario u ON c.id_usuario_creador = u.id_usuario " +
                "WHERE c.tipo = ? ORDER BY c.fecha_creacion DESC";

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, tipo);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    contenidos.add(mapearContenido(rs));
                }
            }
        }
        return contenidos;
    }

    public ContenidoModel obtenerPorId(int idContenido) throws SQLException {
        String sql = "SELECT c.*, u.nombre as creador_nombre FROM contenido c " +
                "LEFT JOIN usuario u ON c.id_usuario_creador = u.id_usuario " +
                "WHERE c.id_contenido = ?";

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idContenido);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapearContenido(rs);
                }
            }
        }
        return null;
    }

    public boolean crear(ContenidoModel contenido) throws SQLException {
        String sql = "INSERT INTO contenido (titulo, descripcion, tipo, contenido, estado, id_usuario_creador) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, contenido.getTitulo());
            stmt.setString(2, contenido.getDescripcion());
            stmt.setString(3, contenido.getTipo());
            stmt.setString(4, contenido.getContenido());
            stmt.setString(5, contenido.getEstado());
            stmt.setInt(6, contenido.getId_usuario_creador());

            return stmt.executeUpdate() > 0;
        }
    }

    public boolean actualizar(ContenidoModel contenido) throws SQLException {
        String sql = "UPDATE contenido SET titulo = ?, descripcion = ?, tipo = ?, contenido = ?, estado = ? " +
                "WHERE id_contenido = ?";

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, contenido.getTitulo());
            stmt.setString(2, contenido.getDescripcion());
            stmt.setString(3, contenido.getTipo());
            stmt.setString(4, contenido.getContenido());
            stmt.setString(5, contenido.getEstado());
            stmt.setInt(6, contenido.getId_contenido());

            return stmt.executeUpdate() > 0;
        }
    }

    public boolean eliminar(int idContenido) throws SQLException {
        String sql = "DELETE FROM contenido WHERE id_contenido = ?";

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idContenido);
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean cambiarEstado(int idContenido, String estado) throws SQLException {
        String sql = "UPDATE contenido SET estado = ? WHERE id_contenido = ?";

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, estado);
            stmt.setInt(2, idContenido);
            return stmt.executeUpdate() > 0;
        }
    }

    public int contarPorTipo(String tipo) throws SQLException {
        String sql = "SELECT COUNT(*) FROM contenido WHERE tipo = ? AND estado = 'publicado'";

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, tipo);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return 0;
    }

    private ContenidoModel mapearContenido(ResultSet rs) throws SQLException {
        ContenidoModel contenido = new ContenidoModel();
        contenido.setId_contenido(rs.getInt("id_contenido"));
        contenido.setTitulo(rs.getString("titulo"));
        contenido.setDescripcion(rs.getString("descripcion"));
        contenido.setTipo(rs.getString("tipo"));
        contenido.setContenido(rs.getString("contenido"));
        contenido.setEstado(rs.getString("estado"));
        contenido.setFecha_creacion(rs.getTimestamp("fecha_creacion").toLocalDateTime());
        contenido.setId_usuario_creador(rs.getInt("id_usuario_creador"));
        // Campo adicional para mostrar en interfaces
        if (columnExists(rs, "creador_nombre")) {
            contenido.setCreadorNombre(rs.getString("creador_nombre"));
        }
        return contenido;
    }

    private boolean columnExists(ResultSet rs, String columnName) {
        try {
            rs.findColumn(columnName);
            return true;
        } catch (SQLException e) {
            return false;
        }
    }
}