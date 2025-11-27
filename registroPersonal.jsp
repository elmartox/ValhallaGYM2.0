<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Registro de Personal - ValhallaGYM</title>
    <link rel="stylesheet" href="styles/style6.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
<header>
    <nav>
        <a href="index.jsp"><i class="fas fa-home"></i> Inicio</a>
        <a href="Productos.jsp"><i class="fas fa-box-open"></i> Productos</a>
        <a href="Servicios.jsp"><i class="fas fa-dumbbell"></i> Servicios</a>
        <a href="Contacto.jsp"><i class="fas fa-envelope"></i> Contacto</a>
    </nav>
</header>

<main>
    <section class="registro-container">
        <h2>Registro de Personal</h2>

        <form action="registrarPersonal.jsp" method="post" class="container mt-4" style="max-width: 500px;">
            <table>
                <tr>
                    <td><label for="nombre">Nombre:</label></td>
                    <td><input type="text" id="nombre" name="txtNombre" required></td>
                </tr>
                <tr>
                    <td><label for="cedula">Cédula:</label></td>
                    <td><input type="text" id="cedula" name="txtCedula" maxlength="10" required></td>
                </tr>
                <tr>
                    <td><label for="correo">Correo:</label></td>
                    <td><input type="email" id="correo" name="txtCorreo" required></td>
                </tr>
                <tr>
                    <td><label for="estado">Estado civil:</label></td>
                    <td>
                        <select id="estado" name="cmbEstado" required>
                            <option value="">Seleccione...</option>
                            <option value="Soltero">Soltero</option>
                            <option value="Casado">Casado</option>
                            <option value="Divorciado">Divorciado</option>
                            <option value="Viudo">Viudo</option>
                            <option value="Unión libre">Unión libre</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="perfil">Tipo de perfil:</label></td>
                    <td>
                        <select id="perfil" name="cmbPerfil" required>
                            <option value="">Seleccione...</option>
                            <option value="Administrador">Administrador</option>
                            <option value="Entrenador">Entrenador</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="clave">Contraseña:</label></td>
                    <td><input type="password" id="clave" name="txtClave" required></td>
                </tr>
            
            </table>
              <div style="display: flex; justify-content: center; gap: 15px; margin-top: 15px;">
    <button type="submit" class="btn-personal">Registrar</button>
    <button type="reset" class="btn-personal">Limpiar</button>
</div>
        </form>
    </section>
</main>

<footer>
    <center><p>&copy; 2025 ValhallaGYM - Todos los derechos reservados</p></center>
</footer>
</body>
</html>
