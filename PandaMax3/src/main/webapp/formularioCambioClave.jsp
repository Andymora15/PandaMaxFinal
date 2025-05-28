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
    	<li><a href="menu.jsp">Regresar</a></li>
        <li><a href="cerrarSesion.jsp">Cerrar Sesion</a></li>  
    </ul>
</nav>
<main>
    <h2>Cambiar Contraseña</h2>
    <form action="cambioClave.jsp" method="post" onsubmit="return validarContrasena();">
        <label>Correo electrónico:</label><br>
        <input type="email" name="correo_us" required><br><br>

        <label>Nueva contraseña:</label><br>
        <input type="password" id="clave_nueva1" name="clave_nueva1" required><br><br>
        <input type="checkbox" id="mostrarClave1" onclick="togglePassword()"> Mostrar clave<br>
        
        <label>Confirmar nueva contraseña:</label><br>
        <input type="password" id="clave_nueva2" name="clave_nueva2" required><br><br>
        <input type="checkbox" id="mostrarClave2" onclick="togglePassword()"> Mostrar clave<br><br>
        
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
    // Función para validar las contraseñas
    function validarContrasena() {
        var clave1 = document.getElementById("clave_nueva1").value;
        var clave2 = document.getElementById("clave_nueva2").value;

        // Verificar que las contraseñas sean iguales
        if (clave1 !== clave2) {
            alert("Las contraseñas no coinciden. Por favor, intentalo de nuevo.");
            return false;  // Evitar el envío del formulario si las contraseñas no coinciden
        }

        // Verificar que la contraseña tenga al menos 8 caracteres
        if (clave1.length < 8) {
            alert("La contraseña debe tener al menos 8 caracteres.");
            return false;  // Evitar el envío del formulario si la contraseña no tiene 8 caracteres
        }

        return true;  // Permitir el envío del formulario si todo es válido
    }

    // Función para mostrar/ocultar las contraseñas
    function togglePassword() {
        var clave1 = document.getElementById("clave_nueva1");
        var clave2 = document.getElementById("clave_nueva2");

        // Si la casilla de "Mostrar clave" está marcada, se cambian los tipos de ambos campos
        if (document.getElementById("mostrarClave1").checked) {
            clave1.type = "text";  // Muestra la contraseña en el primer campo
        } else {
            clave1.type = "password";  // Oculta la contraseña en el primer campo
        }

        if (document.getElementById("mostrarClave2").checked) {
            clave2.type = "text";  // Muestra la contraseña en el segundo campo
        } else {
            clave2.type = "password";  // Oculta la contraseña en el segundo campo
        }
    }

    // Función para cambiar el modo de tema
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
