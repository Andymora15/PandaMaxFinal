<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PandaMax - Respuesta</title>
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
		<li><a href="login.jsp">Regresar</a></li>	
		</ul>
	</nav>
    <main>
        <div id="content">
            <h2>Datos Registrados Exitosamente :)</h2>
            <p>¡Estamos trabajando para mejorar esta sección! Mientras tanto, puedes visitar otras páginas de nuestro sitio.</p>
         	<% 
         	out.print("Su nombre es: "+request.getParameter("txtNombre")+"</br>");
         	
         	String cedula=request.getParameter("txtCedula");
         	String estadoC=request.getParameter("cmbEstado");
         	String resi=request.getParameter("rdResidencia");
         	String foto=request.getParameter("fileFoto");
         	String color=request.getParameter("cColor");
         	
         	out.print("Su cedula es: "+request.getParameter("txtCedula")+"</br>");
         	out.print("Su estadocivil es: "+request.getParameter("cmbEstado")+"</br>");
         	out.print("Su residencia es: "+request.getParameter("rdResidencia")+"</br>");
         	out.print("Su color es: "+request.getParameter("cColor")+"</br>");

         	usuario nuevo = new usuario();
         	nuevo.setNombre(request.getParameter("txtNombre"));
         	nuevo.setCedula(request.getParameter("txtCedula"));
         	nuevo.setCorreo(request.getParameter("txtEmail"));
         	nuevo.setClave(request.getParameter("txtClave"));
         	nuevo.setEstadoCivil( Integer.parseInt(request.getParameter("cmbEstado")) ); // por ejemplo: Soltero
         	String resultado = nuevo.ingresarCliente();
         	System.out.println(resultado);

         	
         	
         	%>
         	<!--img src="images/construccion.png" alt="Página en Construcción" style="width:75%; border-radius:10px; margin-top:20px;"-->
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
