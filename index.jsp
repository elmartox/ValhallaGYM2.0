<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Valhalla GYM</title>
    <link href="styles/style3.css" rel="stylesheet" type="text/css"/>
    <!-- 🔗 Librería de íconos Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script type="module" src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"></script>
    
</head>

<body>
    <main>
        <header>
            <img src="img/logo.jpeg" alt="Logo Valhalla GYM" class="logo-gym"/>
            <h1>Valhalla-GYM</h1>
            <h2 class="destacado">Fuerza. Disciplina. Superación.</h2>
            <h4 id="favorito">Tu templo de entrenamiento en QUITO</h4>
        </header>

        <jsp:include page="homeBootstrap.jsp" />

        <!-- 🔹 Menú actualizado con íconos -->
        <nav>
            <a class="active" href="index.jsp"><i class="fas fa-home"></i> Inicio</a>
            <a href="Productos.jsp"><i class="fas fa-box-open"></i> Productos</a>
            <a href="Servicios.jsp"><i class="fas fa-dumbbell"></i> Servicios</a>
            <a href="Contacto.jsp"><i class="fas fa-envelope"></i> Contacto</a>
            <a href="Registro.jsp"><i class="fas fa-user-plus"></i> ¿Eres nuevo? Regístrate</a>
             <a href="login.jsp"><i class="fas fa-user"></i> Iniciar Sesión</a>
             <a href="registroPersonal.jsp"><i class="fas fa-users"></i> Administradores y Entrenadores</a>
        </nav>

        <div class="content">
            <section>
                <article>
                    <h3>Nuestra misión</h3>
                    <p>
                        En Valhalla GYM, creemos que la disciplina y la constancia forjan el éxito. 
                        Contamos con 12 años de experiencia ayudando a nuestros miembros a alcanzar su mejor versión física y mental.
                        Ofreciendo equipos de alta gama y entrenadores certificados.
                    </p>
                    <img src="img/gym.jpeg" width="400" height="300" alt="Gimnasio Valhalla"/>
                </article>

                <article>
                    <h3>Encuéntranos en el mapa</h3>
                    <!-- 🌍 Google Maps Embed -->
                    <iframe 
                        src="https://www.google.com/maps/d/embed?mid=1TLdQ6hW-BTsCyc66PNlEgoSgfXdQq9k&ehbc=2E312F" 
                        width="100%" 
                        height="400" 
                        style="border:0;" 
                        allowfullscreen="" 
                        loading="lazy">
                    </iframe>
                </article>
            </section>

            <aside>
                <h3>Desarrolladores</h3>
                <p>Conoce más sobre quienes hacen posible este proyecto:</p>
                
                <div class="social-links">
                    <a href="https://www.linkedin.com/in/espa%C3%B1a-herrera-alan-mart%C3%ADn-424b34359/" target="_blank">
                        <img src="img/link.jpeg" alt="LinkedIn" width="40" height="40"/>
                        LinkedIn
                    </a>
                    <a href="https://github.com/elmartox" target="_blank">
                        <img src="img/git.jpeg" alt="GitHub" width="40" height="40"/>
                        GitHub
                    </a>
                </div>
            </aside>
        </div>
<div class="assistant-container">
    <model-viewer
        src="models/knight.glb"
        alt="Asistente Valhalla"
        autoplay
        auto-rotate
        rotation-per-second="30deg"
        camera-controls
        interaction-prompt="none"
        shadow-intensity="1"
        exposure="1"
        disable-zoom
        style="width: 120px; height: 150px;">
    </model-viewer>

    <div class="assistant-text">
        ¿Necesitas ayuda en algo?
    </div>
</div>

<style>
    .assistant-container {
        position: fixed;
        bottom: 25px;
        right: 25px;
        display: flex;
        align-items: center;
        gap: 10px;
        background: rgba(255, 255, 255, 0.9);
        padding: 10px 15px;
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        z-index: 999;
        transition: transform 0.3s ease;
    }

    .assistant-container:hover {
        transform: scale(1.05);
    }

    .assistant-text {
        font-family: Arial, sans-serif;
        color: var(--marron-oscuro, #432818);
        font-weight: bold;
        font-size: 14px;
        max-width: 120px;
    }

    model-viewer {
        cursor: pointer;
    }
</style>

        <footer>
            <ul>
                <li>Facebook</li>
                <li>Instagram</li>
                <li>Twitter</li>
            </ul>
            <p>&copy; 2025 Valhalla GYM | Desarrollado por MarTecs</p>
        </footer>
    </main>
</body>
</html>
