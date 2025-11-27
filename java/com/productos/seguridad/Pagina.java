package com.productos.seguridad;


import java.sql.*;

import com.productos.datos.Conexion;

public class Pagina {
    public String mostrarMenu(int perfil) {
        StringBuilder menu = new StringBuilder();
        String sql = "SELECT * FROM tb_pagina pag "
                   + "JOIN tb_perfilpagina pper ON pag.id_pag = pper.id_pag "
                   + "WHERE pper.id_per = ?";

        try {
            Conexion con = new Conexion();
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setInt(1, perfil);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                menu.append("<a href='")
                    .append(rs.getString("url_pag"))
                    .append("'>")
                    .append(rs.getString("nombre_pag"))
                    .append("</a> | ");
            }
        } catch (SQLException e) {
            System.out.println("Error generando menú: " + e.getMessage());
        }

        return menu.toString();
    }
}
