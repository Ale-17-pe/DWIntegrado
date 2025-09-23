/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dwintegrado.gym.Model;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.*;


@Data
@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
public class ClienteModel {

    private int id_cliente, id_usuario;
    private String dni, nombre, apellido, correo, telefono, direccion, genero;
    private java.sql.Date fecha_nacimiento;
}
