<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.productos.negocio.Servicios" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Servicios</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="styles/vendedor.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .container { margin-top: 40px; }
    </style>
</head>
<body>

<div class="container">
    <h2 class="mb-4 text-center">Gestión de Servicios</h2>


    <div class="card mb-4 shadow-sm">
        <div class="card-body">
            <form action="guardarServicioVendedor.jsp" method="post">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Nombre del Servicio</label>
                        <input type="text" name="nombre" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Precio</label>
                        <input type="number" step="0.01" name="precio" class="form-control" required>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Descripción</label>
                        <textarea name="descripcion" class="form-control" rows="2"></textarea>
                    </div>
                </div>

                <div class="btn-ok">
                <center>
                
                    <button type="submit" class="btn-ok">Registrar Servicio</button>
                    </center>
                </div>
            </form>
              <form action="index.jsp" method="get" style="margin:0;">
               <center> 
        <button type="submit" class="btn-logout">Cerrar Sesión</button>
        </center>
    </form>
        </div>
    </div>

  
    <div class="card shadow-sm">
        <div class="card-body">
            <h4 class="mb-3">Lista de Servicios</h4>
            <table class="table table-bordered table-hover text-center align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Servicios negocio = new Servicios();
                        List<Servicios> lista = negocio.listarServicios();

                        if (lista != null && !lista.isEmpty()) {
                            for (Servicios s : lista) {
                    %>
                        <tr>
                            <td><%= s.getId() %></td>
                            <td><%= s.getNombre() %></td>
                            <td><%= s.getDescripcion() %></td>
                            <td>$<%= s.getPrecio() %></td>
                            <td>
                            <a href="editarServicio.jsp?id=<%= s.getId() %>" class="btn-icon edit" title="Editar">
                                <i class="bi bi-pencil-square"></i>
                            </a>
                            <a href="eliminarServicio.jsp?id=<%= s.getId() %>" class="btn-icon delete" 
                               onclick="return confirm('¿Está seguro de eliminar este servicio?');" title="Eliminar">
                                <i class="bi bi-trash"></i>
                            </a>
                            </td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="5" class="text-center text-muted">No hay servicios registrados.</td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
