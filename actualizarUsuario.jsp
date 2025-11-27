<%@ page import="com.productos.negocio.NuevoUsuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String cedula = request.getParameter("cedula");
    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("correo");
    String estado = request.getParameter("estado");

    NuevoUsuario obj = new NuevoUsuario();
    boolean exito = obj.actualizarUsuario(cedula, nombre, correo, Integer.parseInt(estado));

    if (exito) {
        response.sendRedirect("usuarios.jsp");
    } else {
        out.println("<h3 style='color:red;'>❌ Error al actualizar usuario.</h3>");
    }
%>
