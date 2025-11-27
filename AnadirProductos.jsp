<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.productos.negocio.Producto, com.productos.negocio.NuevoProducto" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Productos</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="styles/new.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <h2 class="mb-4 text-center">Gestión de Productos</h2>

    <!-- ===== FORMULARIO PARA AÑADIR PRODUCTO ===== -->
    <div class="card mb-4 shadow-sm">
        <div class="card-body">
<form action="registrarProducto.jsp" method="post">
    <div class="row g-3">
        <div class="col-md-6">
            <label class="form-label">Nombre del Producto</label>
            <input type="text" name="nombre" class="form-control" required>
        </div>
        <div class="col-md-3">
            <label class="form-label">Cantidad</label>
            <input type="number" name="cantidad" class="form-control" min="1" required>
        </div>
        <div class="col-md-3">
            <label class="form-label">Precio</label>
            <input type="number" step="0.01" name="precio" class="form-control" required>
        </div>
        <div class="col-md-6">
            <label class="form-label">Categoría</label>
            <select name="cmbCategoria" class="form-select" required>
                <option value="">Seleccione una categoría</option>
                <option value="1">Accesorios de Entrenamiento</option>
                <option value="2">Ropa Deportiva</option>
                <option value="3">Suplementos</option>
                <option value="4">Equipo de Gimnasio</option>
                <option value="5">Calzado Deportivo</option>
                <option value="6">Accesorios Hidratación</option>
            </select>
        </div>
    </div>

    <div class="mt-4 text-center">
        <button type="submit" class=" btn-ok">Registrar Producto</button>
    </div>
    
                                <form action="index.jsp" method="get" style="margin:0;">
               <center> 
        <button type="submit" class="btn-logout">Cerrar Sesión</button>
        </center>
    </form>
</form>
        </div>
    </div>

    <!-- ===== LISTA DE PRODUCTOS ===== -->
    <div class="card shadow-sm">
        <div class="card-body">
            <h4 class="mb-3">Lista de Productos</h4>
            <table class="table table-bordered table-hover text-center align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Categoría</th>
                        <th>Nombre</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th>Foto</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        NuevoProducto negocio = new NuevoProducto();
                        List<Producto> lista = negocio.listarProductos();

                        if (lista != null && !lista.isEmpty()) {
                            for (Producto p : lista) {
                    %>
                        <tr>
                            <td><%= p.getId() %></td>
                            <td><%= p.getIdCategoria() %></td> <!-- Aquí podrías mostrar la descripción -->
                            <td><%= p.getNombre() %></td>
                            <td><%= p.getCantidad() %></td>
                            <td>$<%= p.getPrecio() %></td>
                            <td>
                                <% if (p.getFoto() != null && !p.getFoto().isEmpty()) { %>
                                    <img src="imagenes/<%= p.getFoto() %>" alt="Foto Producto">
                                <% } else { %>
                                    <span class="text-muted">Sin imagen</span>
                                <% } %>
                            </td>
                            <td>
                                <a href="editarProducto.jsp?id=<%= p.getId() %>" class="btn btn-warning btn-sm">
                                <i class="bi bi-pencil-square"></i>
                                </a>
                                 
                                <a href="eliminarProducto.jsp?id=<%= p.getId() %>" class="btn btn-danger btn-sm"
                                   onclick="return confirm('¿Está seguro de eliminar este producto?');">
                                    <i class="bi bi-trash"></i>
                                   </a>
                            </td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="7" class="text-center text-muted">No hay productos registrados.</td>
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
