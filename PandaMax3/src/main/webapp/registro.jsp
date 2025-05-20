<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>PandaMax - Registro</title>
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
            <li><a href="index.jsp">Inicio</a></li>  
            <li><a href="categoria.jsp">Buscar Por Categoria</a></li>
        </ul>
    </nav>

    <main>
        <div id="content">
            <h2>Formulario de Registro</h2>
            <form action="nuevoCliente.jsp" method="post">
                <table>
                    <tr><td>Nombre completo:</td><td><input type="text" id=”nombre” name="txtNombre" required/></td></tr>
                    <tr><td>Cédula:</td><td><input type="text" id="cedula" name="txtCedula" maxlength="10" required/></td></tr>
                    <tr>
                        <td>Estado civil:</td>
                        <td>
                            <select id="estado" name="cmbEstado" required>
                                <option value="0">Seleccionar</option>
                                <option value="1">Soltero</option>
                                <option value="2">Casado</option>
                                <option value="3">Divorciado</option>
                                <option value="4">Viudo</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                    	<td>Lugar de Residencia:</td>
                    	<td>
                    		<input type="radio" id="residencia" name="rdResidencia" value="Sur"/>Sur
							<input type="radio" id="residencia" name="rdResidencia" value="Norte"/>Norte
							<input type="radio" id="residencia" name="rdResidencia" value="Centro"/>Centro
                    	</td>
                    </tr>
                    <tr><td>Foto:</td><td><input type="file" id="foto" name="fileFoto" accept=".jpg, .jpeg, .png"/></td></tr>                                        
                    <tr><td>Fecha de nacimiento:</td><td><input type="month" id="fecha" name="mFecha" required></td></tr>
                    <tr><td>Color Favorito:</td><td><input type="color" id="color" name="cColor"/></td></tr>
                    <tr><td>Correo Electronico:</td><td> <input type="email" id="email" name="txtEmail" placeholder="usuario@gmail.com" /> </td></tr>
                    <tr><td>Clave:</td><td> <input type="password" id="clave" name="txtClave" /> </td></tr>                    
                    <tr>
                        <td><input type="submit" value="Registrar"></td>
                        <td><input type="reset" value="Limpiar"></td>
                    </tr>
                </table>
            </form>
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
