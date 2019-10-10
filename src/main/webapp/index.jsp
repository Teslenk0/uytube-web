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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Responsive sidebar template with sliding effect and dropdown menu based on bootstrap 3">
    <title>Sidebar template</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>

<body>
    <%
        //allow access only if session exists
        String user = null;
        if (session.getAttribute("nickname") == null) {
            response.sendRedirect("login.jsp");
        } else {
            user = (String) session.getAttribute("nickname");
        }
        String userName = null;
        String sessionID = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("nickname")) {
                    userName = cookie.getValue();
                }
                if (cookie.getName().equals("JSESSIONID")) {
                    sessionID = cookie.getValue();
                }
            }
        }
    %>
    
    <!-- BARRA SUPERIOR -->
    <div class="barra_superior" style="width: 100% ;  background-color: #121212">
        <a class="navbar-brand" href="index.jsp" style="margin-left: 45%"> <img src="assets/images/logo2.png" width="112" height="auto"></a>
        <div class="navbar-brand">
            <ul class="navbar-nav mr-auto">
                <a class="navbar" Href="login.jsp" style="margin-left: 90%"> Iniciar Sesion </a>
            </ul>
        </div>
    </div>


    <!-- ACA BARRA LATERAL -->
    <div class="page-wrapper chiller-theme toggled">
        <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
            <i class="fas fa-bars"></i>
        </a>
        <nav id="sidebar" class="sidebar-wrapper">
            <div class="sidebar-content">
                <div class="sidebar-brand">
                    <a href="#">UyTube</a>
                    <div id="close-sidebar">
                        <i class="fas fa-times"></i>
                    </div>
                </div>
                <div class="sidebar-header">
                    <div class="user-pic">
                        <img class="img-responsive img-rounded" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg"
                             alt="User picture">
                    </div>
                    <div class="user-info">
          <span class="user-name">
            <strong>Invitado</strong>
          </span>

                        <span class="user-status">
            <i class="fa fa-circle"></i>
            <span>Online</span>
          </span>
                    </div>
                </div>
                <!-- sidebar-header  -->
                <div class="sidebar-search">
                    <div>
                        <div class="input-group">
                            <input type="text" class="form-control search-menu" placeholder="Search...">
                            <div class="input-group-append">
              <span class="input-group-text">
                <i class="fa fa-search" aria-hidden="true"></i>
              </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- sidebar-search  -->
                <div class="sidebar-menu">
                    <ul>
                        <li class="header-menu">
                            <span>General</span>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#">
                                <i class="fa fa-tachometer-alt"></i>
                                <span>Dashboard</span>
                                <span class="badge badge-pill badge-warning">New</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="#">Dashboard 1
                                            <span class="badge badge-pill badge-success">Pro</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Dashboard 2</a>
                                    </li>
                                    <li>
                                        <a href="#">Dashboar<header class="header">
                                            <nav class="navbar navbar-toggleable-md navbar-light pt-0 pb-0 ">
                                                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                                                    <span class="navbar-toggler-icon"></span>
                                                </button>
                                                <a class="navbar-brand p-0 mr-5" href="#"><img src="http://via.placeholder.com/61x14"></a>
                                                <div class="float-left"> <a href="#" class="button-left"><span class="fa fa-fw fa-bars "></span></a> </div>
                                                <div class="collapse navbar-collapse flex-row-reverse" id="navbarNavDropdown">
                                                    <ul class="navbar-nav">
                                                        <li class="nav-item dropdown messages-menu">
                                                            <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="fa fa-bell-o"></i>
                                                                <span class="label label-success bg-success">10</span>
                                                            </a>
                                                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                                                <ul class="dropdown-menu-over list-unstyled">
                                                                    <li class="header-ul text-center">You have 4 messages</li>
                                                                    <li>
                                                                        <!-- inner menu: contains the actual data -->
                                                                        <ul class="menu list-unstyled">
                                                                            <li><!-- start message -->
                                                                                <a href="#">
                                                                                    <div class="pull-left">
                                                                                        <img src="http://via.placeholder.com/160x160" class="rounded-circle  " alt="User Image">
                                                                                    </div>
                                                                                    <h4>
                                                                                        Support Team
                                                                                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                                                                                    </h4>
                                                                                    <p>Why not buy a new awesome theme?</p>
                                                                                </a>
                                                                            </li>
                                                                            <!-- end message -->
                                                                            <li>
                                                                                <a href="#">
                                                                                    <div class="pull-left">
                                                                                        <img src="http://via.placeholder.com/160x160" class="rounded-circle " alt="User Image">
                                                                                    </div>
                                                                                    <h4>
                                                                                        AdminLTE Design Team
                                                                                        <small><i class="fa fa-clock-o"></i> 2 hours</small>
                                                                                    </h4>
                                                                                    <p>Why not buy a new awesome theme?</p>
                                                                                </a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="#">
                                                                                    <div class="pull-left">
                                                                                        <img src="http://via.placeholder.com/160x160" class="rounded-circle " alt="User Image">
                                                                                    </div>
                                                                                    <h4>
                                                                                        Developers
                                                                                        <small><i class="fa fa-clock-o"></i> Today</small>
                                                                                    </h4>
                                                                                    <p>Why not buy a new awesome theme?</p>
                                                                                </a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="#">
                                                                                    <div class="pull-left">
                                                                                        <img src="http://via.placeholder.com/160x160" class="rounded-circle " alt="User Image">
                                                                                    </div>
                                                                                    <h4>
                                                                                        Sales Department
                                                                                        <small><i class="fa fa-clock-o"></i> Yesterday</small>
                                                                                    </h4>
                                                                                    <p>Why not buy a new awesome theme?</p>
                                                                                </a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="#">
                                                                                    <div class="pull-left">
                                                                                        <img src="http://via.placeholder.com/160x160" class="rounded-circle " alt="User Image">
                                                                                    </div>
                                                                                    <h4>
                                                                                        Reviewers
                                                                                        <small><i class="fa fa-clock-o"></i> 2 days</small>
                                                                                    </h4>
                                                                                    <p>Why not buy a new awesome theme?</p>
                                                                                </a>
                                                                            </li>
                                                                        </ul>
                                                                    </li>
                                                                    <li class="footer-ul text-center"><a href="#">See All Messages</a></li>
                                                                </ul>
                                                            </div>
                                                        </li>
                                                        <li class="nav-item dropdown notifications-menu">
                                                            <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="fa fa-envelope-o"></i>
                                                                <span class="label label-warning bg-warning">10</span>
                                                            </a>
                                                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                                                <ul class="dropdown-menu-over list-unstyled">
                                                                    <li class="header-ul text-center">You have 10 notifications</li>
                                                                    <li>
                                                                        <!-- inner menu: contains the actual data -->
                                                                        <ul class="menu list-unstyled">
                                                                            <li>
                                                                                <a href="#">
                                                                                    <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                                                                </a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="#">
                                                                                    <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the
                                                                                    page and may cause design problems
                                                                                </a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="#">
                                                                                    <i class="fa fa-users text-red"></i> 5 new members joined
                                                                                </a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="#">
                                                                                    <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                                                                                </a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="#">
                                                                                    <i class="fa fa-user text-red"></i> You changed your username
                                                                                </a>
                                                                            </li>
                                                                        </ul>
                                                                    </li>
                                                                    <li class="footer-ul text-center"><a href="#">View all</a></li>
                                                                </ul>
                                                            </div>
                                                        </li>

                                                        <li class="nav-item dropdown  user-menu">
                                                            <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <img src="http://via.placeholder.com/160x160" class="user-image" alt="User Image" >
                                                                <span class="hidden-xs">bootstrap develop</span>
                                                            </a>
                                                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                                                <a class="dropdown-item" href="#">Action</a>
                                                                <a class="dropdown-item" href="#">Another action</a>
                                                                <a class="dropdown-item" href="#">Something else here</a>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </nav>
                                        </header>
                                            <div class="main">
                                                <aside>
                                                    <div class="sidebar left ">
                                                        <div class="user-panel">
                                                            <div class="pull-left image">
                                                                <img src="http://via.placeholder.com/160x160" class="rounded-circle" alt="User Image">
                                                            </div>
                                                            <div class="pull-left info">
                                                                <p>bootstrap develop</p>
                                                                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                                                            </div>
                                                        </div>
                                                        <ul class="list-sidebar bg-defoult">
                                                            <li> <a href="#" data-toggle="collapse" data-target="#dashboard" class="collapsed active" > <i class="fa fa-th-large"></i> <span class="nav-label"> Dashboards </span> <span class="fa fa-chevron-left pull-right"></span> </a>
                                                                <ul class="sub-menu collapse" id="dashboard">
                                                                    <li class="active"><a href="#">CSS3 Animation</a></li>
                                                                    <li><a href="#">General</a></li>
                                                                    <li><a href="#">Buttons</a></li>
                                                                    <li><a href="#">Tabs & Accordions</a></li>
                                                                    <li><a href="#">Typography</a></li>
                                                                    <li><a href="#">FontAwesome</a></li>
                                                                    <li><a href="#">Slider</a></li>
                                                                    <li><a href="#">Panels</a></li>
                                                                    <li><a href="#">Widgets</a></li>
                                                                    <li><a href="#">Bootstrap Model</a></li>
                                                                </ul>
                                                            </li>
                                                            <li> <a href="#"><i class="fa fa-diamond"></i> <span class="nav-label">Layouts</span></a> </li>
                                                            <li> <a href="#" data-toggle="collapse" data-target="#products" class="collapsed active" > <i class="fa fa-bar-chart-o"></i> <span class="nav-label">Graphs</span> <span class="fa fa-chevron-left pull-right"></span> </a>
                                                                <ul class="sub-menu collapse" id="products">
                                                                    <li class="active"><a href="#">CSS3 Animation</a></li>
                                                                    <li><a href="#">General</a></li>
                                                                    <li><a href="#">Buttons</a></li>
                                                                    <li><a href="#">Tabs & Accordions</a></li>
                                                                    <li><a href="#">Typography</a></li>
                                                                    <li><a href="#">FontAwesome</a></li>
                                                                    <li><a href="#">Slider</a></li>
                                                                    <li><a href="#">Panels</a></li>
                                                                    <li><a href="#">Widgets</a></li>
                                                                    <li><a href="#">Bootstrap Model</a></li>
                                                                </ul>
                                                            </li>
                                                            <li> <a href="#"><i class="fa fa-laptop"></i> <span class="nav-label">Grid options</span></a> </li>
                                                            <li> <a href="#" data-toggle="collapse" data-target="#tables" class="collapsed active" ><i class="fa fa-table"></i> <span class="nav-label">Tables</span><span class="fa fa-chevron-left pull-right"></span></a>
                                                                <ul  class="sub-menu collapse" id="tables" >
                                                                    <li><a href=""> Static Tables</a></li>
                                                                    <li><a href=""> Data Tables</a></li>
                                                                    <li><a href=""> Foo Tables</a></li>
                                                                    <li><a href=""> jqGrid</a></li>
                                                                </ul>
                                                            </li>
                                                            <li> <a href="#" data-toggle="collapse" data-target="#e-commerce" class="collapsed active" ><i class="fa fa-shopping-cart"></i> <span class="nav-label">E-commerce</span><span class="fa fa-chevron-left pull-right"></span></a>
                                                                <ul  class="sub-menu collapse" id="e-commerce" >
                                                                    <li><a href=""> Products grid</a></li>
                                                                    <li><a href=""> Products list</a></li>
                                                                    <li><a href="">Product edit</a></li>
                                                                    <li><a href=""> Product detail</a></li>
                                                                    <li><a href="">Cart</a></li>
                                                                    <li><a href=""> Orders</a></li>
                                                                    <li><a href=""> Credit Card form</a> </li>
                                                                </ul>
                                                            </li>
                                                            <li> <a href=""><i class="fa fa-pie-chart"></i> <span class="nav-label">Metrics</span> </a></li>
                                                            <li> <a href="#"><i class="fa fa-files-o"></i> <span class="nav-label">Other Pages</span></a> </li>
                                                            <li> <a href="#"><i class="fa fa-files-o"></i> <span class="nav-label">Other Pages</span></a> </li>
                                                            <li> <a href="#"><i class="fa fa-files-o"></i> <span class="nav-label">Other Pages</span></a> </li>
                                                            <li> <a href="#"><i class="fa fa-files-o"></i> <span class="nav-label">Other Pages</span></a> </li>
                                                            <li> <a href="#"><i class="fa fa-files-o"></i> <span class="nav-label">Other Pages</span></a> </li>
                                                        </ul>
                                                    </div>
                                                </aside>
                                            </div>
                                            <script type="text/javascript" src="/assets/js/barralateral_index.js"></script>d 3</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#">
                                <i class="fa fa-shopping-cart"></i>
                                <span>E-commerce</span>
                                <span class="badge badge-pill badge-danger">3</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="#">Products

                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Orders</a>
                                    </li>
                                    <li>
                                        <a href="#">Credit cart</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#">
                                <i class="far fa-gem"></i>
                                <span>Components</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="#">General</a>
                                    </li>
                                    <li>
                                        <a href="#">Panels</a>
                                    </li>
                                    <li>
                                        <a href="#">Tables</a>
                                    </li>
                                    <li>
                                        <a href="#">Icons</a>
                                    </li>
                                    <li>
                                        <a href="#">Forms</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#">
                                <i class="fa fa-chart-line"></i>
                                <span>Charts</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="#">Pie chart</a>
                                    </li>
                                    <li>
                                        <a href="#">Line chart</a>
                                    </li>
                                    <li>
                                        <a href="#">Bar chart</a>
                                    </li>
                                    <li>
                                        <a href="#">Histogram</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#">
                                <i class="fa fa-globe"></i>
                                <span>Maps</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="#">Google maps</a>
                                    </li>
                                    <li>
                                        <a href="#">Open street map</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="header-menu">
                            <span>Extra</span>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-book"></i>
                                <span>Documentation</span>
                                <span class="badge badge-pill badge-primary">Beta</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-calendar"></i>
                                <span>Calendar</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-folder"></i>
                                <span>Examples</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- sidebar-menu  -->
            </div>
            <!-- sidebar-content  -->
            <div class="sidebar-footer">
                <a href="#">
                    <i class="fa fa-bell"></i>
                    <span class="badge badge-pill badge-warning notification">3</span>
                </a>
                <a href="#">
                    <i class="fa fa-envelope"></i>
                    <span class="badge badge-pill badge-success notification">7</span>
                </a>
                <a href="#">
                    <i class="fa fa-cog"></i>
                    <span class="badge-sonar"></span>
                </a>
                <a href="#">
                    <i class="fa fa-power-off"></i>
                </a>
            </div>
        </nav>
        <!-- sidebar-wrapper  -->
        <main class="page-content">
            <div class="container-fluid">
                <h2>Pro Sidebar</h2>
                <hr>
                <div class="row">
                    <div class="form-group col-md-12">
                        <p>This is a responsive sidebar template with dropdown menu based on bootstrap 4 framework.</p>
                        <p> You can find the complete code on <a href="https://github.com/azouaoui-med/pro-sidebar-template" target="_blank">
                            Github</a>, it contains more themes and background image option</p>
                    </div>
                    <div class="form-group col-md-12">
                        <iframe src="https://ghbtns.com/github-btn.html?user=azouaoui-med&repo=pro-sidebar-template&type=star&count=true&size=large"
                                frameborder="0" scrolling="0" width="140px" height="30px"></iframe>
                        <iframe src="https://ghbtns.com/github-btn.html?user=azouaoui-med&repo=pro-sidebar-template&type=fork&count=true&size=large"
                                frameborder="0" scrolling="0" width="140px" height="30px"></iframe>
                    </div>
                </div>
                <h5>More templates</h5>
                <hr>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="card rounded-0 p-0 shadow-sm">
                            <img src="https://user-images.githubusercontent.com/25878302/58369568-a49b2480-7efc-11e9-9ca9-2be44afacda1.png" class="card-img-top rounded-0" alt="Angular pro sidebar">
                            <div class="card-body text-center">
                                <h6 class="card-title">Angular Pro Sidebar</h6>
                                <a href="https://github.com/azouaoui-med/angular-pro-sidebar" target="_blank" class="btn btn-primary btn-sm">Github</a>
                                <a href="https://azouaoui-med.github.io/angular-pro-sidebar/demo/" target="_blank" class="btn btn-success btn-sm">Preview</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="card rounded-0 p-0 shadow-sm">
                            <img src="https://user-images.githubusercontent.com/25878302/58369258-33f20900-7ef8-11e9-8ff3-b277cb7ed7b4.PNG" class="card-img-top rounded-0" alt="Angular pro sidebar">
                            <div class="card-body text-center">
                                <h6 class="card-title">Angular Dashboard</h6>
                                <a href="https://github.com/azouaoui-med/lightning-admin-angular" target="_blank" class="btn btn-primary btn-sm">Github</a>
                                <a href="https://azouaoui-med.github.io/lightning-admin-angular/demo/" target="_blank" class="btn btn-success btn-sm">Preview</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </main>
        <!-- page-content" -->
    </div>
    <!-- page-wrapper -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</body>

</html>