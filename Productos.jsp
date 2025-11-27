<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nuestros Productos - Valhalla GYM</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <!-- API de Google Model Viewer -->
    <script type="module" src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"></script>
<link href="styles/style3.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<nav>
            <a href="index.jsp"><i class="fas fa-home"></i> Inicio</a>
            <a class="active" href="Productos.jsp"><i class="fas fa-box-open"></i> Productos</a>
            <a href="Servicios.jsp"><i class="fas fa-dumbbell"></i> Servicios</a>
            <a href="Contacto.jsp"><i class="fas fa-envelope"></i> Contacto</a>
            <a href="Registro.jsp"><i class="fas fa-user-plus"></i> ¿Eres nuevo? Regístrate</a>
        </nav>

<!-- 🔹 Navbar -->
<nav class="navbar navbar-expand-lg">
  <div class="container">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">

      </ul>
    </div>
  </div>
</nav>

<div class="container mt-5">
  <h1 class="text-center mb-5">Explora Nuestros Productos </h1>

  <div class="row justify-content-center g-4">
    
    <!-- 1️⃣ Hand Grip -->
    <div class="col-md-4">
      <div class="product-card p-3 text-center">
        <model-viewer src="models/hand_grip.glb" alt="Hand Grip" camera-controls auto-rotate shadow-intensity="1"></model-viewer>
        <h3>Hand Grip</h3>
        <p>Fortalece tus manos y antebrazos con este accesorio.</p>
      </div>
    </div>

    <!-- 2️⃣ Men Gym Vest -->
    <div class="col-md-4">
      <div class="product-card p-3 text-center">
        <model-viewer src="models/men_gym_vest.glb" alt="Men Gym Vest" camera-controls auto-rotate shadow-intensity="1"></model-viewer>
        <h3>Men Gym Vest</h3>
        <p>Ropa deportiva ideal para tus entrenamientos diarios.</p>
      </div>
    </div>

    <!-- 3️⃣ Protein Powder -->
    <div class="col-md-4">
      <div class="product-card p-3 text-center">
        <model-viewer src="models/protein_powder.glb" alt="Protein Powder" camera-controls auto-rotate shadow-intensity="1"></model-viewer>
        <h3>Protein Powder</h3>
        <p>Suplemento proteico para mejorar tu rendimiento.</p>
      </div>
    </div>

    <!-- 4️⃣ Weightlifting Glove -->
    <div class="col-md-4">
      <div class="product-card p-3 text-center">
        <model-viewer src="models/pro_weightlifting_glove.glb" alt="Guantes de Levantamiento" camera-controls auto-rotate shadow-intensity="1"></model-viewer>
        <h3>Weightlifting Glove</h3>
        <p>Protege tus manos durante el levantamiento de pesas.</p>
      </div>
    </div>

    <!-- 5️⃣ Crop Top y Pants -->
    <div class="col-md-4">
      <div class="product-card p-3 text-center">
        <model-viewer src="models/basic_crop_top_and_pants.glb" alt="Crop Top y Pants" camera-controls auto-rotate shadow-intensity="1"></model-viewer>
        <h3>Crop Top y Pants</h3>
        <p>Ropa fitness moderna y cómoda para mujeres activas.</p>
      </div>
    </div>

    <!-- 6️⃣ Pelotas de Ejercicio -->
    <div class="col-md-4">
      <div class="product-card p-3 text-center">
        <model-viewer src="models/exercise_balls_-_low_poly.glb" alt="Pelotas de Ejercicio" camera-controls auto-rotate shadow-intensity="1"></model-viewer>
        <h3>Exercise Balls</h3>
        <p>Pelotas de entrenamiento versátiles y duraderas.</p>
      </div>
    </div>

    <!-- 7️⃣ Cuerda de Aerobics -->
    <div class="col-md-4">
      <div class="product-card p-3 text-center">
        <model-viewer src="models/aerobics_rope_-_game_ready.glb" alt="Cuerda de Aerobics" camera-controls auto-rotate shadow-intensity="1"></model-viewer>
        <h3>Aerobics Rope</h3>
        <p>Ideal para ejercicios cardiovasculares y coordinación.</p>
      </div>
    </div>

    <!-- 8️⃣ Dumbbell -->
    <div class="col-md-4">
      <div class="product-card p-3 text-center">
        <model-viewer src="models/russian_dumbbell_red.glb" alt="Dumbbell Rojo" camera-controls auto-rotate shadow-intensity="1"></model-viewer>
        <h3>Russian Dumbbell</h3>
        <p>Pesa profesional con acabado metálico resistente.</p>
      </div>
    </div>

    <!-- 9️⃣ Water Bottle -->
    <div class="col-md-4">
      <div class="product-card p-3 text-center">
        <model-viewer src="models/water_bottle.glb" alt="Botella de Agua" camera-controls auto-rotate shadow-intensity="1"></model-viewer>
        <h3>Water Bottle</h3>
        <p>Botella deportiva con diseño ergonómico y liviano.</p>
      </div>
    </div>

    <!-- 🔟 Zapatillas Jordan -->
    <div class="col-md-4">
      <div class="product-card p-3 text-center">
        <model-viewer src="models/jordan_blue_suede_gym_shoes.glb" alt="Zapatillas Jordan" camera-controls auto-rotate shadow-intensity="1"></model-viewer>
        <h3>Jordan Gym Shoes</h3>
        <p>Zapatillas premium para alto rendimiento.</p>
      </div>
    </div>

  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
