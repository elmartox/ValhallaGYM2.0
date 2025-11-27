<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Contacto - Valhalla Gym</title>
    <link href="styles/style3.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: var(--beige);
            margin: 0;
            padding: 0;
        }

        nav {
            background-color: var(--vino);
            padding: 15px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        nav a {
            color: var(--beige);
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        nav a:hover, nav a.active {
            color: var(--dorado);
        }

        h1 {
            text-align: center;
            color: var(--marron-oscuro);
            margin-top: 30px;
        }

        .contact-container {
            width: 90%;
            max-width: 600px;
            margin: 40px auto;
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: var(--marron-medio);
        }

        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 2px solid var(--marron-medio);
            border-radius: 8px;
            font-size: 15px;
            outline: none;
            transition: 0.3s;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        textarea:focus {
            border-color: var(--dorado);
        }

        textarea {
            resize: none;
            height: 120px;
        }

        button {
            background-color: var(--vino);
            color: var(--beige);
            border: none;
            padding: 12px 20px;
            border-radius: 10px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background-color: var(--dorado);
            color: var(--vino);
        }

        .contact-info {
            text-align: center;
            margin-top: 30px;
            color: var(--marron-oscuro);
        }

        .contact-info i {
            color: var(--vino);
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <nav>
        <a href="index.jsp"><i class="fas fa-home"></i> Inicio</a>
        <a href="Productos.jsp"><i class="fas fa-box-open"></i> Productos</a>
        <a href="Servicios.jsp"><i class="fas fa-dumbbell"></i> Servicios</a>
        <a class="active" href="Contacto.jsp"><i class="fas fa-envelope"></i> Contacto</a>
        <a href="Registro.jsp"><i class="fas fa-user-plus"></i> ¿Eres nuevo? Regístrate</a>
    </nav>

    <h1>Contáctanos</h1>

    <div class="contact-container">
        <form action="enviarMensaje.jsp" method="post">
            <label for="nombre">Nombre completo:</label>
            <input type="text" id="nombre" name="nombre" required>

            <label for="email">Correo electrónico:</label>
            <input type="email" id="email" name="email" required>

            <label for="mensaje">Mensaje:</label>
            <textarea id="mensaje" name="mensaje" required></textarea>

            <h1><i class="fas fa-paper-plane"></i> Pagina en construcción</h1>
        </form>
    </div>

    <div class="contact-info">
        <p><i class="fas fa-map-marker-alt"></i> Nariz del Diablo, Quito - Ecuador</p>
        <p><i class="fas fa-phone"></i> +593 987 654 321</p>
        <p><i class="fas fa-envelope"></i> contacto@valhallagym.com</p>
    </div>
</body>
</html>
