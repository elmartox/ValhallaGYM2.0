<%@ page import="java.util.*, com.productos.negocio.NuevoUsuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Usuarios - ValhallaGYM</title>
     <link rel="stylesheet" href="styles/styles5.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body class="bg-light">

<div class="container mt-4">
    <h2 class="text-center mb-4">Lista de Usuarios Registrados</h2>

    <div class="table-responsive">
        <%
            NuevoUsuario usuario = new NuevoUsuario();
            List<String[]> lista = usuario.listarUsuarios(); // obtienes solo los socios
        %>

        <table class="table table-striped table-hover text-center mt-4">
            <thead class="table-dark">
                <tr>
                    <th>Nombre</th>
                    <th>Cédula</th>
                    <th>Correo</th>
                    <th>Estado Civil</th>
                    <th>Perfil</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (String[] datos : lista) {
                %>
                    <tr>
                        <td><%= datos[0] %></td>
                        <td><%= datos[1] %></td>
                        <td><%= datos[2] %></td>
                        <td><%= datos[3] %></td>
                        <td><%= datos[4] %></td>
                        <td>
                            <form action="editarUsuario.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="cedula" value="<%= datos[1] %>">
                                <button type="submit" class="btn btn-warning btn-sm">
                                    <i class="fas fa-edit"></i> Editar
                                </button>
                            </form>

                            <form action="eliminarUsuario.jsp" method="post" style="display:inline;"
                                  onsubmit="return confirm('¿Seguro que deseas eliminar este usuario?');">
                                <input type="hidden" name="cedula" value="<%= datos[1] %>">
                                <button type="submit" class="btn btn-danger btn-sm">
                                    <i class="fas fa-trash"></i> Eliminar
                                </button>
                            </form>
                        </td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <div class="text-center mt-3">
        <a href="index.jsp" class="btn btn-secondary">Volver al inicio</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

