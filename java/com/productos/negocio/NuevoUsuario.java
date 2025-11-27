package com.productos.negocio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.productos.datos.Conexion;

public class NuevoUsuario {

    public boolean registrarUsuario(String nombre, String correo, String clave, String cedula, int idEstado) {
        boolean registrado = false;

        String sql = "INSERT INTO tb_usuario (nombre_us, correo_us, clave_us, cedula, id_estado, id_per) " +
                     "VALUES (?, ?, ?, ?, ?, 3)"; // Perfil 3 = Socio (por ejemplo)

        try {
            Conexion clsCon = new Conexion();
            Connection con = clsCon.getConexion();

            if (con != null) {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, nombre);
                ps.setString(2, correo);
                ps.setString(3, clave);
                ps.setString(4, cedula);
                ps.setInt(5, idEstado);

                int filas = ps.executeUpdate();
                registrado = (filas > 0);

                ps.close();
                con.close();
            } else {
                System.out.println("⚠ No se pudo obtener conexión a la BD");
            }

        } catch (Exception e) {
            System.out.println("❌ Error registrando usuario: " + e.getMessage());
        }

        return registrado;
    }
    
    
    public List<String[]> listarUsuarios() {
        List<String[]> lista = new ArrayList<>();
        // Usamos aliases claros: estado_desc y perfil_name
        String sql = "SELECT u.nombre_us, u.cedula, u.correo_us, e.descripcion AS estado_desc, p.nombre_per AS perfil_name "
                   + "FROM tb_usuario u "
                   + "LEFT JOIN tb_estado e ON u.id_estado = e.id_estado "
                   + "LEFT JOIN tb_perfil p ON u.id_per = p.id_per "
                   + "WHERE u.id_per = 2 "
                   + "ORDER BY u.nombre_us";

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Conexion clsCon = new Conexion();
            con = clsCon.getConexion();

            if (con == null) {
                System.out.println("⚠ No hay conexión al listar usuarios.");
                return lista;
            }

            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String[] datos = new String[5];
                datos[0] = rs.getString("nombre_us");
                datos[1] = rs.getString("cedula");
                datos[2] = rs.getString("correo_us");
                // usamos exactamente los alias definidos: estado_desc y perfil_name
                datos[3] = rs.getString("estado_desc") != null ? rs.getString("estado_desc") : "";
                datos[4] = rs.getString("perfil_name") != null ? rs.getString("perfil_name") : "";
                lista.add(datos);
            }

        } catch (SQLException e) {
            System.out.println("❌ Error al listar usuarios: " + e.getMessage());
            System.out.println("SQLState: " + e.getSQLState() + " ErrorCode: " + e.getErrorCode());
        } catch (Exception e) {
            System.out.println("❌ Error inesperado al listar usuarios: " + e.getMessage());
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ex) {}
            try { if (ps != null) ps.close(); } catch (Exception ex) {}
            try { if (con != null) con.close(); } catch (Exception ex) {}
        }

        return lista;
    }
    
    public boolean eliminarUsuario(String cedula) {
        String sql = "DELETE FROM tb_usuario WHERE cedula = ?";
        try (Connection con = new Conexion().getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, cedula);
            int filas = ps.executeUpdate();
            return filas > 0;

        } catch (SQLException e) {
            System.out.println("❌ Error al eliminar usuario: " + e.getMessage());
            return false;
        }
    }
    
    public boolean actualizarUsuario(String cedula, String nombre, String correo, int idEstado) {
        String sql = "UPDATE tb_usuario SET nombre_us=?, correo_us=?, id_estado=? WHERE cedula=?";
        try (Connection con = new Conexion().getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, nombre);
            ps.setString(2, correo);
            ps.setInt(3, idEstado);
            ps.setString(4, cedula);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("❌ Error al actualizar usuario: " + e.getMessage());
            return false;
        }
    }
    public boolean registrarPersonal(String nombre, String correo, String clave, String cedula, int idEstado, int idPerfil) {
        boolean registrado = false;

        String sql = "INSERT INTO tb_usuario (nombre_us, correo_us, clave_us, cedula, id_estado, id_per) " +
                     "VALUES (?, ?, ?, ?, ?, ?)"; // Perfil viene del parámetro

        try {
            Conexion clsCon = new Conexion();
            Connection con = clsCon.getConexion();

            if (con != null) {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, nombre);
                ps.setString(2, correo);
                ps.setString(3, clave);
                ps.setString(4, cedula);
                ps.setInt(5, idEstado);
                ps.setInt(6, idPerfil);

                int filas = ps.executeUpdate();
                registrado = (filas > 0);

                ps.close();
                con.close();
            } else {
                System.out.println("⚠ No se pudo obtener conexión a la BD");
            }

        } catch (Exception e) {
            System.out.println("❌ Error registrando personal: " + e.getMessage());
        }

        return registrado;
    }


}
