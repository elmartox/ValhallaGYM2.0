<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Nuevo Cliente - ValhallaGYM</title>
    <link rel="stylesheet" href="styles/style4.css">
</head>
<body>
<header>
    <h1>ValhallaGYM</h1>
    <nav>
        <a href="index.jsp">Inicio</a>
        <a href="Productos.jsp">Productos</a>
        <a href="Registro.jsp">Registro</a>
    </nav>
</header>

<main>
    <section class="registro-container">
        <h2>Datos del Nuevo Cliente</h2>

        <%
            String nombre = request.getParameter("txtNombre");
            String cedula = request.getParameter("txtCedula");
            String estado = request.getParameter("cmbEstado");
            String residencia = request.getParameter("rdResidencia");
            String foto = request.getParameter("fileFoto");
            String fecha = request.getParameter("mFecha");
            String color = request.getParameter("cColor");
            String email = request.getParameter("txtEmail");
            String clave = request.getParameter("txtClave");
        %>

        <p>El nombre del nuevo cliente es: <u><%= nombre %></u></p>
        <p>Su número de cédula es: <u><%= cedula %></u></p>
        <p>Estado civil: <u><%= estado %></u></p>
        <p>Reside en: <u><%= residencia %></u></p>
        <p>El archivo seleccionado para foto del perfil es: <u><%= foto %></u></p>
        <p>El año y mes de nacimiento son: <strong><%= fecha %></strong></p>
        <p><font color="<%= color %>">Este es tu color favorito</font></p>
        <p>Correo electrónico: <u><%= email %></u></p>
        <p>Clave: <u><%= clave %></u></p>

      <div style="text-align:center; margin-top:20px;">
    <form action="registrarCliente.jsp" method="post">
        <input type="hidden" name="txtNombre" value="<%= nombre %>">
        <input type="hidden" name="txtCedula" value="<%= cedula %>">
        <input type="hidden" name="cmbEstado" value="<%= estado %>">
        <input type="hidden" name="txtEmail" value="<%= email %>">
        <input type="hidden" name="txtClave" value="<%= clave %>">
        <button type="submit" class="btn-enviar">Guardar en base de datos</button>
    </form>
</div>
    </section>
</main>

<footer>
    <p>&copy; 2025 ValhallaGYM - Todos los derechos reservados</p>
</footer>
</body>
</html>

