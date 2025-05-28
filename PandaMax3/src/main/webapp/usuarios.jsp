<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.ResultSet,com.productos.seguridad.*,com.productos.datos.*" session="true"%>
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
        <img alt="Logo" src="iconos/logo.png" class="logo">
        <h1>PandaMax</h1>
        <p>Tu centro de soluciones técnicas</p>
        <button id="toggle-theme">Cambiar Tema</button>
        <h2>Bienvenido <%= usuario %></h2> 
        <nav>
            <%= menuHTML %>
        </nav>   
    </header>

<main>
    <h3>Gestión de Usuarios</h3>
    <div id="registroUsuario">
    <h4>Registrar nuevo usuario</h4>
    <form action="registroUsuario.jsp" method="post">
        <label>Nombre completo:</label><br>
        <input type="text" name="nombre_us" required><br>

        <label>Cédula:</label><br>
        <input type="text" name="cedula_us" required><br>

        <label>Correo electrónico:</label><br>
        <input type="email" name="correo_us" required><br>

        <label>Contraseña:</label><br>
        <input type="password" name="clave_us" required><br>

        <label>Perfil:</label><br>
        <select name="id_per" required>
            <option value="1">Administrador</option>
            <option value="2">Cliente</option>
            <option value="3">Vendedor</option>
        </select><br>

        <label>Estado civil:</label><br>
        <select name="id_est" required>
            <option value="1">Casado</option>
            <option value="2">Soltero</option>
            <option value="3">Divorciado</option>
            <option value="4">Viudo</option>
        </select><br><br>

        <input type="submit" value="Registrar Usuario">
    </form>
    </div>>
    <div id="table">
    	<h4>Usuarios registrados</h4>
<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Cédula</th>
            <th>Correo</th>
            <th>Perfil</th>
            <th>Estado civil</th>
            <th>Estado</th>
        </tr>
    </thead>
    <tbody>
        <%
            Conexion con = new Conexion();
            String sql = "SELECT * FROM tb_usuario";
            ResultSet rs = con.Consulta(sql);

            try {
                while (rs != null && rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id_us") %></td>
            <td><%= rs.getString("nombre_us") %></td>
            <td><%= rs.getString("cedula_us") %></td>
            <td><%= rs.getString("correo_us") %></td>
            <td><%= rs.getInt("id_per") %></td>
            <td><%= rs.getInt("id_est") %></td>
            <td><%= (rs.getInt("estado") == 1 ? "Activo" : "Inactivo") %></td>
            <th>Acciones</th>
        
<td>
    <!-- Alternar estado -->
    <form action="bloquearUsuario.jsp" method="post" style="display:inline;">
        <input type="hidden" name="id_us" value="<%= rs.getInt("id_us") %>">
        <input type="hidden" name="estado" value="<%= rs.getInt("estado") %>">
        <button type="submit" title="<%= rs.getInt("estado") == 1 ? "Bloquear" : "Desbloquear" %>">
            <%= rs.getInt("estado") == 1 ? "🔒" : "🔓" %>
        </button>
    </form>

    <!-- Eliminar -->
<form action="eliminarUsuario.jsp" method="post" style="display:inline;">
    <input type="hidden" name="id_us" value="<%= rs.getInt("id_us") %>">
    <button type="submit" onclick="return confirm('¿Estás seguro de eliminar este usuario?');" title="Eliminar">
        <!-- Icono para eliminar -->
        <img src="iconos/eliminar.png" alt="Eliminar" style="width: 30px; height: 30px;" />
    </button>
</form>

<!-- Botón de edición -->
<form action="gestionUsuarios.jsp" method="get" style="display:inline;">
    <input type="hidden" name="id_us" value="<%= rs.getInt("id_us") %>">
    <button type="submit" title="Editar">
        <!-- Icono para editar -->
        <img src="iconos/editar.png" alt="Editar" style="width: 30px; height: 30px;" />
    </button>
</form>
	
    
</td>


            
        </tr>
        <%
                }
                if (rs != null) rs.close();
            } catch (Exception ex) {
                out.println("<tr><td colspan='7'>Error: " + ex.getMessage() + "</td></tr>");
            }
        %>
    </tbody>
</table>

    	
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
