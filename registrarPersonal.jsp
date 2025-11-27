<%@ page import="com.productos.negocio.NuevoUsuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro Personal - ValhallaGYM</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    String nombre = request.getParameter("txtNombre");
    String correo = request.getParameter("txtCorreo");
    String clave = request.getParameter("txtClave");
    String cedula = request.getParameter("txtCedula");
    String estadoStr = request.getParameter("cmbEstado");
    String perfilStr = request.getParameter("cmbPerfil");

    int idEstado = 1; // por defecto
    int idPerfil = 2; // por defecto entrenadores

    // Convertir estado civil a id_estado
    if (estadoStr != null) {
        switch(estadoStr.toLowerCase()) {
            case "soltero": idEstado = 1; break;
            case "casado": idEstado = 2; break;
            case "divorciado": idEstado = 3; break;
            case "viudo": idEstado = 4; break;
            case "unión libre": idEstado = 5; break;
        }
    }

    // Convertir tipo de perfil a id_perfil
    if (perfilStr != null) {
        if(perfilStr.equalsIgnoreCase("Administrador")) idPerfil = 1;
        else if(perfilStr.equalsIgnoreCase("Entrenador")) idPerfil = 2;
    }

    NuevoUsuario nuevo = new NuevoUsuario();
    boolean ok = nuevo.registrarPersonal(nombre, correo, clave, cedula, idEstado, idPerfil);

    if(ok){
%>
    <h2>Registro exitoso</h2>
    <p>Redirigiendo al login...</p>
    <script>
        setTimeout(()=>{ window.location.href = 'login.jsp'; }, 2000);
    </script>
<%
    } else {
%>
    <h2>❌ Error al registrar el personal</h2>
    <p>Verifica los datos o intenta más tarde.</p>
    <a href="registroPersonal.jsp">Volver</a>
<%
    }
%>
</body>
</html>
