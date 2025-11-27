<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>ValhallaGYM</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Fondo general */
        body {
            background-color: #121212;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Carrusel */
        .carousel-item {
            height: 100vh;
            min-height: 500px;
            background-position: center;
            background-size: cover;
            background-repeat: no-repeat;
        }

        /* Texto dentro del carrusel */
        .carousel-caption {
            background: rgba(0, 0, 0, 0.55);
            border-radius: 12px;
            padding: 20px 30px;
            backdrop-filter: blur(3px);
        }

        .carousel-caption h5 {
            font-size: 2.2rem;
            font-weight: 700;
            color: #ffdd57;
            text-transform: uppercase;
        }

        .carousel-caption p {
            font-size: 1.2rem;
            color: #ffffff;
        }

        /* Indicadores del carrusel */
        .carousel-indicators [data-bs-target] {
            background-color: #ffdd57;
        }

        /* Botones de navegación */
        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 50%;
            width: 45px;
            height: 45px;
        }

        /* Imagenes adaptables */
        .carousel-item img {
            width: 100%;
            height: 100vh;
            object-fit: cover;
            filter: brightness(80%);
        }

        /* Logo superior */
        .navbar-brand img {
            height: 60px;
        }

        /* Barra superior */
        .navbar {
            background-color: #b22222;
        }
    </style>
</head>
<body>

    <!-- Barra superior con logo -->
 

    <!-- Carrusel -->
    <div id="valhallaCarousel" class="carousel slide" data-bs-ride="carousel">

        <div class="carousel-inner">

            <div class="carousel-item active">
                <img src="img/pesas1.jpg" alt="Audi">
                <div class="carousel-caption">
                    <h5>Fuerza y Potencia</h5>
                    <p>Rinde como un motor Valhalla.</p>
                </div>
            </div>

            <div class="carousel-item">
                <img src="img/equipo.jpg" alt="Bolso">
                <div class="carousel-caption">
                    <h5>Accesorios Oficiales</h5>
                    <p>Prepárate para conquistar el gimnasio.</p>
                </div>
            </div>

            <div class="carousel-item">
                <img src="img/woman.jpg" alt="Camiseta">
                <div class="carousel-caption">
                    <h5>Ropa Deportiva</h5>
                    <p>Diseñada para el máximo rendimiento.</p>
                </div>
            </div>

            <div class="carousel-item">
                <img src="img/hoddie.jpg" alt="Hoodie">
                <div class="carousel-caption">
                    <h5>Estilo y Comodidad</h5>
                    <p>Domina dentro y fuera del gimnasio.</p>
                </div>
            </div>

            <div class="carousel-item">
                <img src="img/suple.jpg" alt="Proteína">
                <div class="carousel-caption">
                    <h5>Nutrición Premium</h5>
                    <p>Impulsa tu rendimiento físico y mental.</p>
                </div>
            </div>

            <div class="carousel-item">
                <img src="img/gorra.jpg" alt="Gorra">
                <div class="carousel-caption">
                    <h5>Gorras Valhalla</h5>
                    <p>El toque final de tu outfit legendario.</p>
                </div>
            </div>
        </div>

     
        <button class="carousel-control-prev" type="button" data-bs-target="#valhallaCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
            <span class="visually-hidden">Anterior</span>
        </button>

        <button class="carousel-control-next" type="button" data-bs-target="#valhallaCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
            <span class="visually-hidden">Siguiente</span>
        </button>

        <!-- Indicadores -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#valhallaCarousel" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#valhallaCarousel" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#valhallaCarousel" data-bs-slide-to="2"></button>
            <button type="button" data-bs-target="#valhallaCarousel" data-bs-slide-to="3"></button>
            <button type="button" data-bs-target="#valhallaCarousel" data-bs-slide-to="4"></button>
            <button type="button" data-bs-target="#valhallaCarousel" data-bs-slide-to="5"></button>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
