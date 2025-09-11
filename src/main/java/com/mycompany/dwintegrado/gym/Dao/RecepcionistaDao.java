package com.mycompany.dwintegrado.gym.Dao;

import com.mycompany.dwintegrado.gym.Config.ConexionDB;
import com.mycompany.dwintegrado.gym.Model.RecepcionistaModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RecepcionistaDao {
    RecepcionistaModel recepcionistaModel;
    Connection conn;
    PreparedStatement stmt;
    ResultSet rs;

    public RecepcionistaModel buscarPorIdUsuario(int idUsuario){
        try {
            conn = ConexionDB.abrir();
            String  sql= "SELECT * FROM recepcionista WHERE id_usuario = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idUsuario);
            rs = stmt.executeQuery();
            if (rs.next()) {
                recepcionistaModel = new RecepcionistaModel();
                recepcionistaModel.setId_recepcionista(rs.getInt("id_recepcionista"));
                recepcionistaModel.setId_usuario(rs.getInt("id_usuario"));
                recepcionistaModel.setNombre(rs.getString("nombre"));
                recepcionistaModel.setApellido(rs.getString("apellido"));
                recepcionistaModel.setTelefono(rs.getString("telefono"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                ConexionDB.cerrar(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return recepcionistaModel;
    }

}
