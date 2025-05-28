<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,com.productos.datos.*" %>
<%
    String idUsuarioStr = request.getParameter("id_us");
    if (idUsuarioStr == null) {
        response.sendRedirect("usuario.jsp"); // Redirige si no hay ID
        return;
    }

    int idUsuario = Integer.parseInt(idUsuarioStr);
    Conexion con = new Conexion();
    ResultSet rs = con.Consulta("SELECT * FROM tb_usuario WHERE id_us = " + idUsuario);
    String nombre = "", cedula = "", correo = "", clave = "";
    int perfil = 0, estadoCivil = 0;

    if (rs != null && rs.next()) {
        nombre = rs.getString("nombre_us");
        cedula = rs.getString("cedula_us");
        correo = rs.getString("correo_us");
        clave = rs.getString("clave_us");
        perfil = rs.getInt("id_per");
        estadoCivil = rs.getInt("id_est");
    } else {
%>
        <p>Usuario no encontrado.</p>
<%
        return;
    }
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
<main>
<h2>Editar Usuario</h2>
    <form action="actualizarUsuario.jsp" method="post">
        <input type="hidden" name="id_us" value="<%= idUsuario %>">

        <label>Nombre completo:</label><br>
        <input type="text" name="nombre_us" value="<%= nombre %>" required><br>

        <label>Cédula:</label><br>
        <input type="text" name="cedula_us" value="<%= cedula %>" required><br>

        <label>Correo electrónico:</label><br>
        <input type="email" name="correo_us" value="<%= correo %>" required><br>

        <label>Contraseña:</label><br>
        <input type="password" id="clave" name="txtClave" required />
        <!-- Checkbox para mostrar/ocultar la contraseña -->
        <input type="checkbox" id="mostrarClave" onclick="togglePassword()"> Mostrar clave
         <br>                   
        <label>Perfil:</label><br>
        <select name="id_per" required>
            <option value="1" <%= perfil == 1 ? "selected" : "" %>>Administrador</option>
            <option value="2" <%= perfil == 2 ? "selected" : "" %>>Cliente</option>
            <option value="3" <%= perfil == 3 ? "selected" : "" %>>Vendedor</option>
        </select><br>

        <label>Estado civil:</label><br>
        <select name="id_est" required>
            <option value="1" <%= estadoCivil == 1 ? "selected" : "" %>>Casado</option>
            <option value="2" <%= estadoCivil == 2 ? "selected" : "" %>>Soltero</option>
            <option value="3" <%= estadoCivil == 3 ? "selected" : "" %>>Divorciado</option>
            <option value="4" <%= estadoCivil == 4 ? "selected" : "" %>>Viudo</option>
        </select><br><br>

        <input type="submit" value="Actualizar Usuario">
        <a href="usuarios.jsp">Cancelar</a>
    </form>
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
        // Función para alternar entre mostrar y ocultar la contraseña
        function togglePassword() {
            var passwordField = document.getElementById("clave");
            var showPassword = document.getElementById("mostrarClave");

            if (showPassword.checked) {
                passwordField.type = "text";  // Muestra la contraseña
            } else {
                passwordField.type = "password";  // Oculta la contraseña
            }
        }

        // Función para validar que la clave tenga al menos 8 caracteres
        function validarClave() {
            var clave = document.getElementById("clave").value;

            if (clave.length < 8) {
                alert("La clave debe tener al menos 8 caracteres.");
                return false;  // Evita el envío del formulario si la clave no es válida
            }
            return true;  // Permite el envío del formulario si la clave es válida
        }

        const toggleBtn = document.getElementById("toggle-theme");
        toggleBtn.addEventListener("click", () => {
            document.body.classList.toggle("light-mode");
            toggleBtn.textContent = document.body.classList.contains("light-mode") ? "Modo Oscuro" : "Modo Claro";
        });
    </script>   
</body>
</html>
