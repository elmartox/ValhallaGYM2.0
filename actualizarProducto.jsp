<%@ page import="com.productos.negocio.NuevoProducto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("txtId"));
    int idCat = Integer.parseInt(request.getParameter("cmbCategoria"));
    String nombre = request.getParameter("txtNombre");
    int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
    double precio = Double.parseDouble(request.getParameter("txtPrecio"));
    String foto = request.getParameter("txtFoto");

    NuevoProducto obj = new NuevoProducto();
    boolean exito = obj.actualizarProducto(id, idCat, nombre, cantidad, precio, null);

    if (exito) {
        response.sendRedirect("AnadirProductos.jsp");
    } else {
        out.println("<h3 style='color:red;'>❌ Error al actualizar producto.</h3>");
    }
%>

