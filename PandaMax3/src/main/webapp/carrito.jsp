<%@ page import="java.util.*, java.sql.*" %>
<%@ page session="true" %>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Carrito de Compras</title>
    <link rel="stylesheet" href="css/c1.css">
</head>
<body>
    <header>
        <img alt="Logo" src="iconos/logo.png" class="logo">
        <h1>PandaMax</h1>
        <p>Tu centro de soluciones tecnicas</p>
        <button id="toggle-theme">Cambiar Tema</button>
    </header>
    <nav>
        <ul>
        	<li><a href="menu.jsp">Regresar</a></li>
            <li><a href="cerrarSesion.jsp">Cerrar Sesion</a></li>  
        </ul>
    </nav>

    <main>
        <%
    List<Map<String, Object>> carrito = (List<Map<String, Object>>) session.getAttribute("carrito");

    if (carrito == null || carrito.isEmpty()) {
%>
    <p>El carrito esta vacio.</p>
    <a href="comprar.jsp"><img src="iconos/regreso.png" alt="Regresar" style="width: 30px; height: 30px;" /></a>
<%
        return;
    }

    double total = 0;
%>
        <h2>Carrito de Compras</h2>
        <table border="1">
            <tr>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Subtotal</th>
                <th>Eliminar</th>
            </tr>
            <%
                for (Map<String, Object> producto : carrito) {
                    // Verificar que 'cantidad' y 'precio' no sean nulos
                    Integer cantidad = (Integer) producto.get("cantidad");
                    Double precio = (Double) producto.get("precio");

                    if (cantidad == null || precio == null) {
                        continue; // Si hay un valor nulo, lo ignoramos
                    }

                    double subtotal = precio * cantidad;
                    total += subtotal;
            %>
            <tr>
                <td><%= producto.get("nombre") %></td>
                <td>$<%= precio %></td>
                <td><%= cantidad %></td>
                <td>$<%= subtotal %></td>
                <td><a href="eliminarCarrito.jsp?id_pr=<%= producto.get("id_pr") %>">Eliminar</a></td>
            </tr>
            <% } %>
            <tr>
                <td colspan="3"><strong>Total</strong></td>
                <td><strong>$<%= total %></strong></td>
            </tr>
        </table>
        <br>
        <form action="pago.jsp" method="post">
            <input type="submit" value="Proceder al pago">
        </form>
        <br>
        <a href="comprar.jsp">Seguir comprando</a>
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
