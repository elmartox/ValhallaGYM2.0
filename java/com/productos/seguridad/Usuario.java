package com.productos.seguridad;

import java.sql.*;
import com.productos.datos.Conexion;

public class Usuario {
    private String correo;
    private String clave;
    private int perfil;
    private String nombre;
    private String cedula;
    private int idEstado;

    // ===== Getters y Setters =====
    public String getCorreo() { return correo; }
    public void setCorreo(String correo) { this.correo = correo; }

    public String getClave() { return clave; }
    public void setClave(String clave) { this.clave = clave; }

    public int getPerfil() { return perfil; }
    public void setPerfil(int perfil) { this.perfil = perfil; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getCedula() { return cedula; }
    public void setCedula(String cedula) { this.cedula = cedula; }

    public int getIdEstado() { return idEstado; }
    public void setIdEstado(int idEstado) { this.idEstado = idEstado; }

    // ===== Método para verificar usuario (login) =====
    public boolean verificarUsuario(String ncorreo, String nclave) {
        boolean respuesta = false;
        String sql = "SELECT * FROM tb_usuario WHERE correo_us = ? AND clave_us = ?";

        try {
            Conexion clsCon = new Conexion();
            Connection con = clsCon.getConexion();

            if (con != null) {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, ncorreo);
                ps.setString(2, nclave);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    respuesta = true;
                    this.setCorreo(rs.getString("correo_us"));
                    this.setClave(rs.getString("clave_us"));
                    this.setPerfil(rs.getInt("id_per"));
                    this.setNombre(rs.getString("nombre_us"));
                    this.setCedula(rs.getString("cedula"));
                    this.setIdEstado(rs.getInt("id_estado"));
                }

                rs.close();
                ps.close();
                con.close();
            } else {
                System.out.println("⚠ No se pudo conectar a la base de datos.");
            }

        } catch (Exception ex) {
            System.out.println("❌ Error verificarUsuario: " + ex.getMessage());
        }

        return respuesta;
    }
}
