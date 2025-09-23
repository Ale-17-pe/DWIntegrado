package com.mycompany.dwintegrado.gym.Services;

import com.mycompany.dwintegrado.gym.Dao.PlanDao;
import com.mycompany.dwintegrado.gym.Model.PlanModel;
import java.sql.SQLException;
import java.util.List;

public class PlanService {

    private PlanDao planDao;

    public PlanService() {
        this.planDao = new PlanDao();
    }

    // Listar todos los planes activos
    public List<PlanModel> listarPlanes() throws SQLException {
        return planDao.listarTodos();
    }

    // Obtener un plan por su ID
    public PlanModel obtenerPlanPorId(int idPlan) throws SQLException {
        return planDao.obtenerPorId(idPlan);
    }

    // Crear un nuevo plan
    public boolean crearPlan(PlanModel plan) throws SQLException {
        return planDao.crear(plan);
    }

    // Actualizar un plan existente
    public boolean actualizarPlan(PlanModel plan) throws SQLException {
        return planDao.actualizar(plan);
    }

    // Eliminar (desactivar) un plan
    public boolean eliminarPlan(int idPlan) throws SQLException {
        return planDao.eliminar(idPlan);
    }
    // Listar todos los planes (Admin)
    public List<PlanModel> listarTodos() throws SQLException {
        return planDao.listarTodos();
    }

    // Listar solo activos (Membresías pública)
    public List<PlanModel> listarActivos() throws SQLException {
        return planDao.listarActivos();
    }
    // Listar todos los planes (Admin)

}
