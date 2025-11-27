<%@ page import="com.productos.negocio.Servicios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");


    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    String precioStr = request.getParameter("precio");

   
    if (nombre == null || nombre.trim().isEmpty()) {
        out.println("<h3 style='color:red;'>Ingrese el nombre del servicio.</h3>");
        out.println("<a href='gestionVendedor.jsp'>Volver</a>");
        return;
    }

    double precio = 0.0;
    try {
        precio = (precioStr != null && !precioStr.trim().isEmpty()) ? Double.parseDouble(precioStr) : 0.0;
    } catch (NumberFormatException e) {
        out.println("<h3 style='color:red;'>Precio inválido.</h3>");
        out.println("<a href='gestionVendedor.jsp'>Volver</a>");
        return;
    }


    Servicios servicioNegocio = new Servicios();
    boolean ok = servicioNegocio.registrarServicio(nombre, descripcion, precio);

    if (ok) {
       
        response.sendRedirect("gestionVendedor.jsp");
    } else {
        out.println("<h3 style='color:red;'>Error al registrar el servicio. Ver logs del servidor.</h3>");
        out.println("<a href='gestionVendedor.jsp'>Volver</a>");
    }
%>
