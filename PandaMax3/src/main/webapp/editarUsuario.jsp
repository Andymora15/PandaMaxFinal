<%@ page import="java.sql.*, com.productos.datos.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id_us"));
    Conexion con = new Conexion();
    String sql = "SELECT * FROM tb_usuario WHERE id_us = " + id;
    ResultSet rs = con.Consulta(sql);
    
    if (rs != null && rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Usuario</title>
    <link rel="stylesheet" href="css/c1.css">
</head>
    <header>
    	<img alt="Logo" src="iconos/logo.png" class="logo">
        <h1>PandaMax</h1>
        <p>Tu centro de soluciones técnicas</p>
    	<button id="toggle-theme">Cambiar Tema</button>
    </header>
<body>
    <h3>Editar Usuario</h3>
    <form action="actualizarUsuario.jsp" method="post">
        <input type="hidden" name="id_us" value="<%= rs.getInt("id_us") %>">

        <label>Nombre completo:</label><br>
        <input type="text" name="nombre_us" value="<%= rs.getString("nombre_us") %>" required><br>

        <label>Cédula:</label><br>
        <input type="text" name="cedula_us" value="<%= rs.getString("cedula_us") %>" required><br>

        <label>Correo electrónico:</label><br>
        <input type="email" name="correo_us" value="<%= rs.getString("correo_us") %>" required><br>

        <label>Perfil:</label><br>
        <select name="id_per" required>
            <option value="1" <%= rs.getInt("id_per") == 1 ? "selected" : "" %>>Administrador</option>
            <option value="2" <%= rs.getInt("id_per") == 2 ? "selected" : "" %>>Cliente</option>
            <option value="3" <%= rs.getInt("id_per") == 3 ? "selected" : "" %>>Vendedor</option>
        </select><br>

        <label>Estado civil:</label><br>
        <select name="id_est" required>
            <option value="1" <%= rs.getInt("id_est") == 1 ? "selected" : "" %>>Casado</option>
            <option value="2" <%= rs.getInt("id_est") == 2 ? "selected" : "" %>>Soltero</option>
            <option value="3" <%= rs.getInt("id_est") == 3 ? "selected" : "" %>>Divorciado</option>
            <option value="4" <%= rs.getInt("id_est") == 4 ? "selected" : "" %>>Viudo</option>
        </select><br><br>

        <input type="submit" value="Actualizar Usuario">
    </form>
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
<%
    if (rs != null) rs.close();
    }
%>
