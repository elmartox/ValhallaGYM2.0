<%@ page import="com.productos.negocio.NuevoUsuario" %>
<%@ page import="com.productos.seguridad.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro Cliente - ValhallaGYM</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    String nombre = request.getParameter("txtNombre");
    String correo = request.getParameter("txtEmail");
    String clave = request.getParameter("txtClave");
    String cedula = request.getParameter("txtCedula");
    String estadoStr = request.getParameter("cmbEstado");

    int idEstado = 0;

    if (estadoStr != null) {
        switch (estadoStr.toLowerCase()) {
            case "soltero": idEstado = 1; break;
            case "casado": idEstado = 2; break;
            case "divorciado": idEstado = 3; break;
            case "viudo": idEstado = 4; break;
            default: idEstado = 0; break;
        }
    } else {
        idEstado = 0; // Valor por defecto o podrías mostrar mensaje
        System.out.println("No se recibió el parámetro cmbEstado");
    }
    // Convertir el estado civil a ID según tu combo o lista
    switch (estadoStr.toLowerCase()) {
        case "soltero": idEstado = 1; break;
        case "casado": idEstado = 2; break;
        case "divorciado": idEstado = 3; break;
        case "viudo": idEstado = 4; break;
        case "unión libre": idEstado = 5; break;
        default: idEstado = 1; // valor por defecto
    }

    NuevoUsuario nuevo = new NuevoUsuario();
    boolean ok = nuevo.registrarUsuario(nombre, correo, clave, cedula, idEstado);

    if (ok) {
%>
    <h2>Registro exitoso</h2>
    <p>Redirigiendo al login...</p>
    <script>
        setTimeout(() => {
            window.location.href = 'login.jsp';
        }, 2000);
    </script>
<%
    } else {
%>
        <h2>❌ Error al registrar el usuario</h2>
        <p>Verifica los datos o intenta más tarde.</p>
        <a href="Registro.jsp">Volver</a>
<%
    }
%>
</body>
</html>
