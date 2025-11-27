<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.productos.negocio.Auditoria"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Bitácora del Sistema - ValhallaGYM</title>
    <link rel="stylesheet" href="styles/bitacora.css">
    
</head>

<body>

<div class="container">
    <h1>📜 Bitácora de Auditoría</h1>

    <a href="index.jsp" class="btn-salir">Cerrar sesión</a>
    <a href="listarBitacora.jsp">Ver Bitácora</a>

    <table class="tabla-auditoria">
        <thead>
        <tr>
            <th>ID</th>
            <th>Tabla</th>
            <th>Operación</th>
            <th>Valor Anterior</th>
            <th>Valor Nuevo</th>
            <th>Fecha</th>
            <th>Usuario</th>
        </tr>
        </thead>

        <tbody>
        <%
            List<Auditoria> lista = (List<Auditoria>) request.getAttribute("listaAuditoria");
            if (lista != null) {
                for (Auditoria a : lista) {
        %>
        <tr>
            <td><%=a.getIdAud()%></td>
            <td><%=a.getTablaAud()%></td>
            <td><%=a.getOperacionAud()%></td>
            <td><pre><%=a.getValorAnterior()%></pre></td>
            <td><pre><%=a.getValorNuevo()%></pre></td>
            <td><%=a.getFecha()%></td>
            <td><%=a.getUsuario()%></td>
        </tr>
        <% } } %>
        </tbody>
    </table>
</div>

</body>
</html>
