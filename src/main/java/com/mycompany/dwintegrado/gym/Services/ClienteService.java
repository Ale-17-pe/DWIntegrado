package com.mycompany.dwintegrado.gym.Services;

import com.mycompany.dwintegrado.gym.DTO.ClienteDTO;
import com.mycompany.dwintegrado.gym.Dao.ClienteDao;
import com.mycompany.dwintegrado.gym.Model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;

public class ClienteService {
    private ClienteDao clienteDao;

    public int insertar(ClienteModel clienteModel) throws SQLException {
        return clienteDao.insertar(clienteModel);
    }

    public ClienteModel obtenerPorId(int idcliente){
        return clienteDao.buscarPorIdUsuario(idcliente);
    }

    public List<ClienteDTO> listarTodos(){
        return clienteDao.listarTodos();
    }

    public ClienteModel obternerclienteidusuario(int idusuario){
        return clienteDao.buscarPorIdUsuario(idusuario);
    }

    // 🔹 Método corregido: recibe Connection (no ConexionDB)
    public boolean insertarCliente(ClienteModel cliente, int idUsuario, Connection conn) throws SQLException {
        String sql = "INSERT INTO clientes (nombre, apellido, correo, telefono, direccion, genero, fecha_nacimiento, dni, id_usuario) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, cliente.getNombre());
            stmt.setString(2, cliente.getApellido());
            stmt.setString(3, cliente.getCorreo());
            stmt.setString(4, cliente.getTelefono());
            stmt.setString(5, cliente.getDireccion());
            stmt.setString(6, cliente.getGenero());
            stmt.setDate(7, cliente.getFecha_nacimiento());
            stmt.setString(8, cliente.getDni());
            stmt.setInt(9, idUsuario);

            return stmt.executeUpdate() > 0;
        }
    }


    public boolean validarCliente(ClienteModel clienteModel, UsuarioModel usuarioModel) {
        if (!validarDni(usuarioModel.getDni())) {
            System.out.println("DNI inválido.");
            return false;
        }
        if (!validarTelefono(clienteModel.getTelefono())) {
            System.out.println("Teléfono inválido.");
            return false;
        }
        if (!esMayorDeEdad(clienteModel.getFecha_nacimiento())) {
            System.out.println("El cliente debe ser mayor de 18 años.");
            return false;
        }
        if (!validarDireccion(clienteModel.getDireccion())) {
            System.out.println("Dirección inválida.");
            return false;
        }
        if (!validarPassword(usuarioModel.getPassword())) {
            System.out.println("Contraseña inválida.");
            return false;
        }
        return true;
    }

    /** DNI debe tener exactamente 8 dígitos numéricos */
    public boolean validarDni(String dni) {
        return dni != null && dni.matches("\\d{8}");
    }

    /** Teléfono debe tener exactamente 9 dígitos numéricos */
    public boolean validarTelefono(String telefono) {
        return telefono != null && telefono.matches("\\d{9}");
    }

    /** La persona debe ser mayor o igual a 18 años */
    public boolean esMayorDeEdad(java.sql.Date fechaNacimiento) {
        if (fechaNacimiento == null) return false;
        LocalDate fechaNac = fechaNacimiento.toLocalDate();
        LocalDate hoy = LocalDate.now();
        Period edad = Period.between(fechaNac, hoy);
        return edad.getYears() >= 18;
    }

    /** La dirección debe tener al menos 5 caracteres */
    public boolean validarDireccion(String direccion) {
        return direccion != null && direccion.trim().length() >= 5;
    }

    /** Contraseña debe tener al menos 8 caracteres */
    public boolean validarPassword(String password) {
        return password != null && password.length() >= 8;
    }

    /** Validar que dos contraseñas coincidan */
    public boolean passwordCoinciden(String password, String confirmar) {
        return password != null && password.equals(confirmar);
    }
}
