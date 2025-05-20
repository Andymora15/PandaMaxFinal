<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PandaMax - Registro</title>
    <link rel="stylesheet" href="css/c1.css">
</head>
<body>
    <header>
        <img alt="Logo" src="iconos/logo.png" class="logo">
        <h1>PandaMax</h1>
        <p>Tu centro de soluciones técnicas</p>
        <button id="toggle-theme">Cambiar Tema</button>
    </header>

    <nav>
        <ul>
            <li><a href="consulta.jsp">Ver Productos</a></li>
            <li><a href="index.jsp">Inicio</a></li>  
            <li><a href="categoria.jsp">Buscar Por Categoria</a></li>                   
        </ul>
    </nav>

    <main>
        <div id="content">
            <h2 align="center">Iniciar Sesion</h2>
            <form action="validarLogin.jsp" method="post" class="login-form">
    			<label for="usuario">Usuario:</label>
    			<input type="text" id="usuario" name="txtUser" required>
    			<label for="password">Contraseña:</label>
    			<input type="password" id="password" name="txtClaveLog" required>
    			<button type="submit" class="btn-login">Login</button>
			</form>

            <p align="center">¿Aun No tienes cuenta? <a href="registro.jsp">Registrate aquí</a>.</p>
        </div>
    </main>

    <footer>
        <p>Síguenos en nuestras redes sociales</p>
        <div class="social">
            <a href="https://www.facebook.com/"><img src="iconos/facebook.png" alt="Facebook"></a>
            <a href="https://www.instagram.com/"><img src="iconos/instagram.png" alt="Instagram"></a>
            <a href="https://www.tiktok.com/"><img src="iconos/tiktok.png" alt="TikTok"></a>
        </div>
        <p>&copy; 2025 PandaMax Tech Repair - Todos los derechos reservados.</p>
    </footer>

    <script>
        const toggleBtn = document.getElementById("toggle-theme");
        toggleBtn.addEventListener("click", () => {
            document.body.classList.toggle("light-mode");

            if (document.body.classList.contains("light-mode")) {
                toggleBtn.textContent = "Modo Oscuro";
            } else {
                toggleBtn.textContent = "Modo Claro";
            }
        });
    </script>
</body>
</html>
