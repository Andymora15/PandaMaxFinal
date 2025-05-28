<%@ page import="java.sql.*, com.productos.negocio.*,com.productos.datos.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String id = request.getParameter("id");
    product pr = new product();
    Connection con = new Conexion().getConexion();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM tb_producto WHERE id_pr = ?");
    ps.setInt(1, Integer.parseInt(id));
    ResultSet rs = ps.executeQuery();
    rs.next();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Actualizar Producto</title>
    <link rel="stylesheet" href="css/c1.css">
</head>
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
<body>
	<main>
		<div class="container">
        <h2>Actualizar Producto</h2>
        <form action="productoCRUD.jsp" method="post">
    <input type="hidden" name="accion" value="actualizar">
    <input type="hidden" name="id" value="<%= rs.getInt("id_pr") %>">

    <label>Nombre:</label>
    <input type="text" name="nombre" value="<%= rs.getString("nombre_pr") %>"><br>

    <label>Categoría:</label>
    <select name="cmbCategoria">
        <%
            categoria cat = new categoria();
            ResultSet rsCat = con.createStatement().executeQuery("SELECT * FROM tb_categoria");
            while (rsCat.next()) {
                int catId = rsCat.getInt(1);
                String selected = (catId == rs.getInt("id_cat")) ? "selected" : "";
                out.print("<option value='" + catId + "' " + selected + ">" + rsCat.getString(2) + "</option>");
            }
        %>
    </select><br>

    <label>Cantidad:</label>
    <input type="number" name="cantidad" value="<%= rs.getInt("cantidad_pr") %>"><br>

    <label>Precio:</label>
    <input type="text" name="precio" value="<%= rs.getDouble("precio_pr") %>"><br>

    <input type="submit" value="actualizar">
    <a href="productos.jsp">Cancelar</a>
</form>
	</main>

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