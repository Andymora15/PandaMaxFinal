<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" import="com.productos.seguridad.* , java.util.*" %>
<%
    HttpSession sesion = request.getSession();

    if (sesion.getAttribute("usuario") == null) {
%>
    <jsp:forward page="login.jsp">
        <jsp:param name="error" value="Debe iniciar sesión primero." />
    </jsp:forward>
<%
    } else {
        String nombreUsuario = (String) sesion.getAttribute("usuario");
        Integer perfil = (Integer) sesion.getAttribute("perfil");

        pagina pag = new pagina();
        String menuHTML = pag.mostrarMenu(perfil);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Menú principal</title>
    <link rel="stylesheet" href="css/c1.css">
</head>
<body>
    <header>
        <h1>Bienvenido <%= nombreUsuario %></h1>
    </header>

    <nav>
        <%= menuHTML %>
    </nav>

    <div id="datos-sesion" style="border: 1px solid #ccc; padding: 10px; margin: 20px;">
        <h2>Datos de la sesión</h2>
        <%
            Date creacion = new Date(sesion.getCreationTime());
            Date ultimoAcceso = new Date(sesion.getLastAccessedTime());
            String idSesion = sesion.getId();
        %>
        <p><strong>ID de sesión:</strong> <%= idSesion %></p>
        <p><strong>Creación:</strong> <%= creacion %></p>
        <p><strong>Último acceso:</strong> <%= ultimoAcceso %></p>
        <a href="cerrarSesion.jsp">cerrar Sesion</a>
    </div>

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

<%
    }
%>
