<%@ page import="java.util.*, com.productos.negocio.ProductoCarrito" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String nombre = request.getParameter("nombre");
    double precio = Double.parseDouble(request.getParameter("precio"));
    int cantidad = Integer.parseInt(request.getParameter("cantidad"));

    HttpSession sesion = request.getSession();
    List<ProductoCarrito> carrito = (List<ProductoCarrito>) sesion.getAttribute("carrito");

    if (carrito == null) {
        carrito = new ArrayList<>();
    }

    boolean encontrado = false;
    for (ProductoCarrito prod : carrito) {
        if (prod.getId() == id) {
            prod.setCantidad(prod.getCantidad() + cantidad);
            encontrado = true;
            break;
        }
    }

    if (!encontrado) {
        carrito.add(new ProductoCarrito(id, nombre, precio, cantidad));
    }

    sesion.setAttribute("carrito", carrito);
    response.sendRedirect("carrito.jsp");
%>