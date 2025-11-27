<%@ page import="com.productos.negocio.Servicios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    int id = 0;
    String nombre = "", descripcion = "";
    double precio = 0.0;

    try {
        id = Integer.parseInt(request.getParameter("txtId"));
        nombre = request.getParameter("txtNombre");
        descripcion = request.getParameter("txtDescripcion");
        precio = Double.parseDouble(request.getParameter("txtPrecio"));
    } catch (Exception e) {
        out.println("<h3 style='color:red;'>Datos inválidos: " + e.getMessage() + "</h3>");
        out.println("<a href='gestionVendedor.jsp'>Volver</a>");
        return;
    }


    Servicios servicioNegocio = new Servicios();
    boolean exito = servicioNegocio.actualizarServicio(id, nombre, descripcion, precio);

    if (exito) {
      
        response.sendRedirect("gestionVendedor.jsp");
    } else {
        out.println("<h3 style='color:red;'> Error al actualizar el servicio.</h3>");
        out.println("<a href='gestionVendedor.jsp'>Volver</a>");
    }
%>
