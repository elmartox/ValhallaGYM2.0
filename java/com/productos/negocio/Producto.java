package com.productos.negocio;

import java.sql.*;
import java.util.*;
import com.productos.datos.Conexion;

public class Producto {
    private int id;
    private int idCategoria;
    private String nombre;
    private int cantidad;
    private double precio;
    private String foto;

    // --- CONSTRUCTOR ---
    public Producto() {}

    // --- GETTERS Y SETTERS ---
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getIdCategoria() { return idCategoria; }
    public void setIdCategoria(int idCategoria) { this.idCategoria = idCategoria; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }

    public double getPrecio() { return precio; }
    public void setPrecio(double precio) { this.precio = precio; }

    public String getFoto() { return foto; }
    public void setFoto(String foto) { this.foto = foto; }

    // ============================================================
    // MÉTODOS CRUD
    // ============================================================

    // ✅ Registrar producto
    public boolean registrarProducto() {
        Conexion cn = new Conexion();
        String sql = "INSERT INTO tb_producto (id_cat, nombre_pr, cantidad_pr, precio_pr, foto_pr) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = cn.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idCategoria);
            ps.setString(2, nombre);
            ps.setInt(3, cantidad);
            ps.setDouble(4, precio);
            ps.setString(5, foto);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("❌ Error al registrar producto: " + e.getMessage());
            return false;
        }
    }

    // ✅ Listar productos
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

    // ✅ Actualizar producto
    public boolean actualizarProducto() {
        Conexion cn = new Conexion();
        String sql = "UPDATE tb_producto SET id_cat=?, nombre_pr=?, cantidad_pr=?, precio_pr=?, foto_pr=? WHERE id_pr=?";
        try (Connection con = cn.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idCategoria);
            ps.setString(2, nombre);
            ps.setInt(3, cantidad);
            ps.setDouble(4, precio);
            ps.setString(5, foto);
            ps.setInt(6, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("❌ Error al actualizar producto: " + e.getMessage());
            return false;
        }
    }

    // ✅ Eliminar producto
    public boolean eliminarProducto(int id) {
        Conexion cn = new Conexion();
        String sql = "DELETE FROM tb_producto WHERE id_pr=?";
        try (Connection con = cn.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("❌ Error al eliminar producto: " + e.getMessage());
            return false;
        }
    }

    // ✅ Listar categorías (para el <select>)
    public List<String[]> listarCategorias() {
        Conexion cn = new Conexion();
        List<String[]> lista = new ArrayList<>();
        String sql = "SELECT id_cat, descripcion_cat FROM tb_categoria";
        try (Connection con = cn.getConexion(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                lista.add(new String[] {
                    String.valueOf(rs.getInt("id_cat")),
                    rs.getString("descripcion_cat")
                });
            }
        } catch (SQLException e) {
            System.out.println("❌ Error al listar categorías: " + e.getMessage());
        }
        return lista;
    }
}
