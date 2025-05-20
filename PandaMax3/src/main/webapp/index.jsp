<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PandaMax - Servicio Técnico</title>
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
            <li><a href="login.jsp">Login</a></li>  
            <li><a href="categoria.jsp">Buscar Por Categoria</a></li>          
        </ul>
    </nav>

    <main>
    <aside>
        <h3>Horarios</h3>
        <p>Lunes a Viernes: 9 AM - 6 PM<br>Sábados: 9 AM - 4 PM</p>

        <h3>Contacto</h3>
        <p>📞 +593 939965463<br>📧 soportepanda@gmail.com</p>
		
		<a href="https://www.linkedin.com/in/andy-mora-b945b635b">Ver mas informacion sobre el desarrollador</a>
		
        <h3>Ubicación de nuestro local</h3>
        <p>Visítanos en nuestro taller para recibir atención personalizada por expertos.</p>

        <iframe 
            src="https://www.google.com/maps/d/u/0/embed?mid=1BOKsn9RmBcP1R2InNXJeObHO5vht-Jk&ehbc=2E312F" 
            width="100%" 
            height="300" 
            style="border:0; border-radius: 10px; box-shadow: 0 0 15px #00f0ff;" 
            allowfullscreen="" 
            loading="lazy">
        </iframe>
    </aside>

    <div id="content">
        <h2>¿Qué hacemos?</h2>
        <p>Reparamos computadoras, celulares, tablets y mucho más. Diagnóstico gratuito y atención inmediata.</p>

        <h2>Misión</h2>
        <p>Brindar soluciones tecnológicas rápidas, confiables y accesibles para la reparación de dispositivos electrónicos, con un enfoque en la satisfacción del cliente.</p>

        <h2>Visión</h2>
        <p>Convertirnos en el servicio técnico más confiable del país, reconocidos por nuestra innovación, compromiso y excelencia.</p>

        <img src="images/reparando.jpg" alt="Técnico reparando" style="width:65%; border-radius:10px; margin-top:20px;align:center">
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