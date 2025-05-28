<%
    HttpSession sesion = request.getSession();
    sesion.removeAttribute("carrito");
    response.sendRedirect("carrito.jsp");
%>