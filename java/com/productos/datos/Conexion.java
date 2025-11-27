package com.productos.datos;

import java.sql.*;

public class Conexion {
    private Statement St; 
    private String driver;
    private String user;
    private String pwd;
    private String cadena;
    private Connection con;

 
    String getDriver() { return this.driver; }
    String getUser() { return this.user; }
    String getPwd() { return this.pwd; }
    String getCadena() { return this.cadena; }
    public Connection getConexion() { return this.con; }

    //Constructor 
    public Conexion() {
        this.driver = "org.postgresql.Driver";
        this.user = "alumno";
        this.pwd = "alumno";
        this.cadena = "jdbc:postgresql://172.17.42.121:5432/bd_gym";
        this.con = this.crearConexion();
    }

    //Crear conexión
    Connection crearConexion() {
        try {
            Class.forName(driver);
            Connection con = DriverManager.getConnection(cadena, user, pwd);
            System.out.println("Conexión exitosa a la base de datos");
            return con;
        } catch (ClassNotFoundException e) {
            System.out.println("No se encontró el driver PostgreSQL: " + e.getMessage());
            return null;
        } catch (SQLException e) {
            System.out.println("Error al conectar con la base de datos: " + e.getMessage());
            return null;
        } catch (Exception ee) {
            System.out.println("Error inesperado: " + ee.getMessage());
            return null;
        }
    }

    //sentencias INSERT, UPDATE o DELETE 
    public String Ejecutar(String sql) {
        String result = "";
        Statement st = null;
        try {
            st = getConexion().createStatement();
            int filas = st.executeUpdate(sql);
            if (filas > 0) {
                result = "Operación realizada con éxito";
            } else {
                result = "No se afectó ninguna fila";
            }
        } catch (SQLException ex) {
            result = "Error SQL: " + ex.getMessage();
        } catch (Exception ex) {
            result = "Error general: " + ex.getMessage();
        } finally {
            try {
                if (st != null) st.close();
            } catch (SQLException e) {
                System.out.println("⚠️ No se pudo cerrar el Statement: " + e.getMessage());
            }
        }
        return result;
    }

    //consultas
    public ResultSet Consulta(String sql) {
        ResultSet reg = null;
        try {
            St = getConexion().createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY
            );
            reg = St.executeQuery(sql);
        } catch (SQLException ee) {
            System.out.println("❌ Error en la consulta: " + ee.getMessage());
        } catch (Exception ee) {
            System.out.println("❌ Error inesperado: " + ee.getMessage());
        }
        return reg;
    }
}
