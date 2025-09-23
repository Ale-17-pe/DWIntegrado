/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dwintegrado.gym.Model;

import lombok.*;

@Data
@Setter @Getter
@NoArgsConstructor @AllArgsConstructor
public class RecepcionistaModel {
    private int id_recepcionista, id_usuario;
    public String nombre, apellido, telefono;
}
