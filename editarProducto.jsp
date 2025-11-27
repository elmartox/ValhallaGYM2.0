<%@ page import="java.sql.*, com.productos.datos.Conexion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Obtenemos el ID del producto desde la URL
    String idParam = request.getParameter("id");
    int id = 0;
    String nombre = "", foto = "";
    int idCategoria = 0, cantidad = 0;
    double precio = 0.0;

    if (idParam != null) {
        id = Integer.parseInt(idParam);

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = new Conexion().getConexion();
            ps = con.prepareStatement("SELECT id_cat, nombre_pr, cantidad_pr, precio_pr, foto_pr FROM tb_producto WHERE id_pr=?");
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                idCategoria = rs.getInt("id_cat");
                nombre = rs.getString("nombre_pr");
                cantidad = rs.getInt("cantidad_pr");
                precio = rs.getDouble("precio_pr");
            }
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error al obtener datos del producto: " + e.getMessage() + "</h3>");
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    }
%>

<head>
    <link rel="stylesheet" href="styles/styles5.css">
    <title>Editar Producto</title>
</head>

<h2 class="text-center">Editar Producto</h2>

<form action="actualizarProducto.jsp" method="post" class="container mt-4" style="max-width: 500px;">
    <input type="hidden" name="txtId" value="<%= id %>">

    <div class="mb-3">
        <label>Nombre:</label>
        <input type="text" name="txtNombre" value="<%= nombre %>" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Categoría:</label>
        <select name="cmbCategoria" class="form-select" required>
            <option value="1" <%= idCategoria == 1 ? "selected" : "" %>>Accesorios de Entrenamiento</option>
            <option value="2" <%= idCategoria == 2 ? "selected" : "" %>>Ropa Deportiva</option>
            <option value="3" <%= idCategoria == 3 ? "selected" : "" %>>Suplementos</option>
            <option value="4" <%= idCategoria == 4 ? "selected" : "" %>>Equipo de Gimnasio</option>
            <option value="5" <%= idCategoria == 5 ? "selected" : "" %>>Calzado Deportivo</option>
            <option value="6" <%= idCategoria == 6 ? "selected" : "" %>>Accesorios Hidratación</option>
        </select>
    </div>

    <div class="mb-3">
        <label>Cantidad:</label>
        <input type="number" name="txtCantidad" value="<%= cantidad %>" class="form-control" min="1" required>
    </div>

    <div class="mb-3">
        <label>Precio:</label>
        <input type="number" step="0.01" name="txtPrecio" value="<%= precio %>" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Foto:</label>
        <input type="text" name="txtFoto" value="<%= foto %>" class="form-control">
    </div>

    <button type="submit" class="btn btn-success">Guardar Cambios</button>
    <a href="AnadirProductos.jsp" class="btn btn-secondary">Cancelar</a>
</form>



