<%@ page import="com.productos.negocio.NuevoProducto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    NuevoProducto obj = new NuevoProducto();
    boolean exito = obj.eliminarProducto(id);

    if (exito) {
        response.sendRedirect("AnadirProductos.jsp");
    } else {
        out.println("<h3 style='color:red;'>❌ Error al eliminar producto.</h3>");
    }
%>
