package com.mycompany.dwintegrado.gym.Dao;

import com.mycompany.dwintegrado.gym.Config.ConexionDB;
import com.mycompany.dwintegrado.gym.Model.ContenidoModel;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ContenidoDao {

    public List<ContenidoModel> listarTodos() throws SQLException {
    List<ContenidoModel> contenidos = new ArrayList<>();
    String sql = "SELECT * FROM contenido ORDER BY fecha_creacion DESC";

    try (Connection conn = ConexionDB.abrir();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql)) {

        while (rs.next()) {
            ContenidoModel contenido = new ContenidoModel();
            contenido.setId_contenido(rs.getInt("id_contenido"));
            contenido.setTitulo(rs.getString("titulo"));
            contenido.setDescripcion(rs.getString("descripcion"));
            contenido.setTipo(rs.getString("tipo"));
            contenido.setContenido(rs.getString("contenido"));
            contenido.setEstado(rs.getString("estado"));
            contenido.setFecha_creacion(rs.getTimestamp("fecha_creacion").toLocalDateTime());
            contenido.setId_usuario_creador(rs.getInt("id_usuario_creador"));
            contenidos.add(contenido);
        }
    }
    return contenidos;
}

    // Más métodos CRUD para contenido...
}
