package com.mycompany.dwintegrado.gym.Dao;

import com.mycompany.dwintegrado.gym.Config.ConexionDB;
import com.mycompany.dwintegrado.gym.DTO.ClienteDTO;
import com.mycompany.dwintegrado.gym.Model.ClienteModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClienteDao {
    public int insertar(ClienteModel clienteModel) throws SQLException {
        int idGenerado = -1;
        String INSERT_SQL = "INSERT INTO cliente (id_usuario, nombre, apellido, correo, telefono, direccion, fecha_nacimiento, genero) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(INSERT_SQL, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, clienteModel.getId_usuario());
            stmt.setString(2, clienteModel.getNombre());
            stmt.setString(3, clienteModel.getApellido());
            stmt.setString(4, clienteModel.getCorreo());
            stmt.setString(5, clienteModel.getTelefono());
            stmt.setString(6, clienteModel.getDireccion());
            stmt.setDate(7, clienteModel.getFecha_nacimiento());
            stmt.setString(8, clienteModel.getGenero());

            int filas = stmt.executeUpdate();

            if (filas > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        idGenerado = rs.getInt(1);
                    }
                }
            }
            return idGenerado;
        }
    }
    public ClienteModel buscarPorIdUsuario(int id_usuario){
        String sql ="SELECT * FROM cliente WHERE id_usuario = ?";
        ClienteModel clienteModel = null;

        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql)){
            stmt.setInt(1,id_usuario);
            try (ResultSet rs = stmt.executeQuery()){
                if (rs.next()){
                    clienteModel = mapearClienteModel(rs);
                }

            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return clienteModel;
    }
    public List<ClienteDTO> listarTodos() {
        List<ClienteDTO> lista = new ArrayList<>();
        String sql = "SELECT c.id_cliente, c.nombre, c.apellido, u.dni, c.correo "
                + "FROM cliente c "
                + "JOIN usuario u ON c.id_usuario = u.id_usuario";
        try (Connection conn = ConexionDB.abrir();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs =stmt.executeQuery()) {

            while (rs.next()){
                ClienteDTO dto = new ClienteDTO();
                dto.setId_cliente(rs.getInt("id_cliente"));
                dto.setNombre(rs.getString("nombre"));
                dto.setApellido(rs.getString("apellido"));
                dto.setDni(rs.getString("dni"));
                dto.setCorreo(rs.getString("correo"));
                lista.add(dto);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    private ClienteModel mapearClienteModel(ResultSet rs) throws SQLException {
        ClienteModel clienteModel = new ClienteModel();

        clienteModel.setId_cliente(rs.getInt("id_cliente"));
        clienteModel.setId_usuario(rs.getInt("id_usuario"));
        clienteModel.setNombre(rs.getString("nombre"));
        clienteModel.setApellido(rs.getString("apellido"));
        clienteModel.setCorreo(rs.getString("correo"));
        clienteModel.setTelefono(rs.getString("telefono"));
        clienteModel.setDireccion(rs.getString("direccion"));
        clienteModel.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));
        clienteModel.setGenero(rs.getString("genero"));
        return clienteModel;
    }
}
