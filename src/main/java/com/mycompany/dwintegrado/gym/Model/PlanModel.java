package com.mycompany.dwintegrado.gym.Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PlanModel {
    private int id_plan;
    private String nombre;
    private String descripcion;
    private int duration_dias;
    private BigDecimal precio;
    private String tipo;
    private String estado;

    public PlanModel(String nombre, String descripcion, int duration_dias,
                     BigDecimal precio, String tipo, String estado) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.duration_dias = duration_dias;
        this.precio = precio;
        this.tipo = tipo;
        this.estado = estado;
    }
}