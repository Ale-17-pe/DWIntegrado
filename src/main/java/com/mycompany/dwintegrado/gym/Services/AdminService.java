package com.mycompany.dwintegrado.gym.Services;

import com.mycompany.dwintegrado.gym.Model.PlanModel;
import com.mycompany.dwintegrado.gym.Model.UsuarioModel;
import com.mycompany.dwintegrado.gym.Model.ContenidoModel;
import java.sql.SQLException;
import java.util.List;

public class AdminService {

    private PlanService planService;
    private UsuarioService usuarioService;
    private ContenidoService contenidoService;

    public AdminService() {
        this.planService = new PlanService();
        this.usuarioService = new UsuarioService();
        this.contenidoService = new ContenidoService();
    }

    // ===================== PLANES =====================
    public List<PlanModel> listarPlanes() throws SQLException {
        return planService.listarPlanes();
    }

    public PlanModel obtenerPlanPorId(int idPlan) throws SQLException {
        return planService.obtenerPlanPorId(idPlan);
    }

    public boolean crearPlan(PlanModel plan) throws SQLException {
        return planService.crearPlan(plan);
    }

    public boolean actualizarPlan(PlanModel plan) throws SQLException {
        return planService.actualizarPlan(plan);
    }

    public boolean eliminarPlan(int idPlan) throws SQLException {
        return planService.eliminarPlan(idPlan);
    }

    // ===================== USUARIOS =====================
    public List<UsuarioModel> listarUsuarios() throws SQLException {
        return usuarioService.listarUsuarios();
    }

    public UsuarioModel obtenerUsuarioPorId(int idUsuario) throws SQLException {
        return usuarioService.obtenerUsuarioPorId(idUsuario);
    }

    public boolean crearUsuario(UsuarioModel usuario) throws SQLException {
        // Primero verificamos si el DNI ya existe
        if (usuarioService.existeDNI(usuario.getDni())) {
            return false; // No se puede crear, ya existe
        }
        // Si no existe, agregamos el usuario
        int idGenerado = usuarioService.agregar(usuario);
        return idGenerado > 0; // true si se creó correctamente
    }


    public boolean actualizarUsuario(UsuarioModel usuario) throws SQLException {
        return usuarioService.actualizarUsuario(usuario);
    }

    public boolean eliminarUsuario(int idUsuario) throws SQLException {
        return usuarioService.eliminarUsuario(idUsuario);
    }

    // ===================== CONTENIDOS =====================
    public List<ContenidoModel> listarContenidos() throws SQLException {
        return contenidoService.listarTodos();
    }

    public ContenidoModel obtenerContenidoPorId(int idContenido) throws SQLException {
        return contenidoService.obtenerPorId(idContenido);
    }

    public boolean crearContenido(ContenidoModel contenido) throws SQLException {
        return contenidoService.crearContenido(contenido);
    }

    public boolean actualizarContenido(ContenidoModel contenido) throws SQLException {
        return contenidoService.actualizarContenido(contenido);
    }

    public boolean eliminarContenido(int idContenido) throws SQLException {
        return contenidoService.eliminarContenido(idContenido);
    }

    // ===================== FUTUROS MÉTODOS ADMIN =====================
    // Aquí puedes agregar más módulos según necesites
}
