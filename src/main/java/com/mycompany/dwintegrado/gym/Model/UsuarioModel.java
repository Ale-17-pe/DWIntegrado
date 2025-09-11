/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dwintegrado.gym.Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class UsuarioModel {
    private int id_usuario;
    private String dni, nombre, apellido,email, telefono, direccion, rol, estado, usuario_login, password;
    private LocalDate fecha_Nacimiento, fecha_Contratacion;
    private LocalDateTime fecha_creacion, fecha_actualizacion;
}
