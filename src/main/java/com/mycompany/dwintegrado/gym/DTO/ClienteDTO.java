package com.mycompany.dwintegrado.gym.DTO;

import lombok.*;

import java.util.Date;


@NoArgsConstructor
@Setter
@Getter
public class ClienteDTO {
    private int id_cliente;
    private String nombre, apellido, correo, telefono, direccion, genero, dni;
    private Date fecha_nacimiento;

    public ClienteDTO(int id_cliente, String nombre, String apellido,
                      String correo, String telefono, String genero, String direccion,
                      String dni, Date fecha_nacimiento) {
        this.id_cliente = id_cliente;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.telefono = telefono;
        this.genero = genero;
        this.direccion = direccion;
        this.dni = dni;
        this.fecha_nacimiento = fecha_nacimiento;
    }
}
