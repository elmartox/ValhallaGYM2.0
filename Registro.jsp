<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro - ValhallaGYM</title>
    <link rel="stylesheet" href="styles/style6.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script src="recuperar.js" defer></script>
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
        <h2>Registro de Usuario</h2>

      <form id="formCliente" action="registrarUsuario.jsp" method="post">


            <table border="1">
                <tr>
                    <td><label for="nombre">Nombre:</label></td>
                    <td><input type="text" id="nombre" name="txtNombre" required></td>
                </tr>

                <tr>
                    <td><label for="cedula">Cédula:</label></td>
                    <td><input type="text" id="cedula" name="txtCedula" maxlength="10" required></td>
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
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Lugar de residencia:</td>
                    <td>
                        <input type="radio" id="sur" name="rdResidencia" value="Sur" required> Sur
                        <input type="radio" id="norte" name="rdResidencia" value="Norte"> Norte
                        <input type="radio" id="centro" name="rdResidencia" value="Centro"> Centro
                    </td>
                </tr>

                <tr>
                    <td><label for="foto">Foto (jpg/jpeg/png):</label></td>
                    <td><input type="file" id="foto" name="fileFoto" accept=".jpg, .jpeg, .png" required></td>
                </tr>

                <tr>
                    <td><label for="fecha">Fecha de nacimiento:</label></td>
                    <td><input type="date" id="fecha" name="mFecha" required></td>
                </tr>

                <tr>
                    <td><label for="color">Color favorito:</label></td>
                    <td><input type="color" id="color" name="cColor" value="#000000"></td>
                </tr>

                <tr>
                    <td><label for="email">Correo electrónico:</label></td>
                    <td><input type="email" id="email" name="txtEmail" required></td>
                </tr>

                <tr>
                    <td><label for="clave">Clave:</label></td>
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
  <center>  <p>&copy; 2025 ValhallaGYM - Todos los derechos reservados</p></center> 
</footer>
<script src="js/Recuperar.js"></script>
</body>
</html>
