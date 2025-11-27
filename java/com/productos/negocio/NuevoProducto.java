package com.productos.negocio;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.productos.datos.Conexion;

public class NuevoProducto {

	public boolean registrarProducto(int idCat, String nombre, int cantidad, double precio, String foto) {
	    boolean ok = false;
	    Conexion con = new Conexion();
	    try {
	        String sql = "INSERT INTO tb_producto (id_cat, nombre_pr, cantidad_pr, precio_pr, foto_pr) VALUES (?, ?, ?, ?, ?)";
	        PreparedStatement ps = con.getConexion().prepareStatement(sql);
	        ps.setInt(1, idCat);
	        ps.setString(2, nombre);
	        ps.setInt(3, cantidad);
	        ps.setDouble(4, precio);

	        // 👇 Aquí forzamos a que se guarde NULL en bytea
	        ps.setNull(5, java.sql.Types.BINARY);

	        ok = ps.executeUpdate() > 0;
	        ps.close();
	    } catch (SQLException e) {
	        System.out.println("❌ Error al registrar producto: " + e.getMessage());
	    }
	    return ok;
	}

    public boolean actualizarProducto(int id, int idCat, String nombre, int cantidad, double precio, String foto) {
        boolean ok = false;
        Conexion con = new Conexion();
        try {
            String sql = "UPDATE tb_producto SET id_cat=?, nombre_pr=?, cantidad_pr=?, precio_pr=?, foto_pr=? WHERE id_pr=?";
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setInt(1, idCat);
            ps.setString(2, nombre);
            ps.setInt(3, cantidad);
            ps.setDouble(4, precio);
            ps.setInt(6, id);
            ps.setNull(5, java.sql.Types.BINARY);

	        ok = ps.executeUpdate() > 0;
	        ps.close();
        } catch (SQLException e) {
            System.out.println("❌ Error al actualizar producto: " + e.getMessage());
        }
        return ok;
    }

    public boolean eliminarProducto(int id) {
        boolean ok = false;
        Conexion con = new Conexion();
        try {
            String sql = "DELETE FROM tb_producto WHERE id_pr=?";
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setInt(1, id);
            ok = ps.executeUpdate() > 0;
            ps.close();
        } catch (SQLException e) {
            System.out.println("❌ Error al eliminar producto: " + e.getMessage());
        }
        return ok;
    }
    public List<Producto> listarProductos() {
        Conexion cn = new Conexion();
        List<Producto> lista = new ArrayList<>();
        String sql = "SELECT p.id_pr, p.id_cat, c.descripcion_cat, p.nombre_pr, p.cantidad_pr, p.precio_pr, p.foto_pr " +
                     "FROM tb_producto p INNER JOIN tb_categoria c ON p.id_cat = c.id_cat";
        try (Connection con = cn.getConexion(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt("id_pr"));
                p.setIdCategoria(rs.getInt("id_cat"));
                p.setNombre(rs.getString("nombre_pr"));
                p.setCantidad(rs.getInt("cantidad_pr"));
                p.setPrecio(rs.getDouble("precio_pr"));
                p.setFoto(rs.getString("foto_pr"));
                lista.add(p);
            }
        } catch (SQLException e) {
            System.out.println("❌ Error al listar productos: " + e.getMessage());
        }
        return lista;
    }
}
