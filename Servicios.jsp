<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gimnasio VR - Servicios</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Iconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <!-- Visor 3D -->
    <script type="module" src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"></script>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        header {
            background: linear-gradient(135deg, #6F1D1B, #99582A);
            color: white;
            text-align: center;
            padding: 40px 20px;
        }

        nav.navbar {
            background: linear-gradient(135deg, #432818, #BB9457);
        }

        nav .nav-link {
            color: white !important;
            font-weight: 500;
            padding: 10px 20px;
            border-radius: 8px;
            transition: background 0.3s ease;
        }

        nav .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        nav .nav-link.active {
            background-color: #6F1D1B;
            font-weight: bold;
        }

        section {
            padding: 60px 20px;
            position: relative;
        }

        section h2 {
            color: #432818;
            text-align: center;
            font-weight: bold;
            margin-bottom: 25px;
        }

        section p {
            text-align: center;
            color: #555;
            max-width: 800px;
            margin: 0 auto 40px auto;
        }

        model-viewer {
            width: 100%;
            max-width: 900px;
            height: 500px;
            display: block;
            margin: 0 auto;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
            background-color: #000;
            position: relative;
        }

        /* === TEXTOS FLOTANTES SOBRE EL VISOR 3D === */
        .overlay-container {
            position: relative;
            width: 100%;
            max-width: 900px;
            margin: 0 auto;
        }

        .label {
            position: absolute;
            color: white;
            font-weight: bold;
            font-size: 1.1em;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.7);
            padding: 10px 20px;
            border-radius: 10px;
            background-color: rgba(111, 29, 27, 0.7);
            transition: transform 0.3s ease, opacity 0.3s ease;
            opacity: 0.9;
            cursor: pointer;
        }

        .label:hover {
            transform: scale(1.05);
            opacity: 1;
        }

        /* Posiciones simuladas en el espacio 3D */
        .label1 {
            top: 20%;
            left: 10%;
        }

        .label2 {
            top: 50%;
            right: 15%;
        }

        .label3 {
            bottom: 15%;
            left: 35%;
        }

        footer {
            background-color: #432818;
            color: white;
            text-align: center;
            padding: 15px 0;
            font-size: 0.9em;
        }
    </style>
</head>
<body>

<header>
    <h1>Valhalla GYM</h1>
    <h2>Explora nuestros servicios destacados</h2>
</header>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container justify-content-center">
        <a class="nav-link" href="index.jsp"><i class="fas fa-home"></i> Inicio</a>
        <a class="nav-link" href="Productos.jsp"><i class="fas fa-box-open"></i> Productos</a>
        <a class="nav-link active" href="Servicios.jsp"><i class="fas fa-dumbbell"></i> Servicios</a>
        <a class="nav-link" href="Contacto.jsp"><i class="fas fa-envelope"></i> Contacto</a>
        <a class="nav-link" href="Registro.jsp"><i class="fas fa-user-plus"></i> ¿Eres nuevo? Regístrate</a>
    </div>
</nav>

<section>
    <h2>Conoce nuestros servicios</h2>
    <p>
        Descubre las opciones que Valhalla Gym tiene para ti.  
        Coloca el cursor sobre cada servicio para conocer más detalles.
    </p>

    <div class="overlay-container">
        <model-viewer 
            src="models/man.glb"
            alt="Avatar 3D Entrenador Valhalla"
            camera-controls 
            auto-rotate 
            interaction-prompt="auto"
            shadow-intensity="1"
            exposure="1.2"
            ar 
            ar-modes="webxr scene-viewer quick-look"
            skybox-image="img/val.jpg"
            environment-image="img/val.jpg">
        </model-viewer>

        <!-- Etiquetas flotantes con tooltips -->
        <div class="label label1" data-bs-toggle="tooltip" data-bs-placement="right" 
             title="Participa en clases grupales con nuestros entrenadores y vive la motivación de entrenar en equipo.">
            <i class="fas fa-users"></i> Clases Grupales
        </div>

        <div class="label label2" data-bs-toggle="tooltip" data-bs-placement="left" 
             title="Disfruta de rutinas personalizadas según tus metas y nivel físico, guiadas por nuestros expertos.">
            <i class="fas fa-heartbeat"></i> Rutinas Personalizadas
        </div>

        <div class="label label3" data-bs-toggle="tooltip" data-bs-placement="top" 
             title="Recibe orientación profesional para mejorar tu alimentación y rendimiento deportivo.">
            <i class="fas fa-apple-alt"></i> Asesoría Nutricional
        </div>
    </div>
</section>

<footer>
    <p>&copy; 2025 Valhalla GYM - Vive la experiencia completa.</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

<!-- Activar tooltips -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
        [...tooltipTriggerList].map(el => new bootstrap.Tooltip(el));
    });
</script>

</body>
</html>
