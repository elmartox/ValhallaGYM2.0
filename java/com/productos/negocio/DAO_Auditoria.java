package com.productos.negocio;

import com.productos.datos.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.productos.negocio.Auditoria;


public class DAO_Auditoria {

    public List<Auditoria> listar() {
        List<Auditoria> lista = new ArrayList<>();

        String sql = "SELECT id_aud, tabla_aud, operacion_aud, valoranterior_aud, "
                   + "valornuevo_aud, fecha_aud, usuario_aud "
                   + "FROM auditoria.tb_auditoria "
                   + "ORDER BY id_aud DESC";

        try {
            // ✔ CORRECCIÓN: CREAR OBJETO DE CONEXIÓN
            Conexion cn = new Conexion();
            Connection con = cn.getConexion();

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Auditoria a = new Auditoria();
                a.setIdAud(rs.getInt("id_aud"));
                a.setTablaAud(rs.getString("tabla_aud"));
                a.setOperacionAud(rs.getString("operacion_aud"));
                a.setValorAnterior(rs.getString("valoranterior_aud"));
                a.setValorNuevo(rs.getString("valornuevo_aud"));
                a.setFecha(rs.getString("fecha_aud"));
                a.setUsuario(rs.getString("usuario_aud"));

                lista.add(a);
            }

            rs.close();
            ps.close();

        } catch (SQLException e) {
            System.out.println("❌ Error al listar Auditoría: " + e.getMessage());
        }

        return lista;
    }
}
