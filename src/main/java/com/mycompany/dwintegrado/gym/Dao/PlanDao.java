package com.mycompany.dwintegrado.gym.Dao;

import com.mycompany.dwintegrado.gym.Config.ConexionDB;
import com.mycompany.dwintegrado.gym.Model.PlanModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PlanDao {
    Connection conn;
    PreparedStatement stmt;
    ResultSet rs;

    // INSERTAR
    public boolean insertar(PlanModel plan) {
        String sql = "INSERT INTO plan (nombre, descripcion, duracion_dias, precio, tipo, estado) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            conn = ConexionDB.abrir();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, plan.getNombre());
            stmt.setString(2, plan.getDescripcion());
            stmt.setInt(3, plan.getDuracion_dias());
            stmt.setDouble(4, plan.getPrecio());
            stmt.setString(5, plan.getTipo());
            stmt.setString(6, plan.getEstado());
            int filas = stmt.executeUpdate();
            return filas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // LISTAR TODOS
    public List<PlanModel> obtenerTodos() {
        List<PlanModel> lista = new ArrayList<>();
        String sql = "SELECT * FROM plan";
        try {
            conn = ConexionDB.abrir();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                PlanModel plan = new PlanModel();
                plan.setId_plan(rs.getInt("id_pla")); // 👈 usa id_pla de tu tabla
                plan.setNombre(rs.getString("nombre"));
                plan.setDescripcion(rs.getString("descripcion"));
                plan.setDuracion_dias(rs.getInt("duracion_dias"));
                plan.setPrecio(rs.getDouble("precio"));
                plan.setTipo(rs.getString("tipo"));
                plan.setEstado(rs.getString("estado"));
                lista.add(plan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // ELIMINAR
    public boolean eliminar(int id) {
        String sql = "DELETE FROM plan WHERE id_pla=?";
        try {
            conn = ConexionDB.abrir();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            int filas = stmt.executeUpdate();
            return filas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
