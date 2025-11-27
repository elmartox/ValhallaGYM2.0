<%@ page import="com.productos.negocio.NuevoProducto" %>
<%@ page import="com.productos.negocio.Producto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    // --- Parámetros del formulario ---
    String nombre = request.getParameter("nombre"); // campo text
    String categoriaParam = request.getParameter("cmbCategoria"); // puede venir id o nombre
    String cantidadStr = request.getParameter("cantidad");
    String precioStr = request.getParameter("precio");

    // --- Validaciones básicas ---
    if (nombre == null || nombre.trim().isEmpty()) {
        out.println("<h3 style='color:red;'>Ingrese el nombre del producto.</h3>");
        out.println("<a href='AnadirProductos.jsp'>Volver</a>");
        return;
    }

    // --- Resolver idCategoria: primero intentamos parsear como int (valor ideal) ---
    int idCat = 0;
    if (categoriaParam != null) {
        try {
            idCat = Integer.parseInt(categoriaParam); // si el <select> envía el id directamente
        } catch (NumberFormatException nfe) {
            // si no es id, mapeamos por nombre (asegúrate coincidencia exacta)
            String catLower = categoriaParam.trim().toLowerCase();
            switch (catLower) {
                case "accesorios de entrenamiento": idCat = 1; break;
                case "ropa deportiva":                 idCat = 2; break;
                case "suplementos":                    idCat = 3; break;
                case "equipo de gimnasio":             idCat = 4; break;
                case "calzado deportivo":              idCat = 5; break;
                case "accesorios hidratación":         idCat = 6; break;
                default: idCat = 1; /* valor por defecto */ break;
            }
        }
    } else {
        out.println("<h3 style='color:red;'>Seleccione una categoría.</h3>");
        out.println("<a href='AnadirProductos.jsp'>Volver</a>");
        return;
    }

    // --- Parsear cantidad y precio con seguridad ---
    int cantidad = 0;
    double precio = 0.0;
    try {
        cantidad = (cantidadStr != null && !cantidadStr.trim().isEmpty()) ? Integer.parseInt(cantidadStr) : 0;
    } catch (NumberFormatException e) {
        out.println("<h3 style='color:red;'>Cantidad inválida.</h3>");
        out.println("<a href='AnadirProductos.jsp'>Volver</a>");
        return;
    }
    try {
        precio = (precioStr != null && !precioStr.trim().isEmpty()) ? Double.parseDouble(precioStr) : 0.0;
    } catch (NumberFormatException e) {
        out.println("<h3 style='color:red;'>Precio inválido.</h3>");
        out.println("<a href='AnadirProductos.jsp'>Volver</a>");
        return;
    }




NuevoProducto nuevo = new NuevoProducto();
boolean ok = nuevo.registrarProducto(idCat, nombre, cantidad, precio, null);


    if (ok) {
        // Registro correcto -> redirigir a la página principal de productos
        response.sendRedirect("AnadirProductos.jsp");
    } else {
        out.println("<h3 style='color:red;'>❌ Error al registrar el producto. Ver logs del servidor.</h3>");
        out.println("<a href='AnadirProductos.jsp'>Volver</a>");
    }
%>
