<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"
    import="com.productos.seguridad.*" %>

<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("usuario") == null) {
%>
        <jsp:forward page="login.jsp">
            <jsp:param name="error" value="Debe iniciar sesión para acceder."/>
        </jsp:forward>
<%
    } else {
        String usuario = (String) sesion.getAttribute("usuario");
        int perfil = (Integer) sesion.getAttribute("perfil");
        String horaAcceso = (String) sesion.getAttribute("horaAcceso");

        Pagina pag = new Pagina();
        String menu = pag.mostrarMenu(perfil);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Menú - Valhalla Gym</title>
     <link rel="stylesheet" href="styles/styles5.css">
</head>
<body>
    <div align="center">
        <h1>Valhalla Gym - Área Privada</h1>
        <h3>Bienvenido, <%= usuario %></h3>
        <p><b>Hora de acceso:</b> <%= horaAcceso %></p>

        <hr>
        <h4>Menú disponible:</h4>
        <%= menu %>

        <hr>
        <form action="cerrarSesion.jsp" method="post">
            <input type="submit" value="Cerrar Sesión">
        </form>
    </div>
</body>
</html>

<% } %>
