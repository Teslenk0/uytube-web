<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"
        id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="assets/css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- cosas barra lateral
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->

    <!------ Include the above in your HEAD tag
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">---------->
</head>

<body>

    <!-- BARRA SUPERIOR -->
    <nav class="navbar navbar-expand-lg navbar-dark" style="background: #312A25">
        <a class="navbar-brand" href="index.jsp"> <img src="assets/images/logo2.png" width="112" height="auto"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Iniciar Sesion</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Registrar</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Buscar" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
            </form>
        </div>
    </nav>



    <!-- ACA BARRA LATERAL -->
    <div class="container">
        <div class="row">
            
            <div id="wrapper">



                <!-- Sidebar -->
                <div id="sidebar-wrapper">
                    <ul class="sidebar-nav" style="margin-left:0;">
                        <li class="sidebar-brand">

                            <a href="#menu-toggle" id="menu-toggle" style="margin-top:20px;float:right;"> <i
                                    class="fa fa-bars " style="font-size:20px !Important;" aria-hidden="true"
                                    aria-hidden="true"></i>

                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sort-alpha-asc " aria-hidden="true"> </i> <span
                                    style="margin-left:10px;">Section</span> </a>
                        </li>
                        <li>
                            <a href="#"> <i class="fa fa-play-circle-o " aria-hidden="true"> </i> <span
                                    style="margin-left:10px;"> Section</span> </a>
                        </li>
                        <li>
                            <a href="#"> <i class="fa fa-puzzle-piece" aria-hidden="true"> </i> <span
                                    style="margin-left:10px;"> Section</span> </a>
                        </li>
                        <li>
                            <a href="#"> <i class="fa fa-font" aria-hidden="true"> </i> <span style="margin-left:10px;">
                                    Section</span> </a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-info-circle " aria-hidden="true"> </i> <span
                                    style="margin-left:10px;">Section </span> </a>
                        </li>
                        <li>
                            <a href="#"> <i class="fa fa-comment-o" aria-hidden="true"> </i> <span
                                    style="margin-left:10px;"> Section</span> </a>
                        </li>
                    </ul>
                </div>
                <!-- /#sidebar-wrapper -->

                <!-- Page Content -->
                <div id="page-content-wrapper">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">



                                </a>




                                <!-- /#page-content-wrapper -->


                                <!-- /#wrapper -->


                                <script>
                                    $("#menu-toggle").click(function (e) {
                                        e.preventDefault();
                                        $("#wrapper").toggleClass("toggled");
                                    });
                                </script>



                            </div>
                        </div>
</body>

</html>