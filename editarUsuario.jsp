<%@ page import="java.sql.*, com.productos.datos.Conexion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String cedula = request.getParameter("cedula");
    String nombre = "", correo = "", estado = "";

    if (cedula != null) {
        Connection con = new Conexion().getConexion();
        PreparedStatement ps = con.prepareStatement("SELECT nombre_us, correo_us, id_estado FROM tb_usuario WHERE cedula=?");
        ps.setString(1, cedula);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            nombre = rs.getString("nombre_us");
            correo = rs.getString("correo_us");
            estado = rs.getString("id_estado");
        }
        rs.close(); ps.close(); con.close();
    }
%>
<head>
 <link rel="stylesheet" href="styles/styles5.css">
</head>
<h2 class="text-center">Editar Usuario</h2>
<form action="actualizarUsuario.jsp" method="post" class="container mt-4" style="max-width: 500px;">
    <input type="hidden" name="cedula" value="<%= cedula %>">
    <div class="mb-3">
        <label>Nombre:</label>
        <input type="text" name="nombre" value="<%= nombre %>" class="form-control" required>
    </div>
    <div class="mb-3">
        <label>Correo:</label>
        <input type="email" name="correo" value="<%= correo %>" class="form-control" required>
    </div>
    <div class="mb-3">
        <label>Estado civil:</label>
        <select name="estado" class="form-select" required>
            <option value="1" <%= estado.equals("1") ? "selected" : "" %>>Soltero</option>
            <option value="2" <%= estado.equals("2") ? "selected" : "" %>>Casado</option>
            <option value="3" <%= estado.equals("3") ? "selected" : "" %>>Divorciado</option>
            <option value="4" <%= estado.equals("4") ? "selected" : "" %>>Viudo</option>
        </select>
    </div>
    <button type="submit" class="btn btn-success">Guardar Cambios</button>
    <a href="usuarios.jsp" class="btn btn-secondary">Cancelar</a>
</form>
