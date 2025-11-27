<%@ page import="com.productos.negocio.NuevoUsuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String cedula = request.getParameter("cedula");
    if (cedula != null && !cedula.isEmpty()) {
        NuevoUsuario obj = new NuevoUsuario();
        boolean exito = obj.eliminarUsuario(cedula);
        if (exito) {
            response.sendRedirect("usuarios.jsp");
        } else {
            out.println("<h3 style='color:red;'>❌ No se pudo eliminar el usuario.</h3>");
        }
    } else {
        out.println("<h3 style='color:red;'>⚠ No se recibió una cédula válida.</h3>");
    }
%>
