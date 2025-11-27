<%@ page import="java.sql.*, com.productos.datos.Conexion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
   
    String idParam = request.getParameter("id");
    int id = 0;
    String nombre = "", descripcion = "";
    double precio = 0.0;

    if (idParam != null) {
        id = Integer.parseInt(idParam);

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = new Conexion().getConexion();
            ps = con.prepareStatement("SELECT nombre_servicio, descripcion, precio FROM tb_servicios WHERE id_servicio=?");
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                nombre = rs.getString("nombre_servicio");
                descripcion = rs.getString("descripcion");
                precio = rs.getDouble("precio");
            }
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error al obtener datos del servicio: " + e.getMessage() + "</h3>");
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    }
%>

<head>
    <link rel="stylesheet" href="styles/styles5.css">
    <title>Editar Servicio</title>
</head>

<h2 class="text-center">Editar Servicio</h2>

<form action="actualizarServicio.jsp" method="post" class="container mt-4" style="max-width: 500px;">
    <input type="hidden" name="txtId" value="<%= id %>">

    <div class="mb-3">
        <label>Nombre del Servicio:</label>
        <input type="text" name="txtNombre" value="<%= nombre %>" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Descripción:</label>
        <textarea name="txtDescripcion" class="form-control" rows="3"><%= descripcion %></textarea>
    </div>

    <div class="mb-3">
        <label>Precio:</label>
        <input type="number" step="0.01" name="txtPrecio" value="<%= precio %>" class="form-control" required>
    </div>

    <button type="submit" class="btn btn-success">Guardar Cambios</button>
    <a href="gestionVendedor.jsp" class="btn btn-secondary">Cancelar</a>
</form>
