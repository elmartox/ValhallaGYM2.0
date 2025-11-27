package com.productos.negocio;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.productos.datos.Conexion;

public class Servicios {
	private int Id;
    private String Nombre;
    private String Descripcion;
    private double Precio;


    // Registrar un nuevo servicio
    public boolean registrarServicio(String nombre, String descripcion, double precio) {
        boolean ok = false;
        Conexion con = new Conexion();
        try {
            String sql = "INSERT INTO tb_servicios (nombre_servicio, descripcion, precio) VALUES (?, ?, ?)";
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, descripcion);
            ps.setDouble(3, precio);

            ok = ps.executeUpdate() > 0;
            ps.close();
        } catch (SQLException e) {
            System.out.println("❌ Error al registrar servicio: " + e.getMessage());
        }
        return ok;
    }

    public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	public String getDescripcion() {
		return Descripcion;
	}

	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}

	public double getPrecio() {
		return Precio;
	}

	public void setPrecio(double precio) {
		Precio = precio;
	}

	
    public boolean actualizarServicio(int id, String nombre, String descripcion, double precio) {
        boolean ok = false;
        Conexion con = new Conexion();
        try {
            String sql = "UPDATE tb_servicios SET nombre_servicio=?, descripcion=?, precio=? WHERE id_servicio=?";
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, descripcion);
            ps.setDouble(3, precio);
            ps.setInt(4, id);

            ok = ps.executeUpdate() > 0;
            ps.close();
        } catch (SQLException e) {
            System.out.println("❌ Error al actualizar servicio: " + e.getMessage());
        }
        return ok;
    }


    public boolean eliminarServicio(int id) {
        boolean ok = false;
        Conexion con = new Conexion();
        try {
            String sql = "DELETE FROM tb_servicios WHERE id_servicio=?";
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setInt(1, id);

            ok = ps.executeUpdate() > 0;
            ps.close();
        } catch (SQLException e) {
            System.out.println("❌ Error al eliminar servicio: " + e.getMessage());
        }
        return ok;
    }

    
    public List<Servicios> listarServicios() {
        Conexion cn = new Conexion();
        List<Servicios> lista = new ArrayList<>();
        String sql = "SELECT * FROM tb_servicios ORDER BY id_servicio";
        try (Connection con = cn.getConexion(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Servicios s = new Servicios();
                s.setId(rs.getInt("id_servicio"));
                s.setNombre(rs.getString("nombre_servicio"));
                s.setDescripcion(rs.getString("descripcion"));
                s.setPrecio(rs.getDouble("precio"));
                lista.add(s);
            }
        } catch (SQLException e) {
            System.out.println("❌ Error al listar servicios: " + e.getMessage());
        }
        return lista;
    }
    
    
}

