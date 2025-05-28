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
<body>
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
        <input type="password" name="clave_us" value="<%= clave %>" required><br>

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
</body>
</html>
