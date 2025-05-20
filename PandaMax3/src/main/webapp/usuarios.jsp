<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.productos.seguridad.*" session="true"%>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("usuario") == null) {
%>
    <jsp:forward page="login.jsp">
        <jsp:param name="error" value="Debe iniciar sesión." />
    </jsp:forward>
<%
    }

    String usuario = (String) sesion.getAttribute("usuario");
    Integer perfil = (Integer) sesion.getAttribute("perfil");

    pagina pag = new pagina();
    String menuHTML = pag.mostrarMenu(perfil);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion de Usuarios</title>
    <link rel="stylesheet" href="css/c1.css">
</head>
<body>
    <header>
        <h2>Bienvenido <%= usuario %></h2>
        <nav>
            <%= menuHTML %>
        </nav>
    </header>

    <main>
        <h3>Gestion de Usuarios</h3>
        <p>Aquí se gesionaran los usuarios.</p>
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
</body>
</html>
