package com.mycompany.dwintegrado.gym.Model;

import lombok.*;

import java.time.LocalDateTime;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ContenidoModel {
    private int id_contenido;
    private String titulo;
    private String descripcion;
    private String tipo;
    private String contenido;
    private String estado;
    private LocalDateTime fecha_creacion;
    private int id_usuario_creador;
    private boolean destacado; // Para mostrar si es destacado
    private int vistas;         // Para mostrar el número de vistas
    private String crearNombre;
}
