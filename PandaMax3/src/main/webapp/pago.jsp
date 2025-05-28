<%@ page import="java.util.*, java.sql.*, com.productos.datos.Conexion" %>
<%@ page session="true" %>
<%
    List<Map<String, Object>> carrito = (List<Map<String, Object>>) session.getAttribute("carrito");
    Conexion cn = new Conexion();
    Connection con = cn.getConexion();
    boolean stockSuficiente = true;
    List<String> errores = new ArrayList<>();

    if (carrito == null || carrito.isEmpty()) {
        out.println("El carrito está vacío.");
        return;
    }

    try {
        for (Map<String, Object> producto : carrito) {
            Object idObj = producto.get("id_pr");
            Object cantidadObj = producto.get("cantidad");

            // Verificar que id_pr y cantidad no sean null
            if (idObj == null || cantidadObj == null) {
                stockSuficiente = false;
                errores.add("Producto con datos inválidos en el carrito.");
                continue;
            }

            int id = ((Integer) idObj).intValue();
            int cantidad = ((Integer) cantidadObj).intValue();

            String consulta = "SELECT cantidad_pr, nombre_pr FROM tb_producto WHERE id_pr = " + id;
            ResultSet rs = cn.Consulta(consulta);

            if (rs.next()) {
                int stock = rs.getInt("cantidad_pr");
                String nombre = rs.getString("nombre_pr");

                if (cantidad > stock) {
                    stockSuficiente = false;
                    errores.add("Stock insuficiente para: " + nombre);
                }
            } else {
                stockSuficiente = false;
                errores.add("Producto con ID " + id + " no encontrado.");
            }
        }

        // Procesar compra si stock es suficiente
        if (stockSuficiente) {
            for (Map<String, Object> producto : carrito) {
                Integer id = (Integer) producto.get("id_pr");
                Integer cantidad = (Integer) producto.get("cantidad");

                // Validar que id y cantidad no sean null
                if (id != null && cantidad != null) {
                    String actualizar = "UPDATE tb_producto SET cantidad_pr = cantidad_pr - " + cantidad + " WHERE id_pr = " + id;
                    cn.Ejecutar(actualizar);
                }
            }

            session.removeAttribute("carrito"); // Vaciar carrito después de compra
            out.println("<h2>Compra realizada con exito</h2>");
        } else {
            out.println("<h2>Error en la compra</h2>");
            for (String error : errores) {
                out.println("<p>" + error + "</p>");
            }
        }
    } catch (Exception e) {
        out.println("Error inesperado: " + e.getMessage());
    }
    


    
%>