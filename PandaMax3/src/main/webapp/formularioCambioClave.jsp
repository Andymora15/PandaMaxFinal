<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cambiar Contraseña</title>
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
            <li><a href="cerrarSesion.jsp">Cerrar Sesion</a></li>  
        </ul>
    </nav>
	<main>
	<h2>Cambiar Contraseña</h2>
    <form action="cambioClave.jsp" method="post">
        <label>Correo electrónico:</label><br>
        <input type="email" name="correo_us" required><br><br>

        <label>Nueva contraseña:</label><br>
        <input type="password" name="clave_nueva1" required><br><br>

        <label>Confirmar nueva contraseña:</label><br>
        <input type="password" name="clave_nueva2" required><br><br>

        <input type="submit" value="Cambiar contraseña">
        <a href="menu.jsp">Cancelar</a>
    </form>
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
	
        	// Cambia el texto del botón
        	if (document.body.classList.contains("light-mode")) {
        	    toggleBtn.textContent = "Modo Oscuro";
        	} else {
        	    toggleBtn.textContent = "Modo Claro";
        	}
   		});
	</script>
</body>
</html>
