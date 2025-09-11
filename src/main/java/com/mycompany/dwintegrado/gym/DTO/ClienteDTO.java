package com.mycompany.dwintegrado.gym.DTO;

import lombok.*;

import java.util.Date;


@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class ClienteDTO {
    private int id_cliente;
    private String nombre, apellido, correo, telefono, direccion, genero, dni;
    private Date fecha_nacimiento;

}
