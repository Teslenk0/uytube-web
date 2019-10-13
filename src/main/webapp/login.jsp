<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesion</title>
    <link rel="stylesheet" type="text/css" href="assets/css/bulma.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="assets/js/jquery-3.4.1.min.js"></script>
</head>

<body>
    <section class="hero is-dark is-fullheight">
        <div class="hero-body">
            <div class="container">
                <div class="columns is-centered">
                    <div class="column is-5-tablet is-4-desktop is-3-widescreen has-text-centered">
                        <img src="assets/images/logo.png" alt="Logo de UyTube">
                        <h1 class="title">Iniciar Sesion</h1>
                        <form class="box" method="post" action="LoginServlet" id="loginForm">
                            <div class="field" id="boxUsuario">
                                <label class="label">Usuario</label>
                                <div class="control has-icons-left">
                                    <input name="inputUser" id="inputUser" placeholder="Usuario" class="input"
                                        oninvalid="this.setCustomValidity('Debe ingresar su nickname')" required>
                                    <span class="icon is-small is-left">
                                        <i class="fa fa-user icon"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="field">
                                <label for="inputPassword" class="label">Contraseña</label>
                                <div class="control has-icons-left">
                                    <input type="password" name="inputPassword" id="inputPassword" placeholder="*******"
                                        class="input" oninvalid="this.setCustomValidity('Debe ingresar su Password')"
                                        required>
                                    <span class="icon is-small is-left">
                                        <i class="fa fa-lock icon"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="field">
                                <button type="submit" class="button is-success" id="submitForm">
                                    Iniciar Sesion
                                </button>
                            </div>
                            <div class="field">
                                <a href="registrarT.jsp">Registrarse</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="assets/js/login.js"></script>
</body>

</html>