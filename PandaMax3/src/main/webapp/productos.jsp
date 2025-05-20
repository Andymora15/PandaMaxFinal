<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, com.productos.negocio.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/c1.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <header>
    	<a href="index.jsp"><img alt="Logo" src="iconos/logo.png" class="logo"></a>
        <h1 >PandaMax</h1>
        <p>Tu centro de soluciones técnicas</p>
    	<button id="toggle-theme">Cambiar Tema</button>
    </header>
<main>
        <div class="container">
        <h2 class="mt-4">Ingresar Productos</h2>
        <form>
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre">
            </div>
            
            <div class="mb-3">
                <label for="categoria" class="form-label">Categoría </label>
                <%
            		categoria cat = new categoria();
            		String categoriaSeleccionada = request.getParameter("cmbCategoria");
       		 	%>
            	<%= cat.mostrarCategoria() %>
       		 	
            </div>
            
            <div class="mb-3">
                <label for="cantidad" class="form-label">Cantidad</label>
                <select class="form-select" id="cantidad" name="cantidad">
                    <option selected>Seleccione cantidad</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
            
            <div class="mb-3">
                <label for="precio" class="form-label">Precio</label>
                <input type="text" class="form-control" id="precio" name="precio" placeholder="Ingrese el precio">
            </div>
            
            <div class="mb-3">
                <label for="foto" class="form-label">Foto</label>
                <div class="input-group">
                    <input type="file" class="form-control" id="foto" name="foto">
                    <button class="btn btn-outline-secondary" type="button">Subir</button>
                </div>
            </div>
            
            <div class="mb-3">
                <button type="submit" class="btn btn-primary me-2">Enviar</button>
                <button type="reset" class="btn btn-secondary">Borrar</button>
            </div>
        </form>
        
        <h3 class="mt-5">Lista de Productos</h3>
        <table class="table table-bordered">
            <!--
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Producto</th>
                    <th>Categoría</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                    <th>Foto</th>
                    <th>Actualizar</th>
                    <th>Eliminar</th>
                </tr>
            </thead>-->
            
            <tbody>
            	<%product pr=new product();
                	out.print(pr.reporteProducto());		
                %>
            </tbody>
        </table>
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
	
        	// Cambia el texto del botón
        	if (document.body.classList.contains("light-mode")) {
        	    toggleBtn.textContent = "Modo Oscuro";
        	} else {
        	    toggleBtn.textContent = "Modo Claro";
        	}
   		});
	</script>
</body>
</html>