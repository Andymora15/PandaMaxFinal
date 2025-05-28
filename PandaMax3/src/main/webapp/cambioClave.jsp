<%@ page import="java.sql.*, com.productos.datos.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    String correo = request.getParameter("correo_us");
    String nuevaClave1 = request.getParameter("clave_nueva1");
    String nuevaClave2 = request.getParameter("clave_nueva2");

    if (correo == null || nuevaClave1 == null || nuevaClave2 == null ||
        correo.isEmpty() || nuevaClave1.isEmpty() || nuevaClave2.isEmpty()) {
%>
        <p>Todos los campos son obligatorios.</p>
        <a href="formularioCambioClave.jsp">Volver</a>
<%
        return;
    }

    if (!nuevaClave1.equals(nuevaClave2)) {
%>
        <p>Las contraseñas no coinciden. Intenta nuevamente.</p>
        <a href="formularioCambioClave.jsp">Volver</a>
<%
        return;
    }

    // Validar que el usuario existe
    Conexion con = new Conexion();
    ResultSet rs = con.Consulta("SELECT * FROM tb_usuario WHERE correo_us = '" + correo + "'");
    if (!rs.next()) {
%>
        <p>El correo no está registrado.</p>
        <a href="formularioCambioClave.jsp">Volver</a>
<%
        return;
    }

    // Actualizar contraseña
    String sql = "UPDATE tb_usuario SET clave_us = ? WHERE correo_us = ?";
    PreparedStatement ps = con.getConexion().prepareStatement(sql);
    ps.setString(1, nuevaClave1);
    ps.setString(2, correo);

    int filas = ps.executeUpdate();
    ps.close();

    if (filas > 0) {
%>
        <p>Contraseña actualizada exitosamente.</p>
        <a href="index.jsp">Iniciar sesión</a>
<%
    } else {
%>
        <p>Error al actualizar la contraseña.</p>
        <a href="formularioCambioClave.jsp">Volver</a>
<%
    }
%>
