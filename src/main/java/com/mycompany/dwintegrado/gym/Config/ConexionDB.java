package com.mycompany.dwintegrado.gym.Config;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/gym";
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String USER = "root";
    private static final String PASS = "Ale17";

    // Retorna siempre una conexión o lanza excepción
    public static Connection abrir() throws SQLException {
        try {
            Class.forName(DRIVER);
            Connection conn = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("Conexión exitosa a la BD");
            return conn;
        } catch (ClassNotFoundException e) {
            throw new SQLException(" Driver JDBC no encontrado", e);
        } catch (SQLException e) {
            throw new SQLException("Error al conectar a la BD", e);
        }
    }

    // Método seguro para cerrar
    public static void cerrar(Connection conn) {
        if (conn != null) {
            try {
                if (!conn.isClosed()) {
                    conn.close();
                    System.out.println("?Conexión cerrada");
                }
            } catch (SQLException e) {
                System.out.println(" Error al cerrar la conexión");
                e.printStackTrace();
            }
        }
    }
}

