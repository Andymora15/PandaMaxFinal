<%@ page import="java.util.*, com.productos.datos.*, java.sql.*,com.productos.seguridad.*" %>
<%@ page session="true" %>
<%
    // Obtener carrito actual de la sesión o crear uno nuevo
    List<Map<String, Object>> carrito = (List<Map<String, Object>>) session.getAttribute("carrito");
    if (carrito == null) {
        carrito = new ArrayList<>();
        session.setAttribute("carrito", carrito);
    }

    // Si se envió producto para agregar
    String idProducto = request.getParameter("id_pr");
    String cantidadStr = request.getParameter("cantidad");
    int cantidad = (cantidadStr != null && !cantidadStr.isEmpty()) ? Integer.parseInt(cantidadStr) : 1;  // Asignar la cantidad seleccionada

    if (idProducto != null) {
        Conexion con = new Conexion();
        ResultSet rs = con.Consulta("SELECT * FROM tb_producto WHERE id_pr = " + idProducto);
        if (rs.next()) {
            Map<String, Object> producto = new HashMap<>();
            producto.put("id_pr", rs.getInt("id_pr"));
            producto.put("nombre", rs.getString("nombre_pr"));
            producto.put("precio", rs.getDouble("precio_pr"));
            producto.put("cantidad", cantidad); // Agregar la cantidad seleccionada

            // Verificar si ya está en el carrito
            boolean existe = false;
            for (Map<String, Object> p : carrito) {
                // Verificar si 'id_pr' no es null antes de llamar a equals
                if (p.get("id_pr") != null && p.get("id_pr").equals(producto.get("id_pr"))) {
                    int cantidadActual = (int) p.get("cantidad");
                    int nuevaCantidad = cantidadActual + cantidad;

                    // Verificar si hay suficiente stock para agregar más
                    int stockDisponible = rs.getInt("cantidad_pr");
                    if (nuevaCantidad <= stockDisponible) {
                        p.put("cantidad", nuevaCantidad); // Incrementar cantidad
                        existe = true;
                    } else {
                        // Si no hay suficiente stock
                        out.println("<p>No hay suficiente stock para agregar más unidades de: " + producto.get("nombre") + "</p>");
                    }
                    break;
                }
            }
            if (!existe) {
                carrito.add(producto);
            }
        }
        rs.close();
    }
%>
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
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Comprar Productos</title>
    <link rel="stylesheet" href="css/c1.css">
</head>
<body>
    <header>
        <img alt="Logo" src="iconos/logo.png" class="logo">
        <h1>PandaMax</h1>
        <p>Tu centro de soluciones técnicas</p>
        <button id="toggle-theme">Cambiar Tema</button>
        <h2>Bienvenido <%= usuario %></h2>
        <!-- Aquí agregamos el icono del carrito -->
        <a href="carrito.jsp">
            <img src="iconos/carrito.png" alt="Carrito de compras" style="width: 40px; height: 40px;"/>
        </a>
    </header>
    
    <nav>
        <ul>
            <li><a href="menu.jsp">Regresar</a></li>  
        	<li><a href="cerrarSesion.jsp">Cerrar Sesion</a></li>  
        </ul>
    </nav>    

    <main>
        <h2>Productos disponibles</h2>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Cantidad</th>
            </tr>
            <%
                Conexion con = new Conexion();
                ResultSet rs = con.Consulta("SELECT * FROM tb_producto");
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id_pr") %></td>
                <td><%= rs.getString("nombre_pr") %></td>
                <td>$<%= rs.getDouble("precio_pr") %></td>
                <td>
                    <form action="comprar.jsp" method="get">
                        <input type="number" name="cantidad" value="1" min="1" max="<%= rs.getInt("cantidad_pr") %>">
                        <input type="hidden" name="id_pr" value="<%= rs.getInt("id_pr") %>">
                        <input type="submit" value="Agregar al carrito">
                    </form>
                </td>
            </tr>
            <%
                }
                rs.close();
            %>
        </table>
        <br>
    </main>

    <footer>
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

