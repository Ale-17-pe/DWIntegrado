/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.dwintegrado.gym.Model;

import lombok.*;

import java.time.LocalDateTime;

@Data
@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
public class MembresiaModel {
    private int id_menbresia,id_cliente,id_plan;
    private java.sql.Date fecha_inicio_plan,fecha_,precio_pagado;
    private String estado,metodo_pago;
    private int id_registro_usuario;
    private LocalDateTime fecha_creacion;
    
}
