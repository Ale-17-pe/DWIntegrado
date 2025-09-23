package com.mycompany.dwintegrado.gym.Dao;

import com.mycompany.dwintegrado.gym.Config.ConexionDB;
import com.mycompany.dwintegrado.gym.Model.PlanModel;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlanDao {

    // Listar solo los planes activos (para Membresías.jsp)
    public List<PlanModel> listarActivos() throws SQLException {
        List<PlanModel> planes = new ArrayList<>();
        String sql = "SELECT * FROM Plan WHERE estado = 'Activo' ORDER BY nombre";

        try (Connection conn = ConexionDB.abrir();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                planes.add(mapearPlan(rs));
            }
        }
        return planes;
    }

    // Listar todos los planes (para el admin)
    public List<PlanModel> listarTodos() throws SQLException {
        List<PlanModel> planes = new ArrayList<>();
        String sql = "SELECT * FROM Plan ORDER BY nombre";

        try (Connection conn = ConexionDB.abrir();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                planes.add(mapearPlan(rs));
            }
        }
        return planes;
    }


    public PlanModel obtenerPorId(int idPlan) throws SQLException {
        String sql = "SELECT * FROM Plan WHERE id_plan = ?";

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idPlan);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapearPlan(rs);
                }
            }
        }
        return null;
    }

    public boolean crear(PlanModel plan) throws SQLException {
        String sql = "INSERT INTO Plan (nombre, descripcion, duration_dias, precio, tipo, estado) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, plan.getNombre());
            stmt.setString(2, plan.getDescripcion());
            stmt.setInt(3, plan.getDuration_dias());
            stmt.setBigDecimal(4, plan.getPrecio());
            stmt.setString(5, plan.getTipo());
            stmt.setString(6, plan.getEstado());

            return stmt.executeUpdate() > 0;
        }
    }

    public boolean actualizar(PlanModel plan) throws SQLException {
        String sql = "UPDATE Plan SET nombre = ?, descripcion = ?, duration_dias = ?, precio = ?, tipo = ?, estado = ? WHERE id_plan = ?";

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, plan.getNombre());
            stmt.setString(2, plan.getDescripcion());
            stmt.setInt(3, plan.getDuration_dias());
            stmt.setBigDecimal(4, plan.getPrecio());
            stmt.setString(5, plan.getTipo());
            stmt.setString(6, plan.getEstado());
            stmt.setInt(7, plan.getId_plan());

            return stmt.executeUpdate() > 0;
        }
    }

    public boolean eliminar(int idPlan) throws SQLException {
        String sql = "UPDATE Plan SET estado = 'Inactivo' WHERE id_plan = ?";

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idPlan);
            return stmt.executeUpdate() > 0;
        }
    }

    private PlanModel mapearPlan(ResultSet rs) throws SQLException {
        PlanModel plan = new PlanModel();
        plan.setId_plan(rs.getInt("id_plan"));
        plan.setNombre(rs.getString("nombre"));
        plan.setDescripcion(rs.getString("descripcion"));
        plan.setDuration_dias(rs.getInt("duration_dias"));
        plan.setPrecio(rs.getBigDecimal("precio"));
        plan.setTipo(rs.getString("tipo"));
        plan.setEstado(rs.getString("estado"));
        return plan;
    }

}

