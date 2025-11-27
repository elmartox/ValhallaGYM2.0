<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
<link rel="stylesheet" href="styles/styles5.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Login - Valhalla Gym</title>
</head>
<body>
    <div align="center">
        <h2>Ingreso al Sistema - Valhalla Gym</h2>

        <% if (request.getParameter("error") != null) { %>
            <p style="color:red;"><%= request.getParameter("error") %></p>
        <% } %>

        <form action="validarLogin.jsp" method="post">
            <table>
                <tr>
                    <td>Correo:</td>
                    <td><input type="text" name="usuario" required></td>
                </tr>
                <tr>
                    <td>Clave:</td>
                    <td><input type="password" name="clave" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Ingresar">
                        <input type="reset" value="Limpiar">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
