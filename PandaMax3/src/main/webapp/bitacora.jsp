<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.productos.seguridad.*, com.productos.datos.*, java.sql.*, java.util.*" session="true"%>
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

    // Crear la conexión usando la clase Conexion
    Conexion conexion = new Conexion();
    ResultSet rs = null;
    List<String[]> registros = new ArrayList<>();

    try {
        // Ejecutar la consulta para obtener registros de la bitacora
        String query = "SELECT * FROM auditoria.tb_auditoria ORDER BY fecha_aud DESC";
        rs = conexion.Consulta(query);

        // Procesar los resultados y almacenarlos en la lista 'registros'
        while (rs.next()) {
            String tabla = rs.getString("tabla_aud");
            String operacion = rs.getString("operacion_aud");
            String valorAnterior = rs.getString("valoranterior_aud");
            String valorNuevo = rs.getString("valornuevo_aud");
            java.sql.Date fecha = rs.getDate("fecha_aud");
            String usuarioAud = rs.getString("usuario_aud");

            registros.add(new String[]{tabla, operacion, valorAnterior, valorNuevo, fecha.toString(), usuarioAud});
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bitacora</title>
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
        <h3>Bitacora</h3>
        <table border="1">
            <thead>
                <tr>
                    <th>Tabla</th>
                    <th>Operación</th>
                    <th>Valor Anterior</th>
                    <th>Valor Nuevo</th>
                    <th>Fecha</th>
                    <th>Usuario</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Iterar sobre los registros y mostrarlos en la tabla
                    for (String[] registro : registros) {
                %>
                    <tr>
                        <td><%= registro[0] %></td>
                        <td><%= registro[1] %></td>
                        <td><%= registro[2] %></td>
                        <td><%= registro[3] %></td>
                        <td><%= registro[4] %></td>
                        <td><%= registro[5] %></td>
                    </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
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
