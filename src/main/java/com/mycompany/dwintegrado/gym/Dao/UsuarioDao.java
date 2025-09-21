package com.mycompany.dwintegrado.gym.Dao;

import com.mycompany.dwintegrado.gym.Config.ConexionDB;
import com.mycompany.dwintegrado.gym.Model.UsuarioModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDao {
    public int insertar(UsuarioModel usuarioModel) throws SQLException {
        int idGenerado = -1;
        String INSERT_SQL = "INSERT INTO Usuario (dni, nombre, apellido, email, telefono, "
                + "fecha_nacimiento, rol, usuario_login, password) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(INSERT_SQL, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, usuarioModel.getDni());
            stmt.setString(2, usuarioModel.getNombre());
            stmt.setString(3, usuarioModel.getApellido());
            stmt.setString(4, usuarioModel.getEmail());
            stmt.setString(5, usuarioModel.getTelefono());
            stmt.setDate(6, Date.valueOf(usuarioModel.getFecha_Nacimiento()));
            stmt.setString(7, usuarioModel.getRol());
            stmt.setString(8, usuarioModel.getUsuario_login());
            stmt.setString(9, usuarioModel.getPassword());

            int filas = stmt.executeUpdate();

            if (filas > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        idGenerado = rs.getInt(1);
                    }
                }
            }
        }
        return idGenerado;
    }

    public boolean existeDni(String dni) throws SQLException {
        String sql = "SELECT COUNT(*) FROM usuario WHERE dni = ?";
        try (Connection conn = ConexionDB.abrir(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, dni);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    public UsuarioModel validar(String dni, String contrasena) throws SQLException {
        String sql = "SELECT * FROM usuario WHERE dni = ? AND password = ?";
        UsuarioModel usuario = null;

        try (Connection conn = ConexionDB.abrir(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, dni);
            stmt.setString(2, contrasena);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    usuario = mapearUsuario(rs);
                }
            }
        }
        return usuario;
    }

    public UsuarioModel obtenerPorId(int idUsuario) throws SQLException {
        String sql = "SELECT * FROM usuario WHERE id_usuario = ?";
        UsuarioModel usuarioModel = null;

        try (Connection conn = ConexionDB.abrir(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idUsuario);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    usuarioModel = mapearUsuario(rs);
                }
            }
        }
        return usuarioModel;
    }

    public List<UsuarioModel> obtenerTodos() throws SQLException {
        List<UsuarioModel> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuario";
        try (Connection conn = ConexionDB.abrir(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                usuarios.add(mapearUsuario(rs));
            }
        }
        return usuarios;
    }

    public boolean actualizar(UsuarioModel usuarioModel) throws SQLException {
        String sql = "UPDATE usuario SET nombre=?, apellido=?, email=?, telefono=?, rol=?, estado=? WHERE id_usuario=?";
        try (Connection conn = ConexionDB.abrir(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, usuarioModel.getNombre());
            stmt.setString(2, usuarioModel.getApellido());
            stmt.setString(3, usuarioModel.getEmail());
            stmt.setString(4, usuarioModel.getTelefono());
            stmt.setString(5, usuarioModel.getRol());
            stmt.setString(6, usuarioModel.getEstado());
            stmt.setInt(7, usuarioModel.getId_usuario());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean eliminar(int idUsuario) throws SQLException {
        String sql = "DELETE FROM usuario WHERE id_usuario = ?";
        try (Connection conn = ConexionDB.abrir(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idUsuario);
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean cambiarEstado(int idUsuario, String estado) throws SQLException {
        String sql = "UPDATE usuario SET estado=? WHERE id_usuario = ?";
        try (Connection conn = ConexionDB.abrir(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, estado);
            stmt.setInt(2, idUsuario);
            return stmt.executeUpdate() > 0;
        }
    }

    private UsuarioModel mapearUsuario(ResultSet rs) throws SQLException {
        UsuarioModel usuario = new UsuarioModel();
        usuario.setId_usuario(rs.getInt("id_usuario"));
        usuario.setDni(rs.getString("dni"));
        usuario.setNombre(rs.getString("nombre"));
        usuario.setApellido(rs.getString("apellido"));
        usuario.setEmail(rs.getString("email"));
        usuario.setTelefono(rs.getString("telefono"));
        usuario.setRol(rs.getString("rol"));
        usuario.setUsuario_login(rs.getString("usuario_login"));
        usuario.setPassword(rs.getString("password"));
        usuario.setFecha_Nacimiento(rs.getDate("fecha_nacimiento").toLocalDate());

        // Columnas opcionales (pueden ser null)
        if (rs.getDate("fecha_contratacion") != null) {
            usuario.setFecha_Contratacion(rs.getDate("fecha_contratacion").toLocalDate());
        }

        usuario.setFecha_creacion(rs.getTimestamp("fecha_creacion").toLocalDateTime());

        return usuario;
    }

}
