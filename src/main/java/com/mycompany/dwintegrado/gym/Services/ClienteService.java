package com.mycompany.dwintegrado.gym.Services;

import com.mycompany.dwintegrado.gym.DTO.ClienteDTO;
import com.mycompany.dwintegrado.gym.Dao.ClienteDao;
import com.mycompany.dwintegrado.gym.Model.ClienteModel;
import com.mycompany.dwintegrado.gym.Model.UsuarioModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;

public class ClienteService {
    private ClienteDao clienteDao;

    public ClienteService() {
        this.clienteDao = new ClienteDao(); // ← INICIALIZAR el dao
    }

    // 🔹 MÉTODO QUE NECESITAS PARA EL REGISTRO
    public boolean agregar(ClienteModel cliente) {
        try {
            int idGenerado = clienteDao.insertar(cliente);
            return idGenerado > 0;
        } catch (SQLException e) {
            System.out.println("ERROR en ClienteService.agregar: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

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

    // 🔹 Este método parece estar de más y tiene SQL incorrecto - puedes eliminarlo
    /*
    public boolean insertarCliente(ClienteModel cliente, int idUsuario, Connection conn) throws SQLException {
        String sql = "INSERT INTO clientes (nombre, apellido, correo, telefono, direccion, genero, fecha_nacimiento, dni, id_usuario) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        // ... código ...
    }
    */

    // [Los métodos de validación pueden permanecer igual...]
    public boolean validarCliente(ClienteModel clienteModel, UsuarioModel usuarioModel) {
        if (!validarDni(usuarioModel.getDni())) {
            System.out.println("DNI inválido.");
            return false;
        }
        // ... resto de validaciones ...
        return true;
    }

    public boolean validarDni(String dni) {
        return dni != null && dni.matches("\\d{8}");
    }

    public boolean validarTelefono(String telefono) {
        return telefono != null && telefono.matches("\\d{9}");
    }

    public boolean esMayorDeEdad(java.sql.Date fechaNacimiento) {
        if (fechaNacimiento == null) return false;
        LocalDate fechaNac = fechaNacimiento.toLocalDate();
        LocalDate hoy = LocalDate.now();
        Period edad = Period.between(fechaNac, hoy);
        return edad.getYears() >= 18;
    }

    public boolean validarDireccion(String direccion) {
        return direccion != null && direccion.trim().length() >= 5;
    }

    public boolean validarPassword(String password) {
        return password != null && password.length() >= 8;
    }

    public boolean passwordCoinciden(String password, String confirmar) {
        return password != null && password.equals(confirmar);
    }
}