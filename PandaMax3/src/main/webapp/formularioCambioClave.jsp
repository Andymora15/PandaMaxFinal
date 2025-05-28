<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cambiar Contrase�a</title>
    <link rel="stylesheet" href="css/c1.css">
</head>
<body>
<header>
    <img alt="Logo" src="iconos/logo.png" class="logo">
    <h1>PandaMax</h1>
    <p>Tu centro de soluciones t�cnicas</p>
    <button id="toggle-theme">Cambiar Tema</button>
</header>
<nav>
    <ul>
    	<li><a href="menu.jsp">Regresar</a></li>
        <li><a href="cerrarSesion.jsp">Cerrar Sesion</a></li>  
    </ul>
</nav>
<main>
    <h2>Cambiar Contrase�a</h2>
    <form action="cambioClave.jsp" method="post" onsubmit="return validarContrasena();">
        <label>Correo electr�nico:</label><br>
        <input type="email" name="correo_us" required><br><br>

        <label>Nueva contrase�a:</label><br>
        <input type="password" id="clave_nueva1" name="clave_nueva1" required><br><br>
        <input type="checkbox" id="mostrarClave1" onclick="togglePassword()"> Mostrar clave<br>
        
        <label>Confirmar nueva contrase�a:</label><br>
        <input type="password" id="clave_nueva2" name="clave_nueva2" required><br><br>
        <input type="checkbox" id="mostrarClave2" onclick="togglePassword()"> Mostrar clave<br><br>
        
        <input type="submit" value="Cambiar contrase�a">
        <a href="menu.jsp">Cancelar</a>
    </form>
</main>

<footer>
    <p>S�guenos en nuestras redes sociales</p>
    <div class="social">
        <a href="https://www.facebook.com/"><img src="iconos/facebook.png" alt="Facebook"></a>
        <a href="https://www.instagram.com/"><img src="iconos/instagram.png" alt="Instagram"></a>
        <a href="https://www.tiktok.com/"><img src="iconos/tiktok.png" alt="TikTok"></a>
    </div>
    <p>&copy; 2025 PandaMax Tech Repair - Todos los derechos reservados.</p>
</footer>

<script>
    // Funci�n para validar las contrase�as
    function validarContrasena() {
        var clave1 = document.getElementById("clave_nueva1").value;
        var clave2 = document.getElementById("clave_nueva2").value;

        // Verificar que las contrase�as sean iguales
        if (clave1 !== clave2) {
            alert("Las contrase�as no coinciden. Por favor, intentalo de nuevo.");
            return false;  // Evitar el env�o del formulario si las contrase�as no coinciden
        }

        // Verificar que la contrase�a tenga al menos 8 caracteres
        if (clave1.length < 8) {
            alert("La contrase�a debe tener al menos 8 caracteres.");
            return false;  // Evitar el env�o del formulario si la contrase�a no tiene 8 caracteres
        }

        return true;  // Permitir el env�o del formulario si todo es v�lido
    }

    // Funci�n para mostrar/ocultar las contrase�as
    function togglePassword() {
        var clave1 = document.getElementById("clave_nueva1");
        var clave2 = document.getElementById("clave_nueva2");

        // Si la casilla de "Mostrar clave" est� marcada, se cambian los tipos de ambos campos
        if (document.getElementById("mostrarClave1").checked) {
            clave1.type = "text";  // Muestra la contrase�a en el primer campo
        } else {
            clave1.type = "password";  // Oculta la contrase�a en el primer campo
        }

        if (document.getElementById("mostrarClave2").checked) {
            clave2.type = "text";  // Muestra la contrase�a en el segundo campo
        } else {
            clave2.type = "password";  // Oculta la contrase�a en el segundo campo
        }
    }

    // Funci�n para cambiar el modo de tema
    const toggleBtn = document.getElementById("toggle-theme");
    toggleBtn.addEventListener("click", () => {
        document.body.classList.toggle("light-mode");

        // Cambia el texto del bot�n
        if (document.body.classList.contains("light-mode")) {
            toggleBtn.textContent = "Modo Oscuro";
        } else {
            toggleBtn.textContent = "Modo Claro";
        }
    });
</script>
</body>
</html>
