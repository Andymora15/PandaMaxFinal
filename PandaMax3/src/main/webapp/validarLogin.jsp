<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1" session="true" import="com.productos.seguridad.*" %>

<%
String nlogin = request.getParameter("txtUser");
String nclave = request.getParameter("txtClaveLog");
HttpSession sesion = request.getSession();

usuario u = usuario.verificarUsuario(nlogin, nclave);
if (u != null) {
    sesion.setAttribute("usuario", u.getNombre());
    sesion.setAttribute("perfil", u.getPerfil());
    response.sendRedirect("menu.jsp");
} else {
%>
    <jsp:forward page="login.jsp">
        <jsp:param name="error" value="Datos incorrectos.<br/>Vuelva a intentarlo."/>
    </jsp:forward>
<%
}
%>
