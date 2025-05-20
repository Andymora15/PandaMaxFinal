<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.productos.negocio.*, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PandaMax - Buscar por Categoría</title>
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
        <li><a href="consulta.jsp">Ver Productos</a></li>
        <li><a href="login.jsp">Login</a></li>
        <li><a href="categoria.jsp">Buscar Por Categoría</a></li>
    </ul>
</nav>

<main>
    <aside>
        <h3>Horarios</h3>
        <p>Lunes a Viernes: 9 AM - 6 PM<br>Sábados: 9 AM - 4 PM</p>

        <h3>Contacto</h3>
        <p>📞 +593 939965463<br>📧 soportepanda@gmail.com</p>

        <a href="https://www.linkedin.com/in/andy-mora-b945b635b">Ver más información sobre el desarrollador</a>

        <h3>Ubicación de nuestro local</h3>
        <p>Visítanos en nuestro taller para recibir atención personalizada por expertos.</p>

        <iframe 
            src="https://www.google.com/maps/d/u/0/embed?mid=1BOKsn9RmBcP1R2InNXJeObHO5vht-Jk&ehbc=2E312F" 
            width="100%" 
            height="300" 
            style="border:0; border-radius: 10px; box-shadow: 0 0 15px #00f0ff;" 
            allowfullscreen="" 
            loading="lazy">
        </iframe>
    </aside>

    <div id="content">
        <h2>Consulta por Categoría</h2>

        <%
            categoria cat = new categoria();
            product prod = new product();
            String categoriaSeleccionada = request.getParameter("cmbCategoria");
        %>

        <form method="get" action="categoria.jsp">
            <label for="cmbCategoria">Seleccione una categoría:</label>
            <%= cat.mostrarCategoria() %>
            <div style="margin-top: 15px;">
                <input type="submit" value="Consultar" class="btn-login">
                <button type="button" onclick="document.getElementById('tablaProductos').innerHTML = '';" class="btn-login" style="background-color:#ff4d4d;">Limpiar Resultados</button>
            </div>
        </form>

        <div id="tablaProductos">
        <% if (categoriaSeleccionada != null) {
            try {
                int idCategoria = Integer.parseInt(categoriaSeleccionada);
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                PrintStream ps = new PrintStream(baos);
                PrintStream originalOut = System.out;
                System.setOut(ps);
                prod.buscarProductoCategoria(idCategoria);
                System.out.flush();
                System.setOut(originalOut);
                String capturedOutput = baos.toString("UTF-8");
        %>
            <h3>Productos en la categoría seleccionada:</h3>
            <table>
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Precio</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if (capturedOutput != null && !capturedOutput.trim().isEmpty()) {
                        String[] filas = capturedOutput.split("</tr>");
                        for (String fila : filas) {
                            if (!fila.contains("<tr>")) continue;
                            String[] datos = fila.split("</td>");
                            if (datos.length >= 2) {
                                String nombre = datos[0].replaceAll(".*<td>", "").trim();
                                String precio = datos[1].replaceAll(".*<td>", "").trim();
                                if (!nombre.isEmpty() && !precio.isEmpty()) {
                %>
                    <tr>
                        <td><%= nombre %></td>
                        <td><%= precio %></td>
                    </tr>
                <%
                                }
                            }
                        }
                    } else {
                %>
                    <tr><td colspan="2">No hay productos disponibles.</td></tr>
                <%
                    }
                %>
                </tbody>
            </table>
        <%
            } catch (NumberFormatException e) {
        %>
            <p style="color: red;">ID de categoría no válido.</p>
        <%
            } catch (Exception e) {
        %>
            <p style="color: red;">Error al cargar los productos: <%= e.getMessage() %></p>
        <%
            }
        } %>
        </div>
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
        toggleBtn.textContent = document.body.classList.contains("light-mode") ? "Modo Oscuro" : "Modo Claro";
    });
</script>

</body>
</html>
