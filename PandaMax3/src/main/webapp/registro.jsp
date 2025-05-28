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
            <form action="nuevoCliente.jsp" method="post" onsubmit="return validarClave() && validarEdad();">
                <table>
                    <tr><td>Nombre completo:</td><td><input type="text" id="nombre" name="txtNombre" required/></td></tr>
                    <tr><td>Cédula:</td><td><input type="text" id="cedula" name="txtCedula" maxlength="10" required/></td></tr>
                    <tr>
                        <td>Estado civil:</td>
                        <td>
                            <select id="estado" name="cmbEstado" required>
                                <option value="0">Seleccionar</option>
                                <option value="2">Soltero</option>
                                <option value="1">Casado</option>
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

                    <!-- Campo para la fecha de nacimiento -->
                    <tr><td>Fecha de nacimiento:</td><td><input type="month" id="fecha" name="mFecha" required></td></tr>

                    <tr><td>Color Favorito:</td><td><input type="color" id="color" name="cColor"/></td></tr>
                    <tr><td>Correo Electronico:</td><td> <input type="email" id="email" name="txtEmail" placeholder="usuario@gmail.com" required /> </td></tr>
                    <tr>
                        <td>Clave:</td>
                        <td> 
                            <input type="password" id="clave" name="txtClave" required />
                            <!-- Checkbox para mostrar/ocultar la contraseña -->
                            <input type="checkbox" id="mostrarClave" onclick="togglePassword()"> Mostrar clave
                        </td>
                    </tr>                    
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

        // Función para validar la edad
        function validarEdad() {
            var fechaNacimiento = document.getElementById("fecha").value;

            if (fechaNacimiento) {
                // Obtener la fecha de nacimiento en formato YYYY-MM
                var [year, month] = fechaNacimiento.split("-");

                // Crear un objeto de fecha con la fecha de nacimiento
                var fecha = new Date(year, month - 1);

                // Calcular la edad
                var edad = calcularEdad(fecha);

                // Verificar si la edad es mayor o igual a 18 años
                if (edad < 18) {
                    alert("Debes tener al menos 18 años para registrarte.");
                    return false;  // Evita el envío del formulario si la persona tiene menos de 18 años
                }
            }

            return true;  // Permite el envío del formulario si la edad es válida
        }

        // Función para calcular la edad a partir de la fecha de nacimiento
        function calcularEdad(fechaNacimiento) {
            var hoy = new Date();
            var edad = hoy.getFullYear() - fechaNacimiento.getFullYear();
            var m = hoy.getMonth() - fechaNacimiento.getMonth();

            // Ajuste si la fecha de nacimiento aún no ha llegado este año
            if (m < 0 || (m === 0 && hoy.getDate() < fechaNacimiento.getDate())) {
                edad--;
            }

            return edad;
        }

        // Cambiar entre modo claro y oscuro
        const toggleBtn = document.getElementById("toggle-theme");
        toggleBtn.addEventListener("click", () => {
            document.body.classList.toggle("light-mode");
            toggleBtn.textContent = document.body.classList.contains("light-mode") ? "Modo Oscuro" : "Modo Claro";
        });
    </script>
</body>
</html>
