<%@ page import="com.productos.negocio.Servicios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  
    String idParam = request.getParameter("id");

    if (idParam != null && !idParam.isEmpty()) {
        try {
            int id = Integer.parseInt(idParam);

            Servicios servicioNegocio = new Servicios();
            boolean exito = servicioNegocio.eliminarServicio(id);

            if (exito) {
            
                response.sendRedirect("gestionVendedor.jsp");
            } else {
                out.println("<h3 style='color:red;'>❌ No se pudo eliminar el servicio.</h3>");
                out.println("<a href='gestionVendedor.jsp'>Volver</a>");
            }
        } catch (NumberFormatException e) {
            out.println("<h3 style='color:red;'>⚠ ID inválido.</h3>");
            out.println("<a href='gestionVendedor.jsp'>Volver</a>");
        }
    } else {
        out.println("<h3 style='color:red;'>⚠ No se recibió un ID válido.</h3>");
        out.println("<a href='gestionVendedor.jsp'>Volver</a>");
    }
%>
