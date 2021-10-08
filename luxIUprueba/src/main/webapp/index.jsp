<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>DLuxMultiProyectos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/metisMenu.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/slicknav.min.css">
    
    <!-- amchart css -->
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- others css -->
    <link rel="stylesheet" href="assets/css/typography.css">
    <link rel="stylesheet" href="assets/css/default-css.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
    <!-- modernizr css -->
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
    
    <!--DataTable CSS basico-->
    <!--<link href="assets/datatable/DataTables-1.10.25/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>-->
    <!--DataTable css con Bootstrap 4 -->
    <!--<link rel ="stylesheet" type="text/css" href="assets/datatable/DataTables-1.10.25/css/dataTables.bootstrap4.min.css"/>-->
    
</head>

    <%
        String rolOpc = request.getParameter("rolOpc");
        String UsuLinea = session.getAttribute("cedula").toString();
        String rolUsuario = session.getAttribute("rol").toString();
        String q = "";
    %>  

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!-- preloader area start -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
    <!-- page container area start -->
    <div class="page-container">
        <!-- sidebar menu area start -->
        <div class="sidebar-menu">
            <div class="sidebar-header">
                <div class="logo">
                    <a href="index.html"><img src="assets/images/icon/logoLuxFlame.png" alt="logo"></a>
                </div>
                <br>
                <h6 class="text-center" style="color: aliceblue"><i class="fa fa-user"></i> <strong>DluxMultiProyectos</strong></h6>
            </div>
            <div class="main-menu">
                <div class="menu-inner">
                    <nav>
                        <ul class="metismenu" id="menu">
                            <li class="active"><a href="index.html"><i class="fa fa-home"></i> <span>Inicio</span></a></li>
                            <li>
                                <a href="javascript:void(0)"><i class="fa fa-tag"></i><span>Personal</span></a>
                                <ul class="collapse">
                                    <li style='cursor: pointer'><a onclick="AdminUsuarios()"><i class="fa fa-cubes"></i>Usuarios</a></li>
<!--                                    <li style='cursor: pointer'><a onclick="AdminUsuarios(<%= "2" %>)"><i class="fa fa-cubes"></i>Profesionales</a></li>
                                    <li style='cursor: pointer'><a onclick="AdminUsuarios(<%= "3" %>)"><i class="fa fa-archive"></i>Clienes</a></li>-->
                                    
                                                            
<!--                    <li style='cursor: pointer'>
                        <a onclick="AdminAdministradores();">
                            <i class="fa fa-filter"></i><span class="text">Administradores</span>
                        </a>
                    </li>-->
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)"><i class="fa fa-tag"></i><span>Admin. Art. Electronicos</span></a>
                                <ul class="collapse">
                                    <li style='cursor: pointer'><a onclick="AdminArtWeb()"><i class="fa fa-cubes"></i>Admin Web</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)"><i class="fa fa-tag"></i><span>Ventas DLux</span></a>
                                <ul class="collapse">
                                    <li style='cursor: pointer'><a onclick="AdminPedidosVentas()"><i class="fa fa-archive"></i>Pedidos</a></li>
                                    <li style='cursor: pointer'><a onclick="AdmiVentas()"><i class="fa fa-archive"></i>Ventas</a></li>
<!--                                    <li><a href=""><i class="fa fa-cubes"></i> Categorias</a></li>
                                    <li><a onclick='AdminUsuarios(<= "1%>);'><i class="fa fa-archive"></i> Productos</a></li>-->
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- sidebar menu area end -->
        <!-- main content area start -->
        <div class="main-content">
            <!-- header area start -->
            <div class="header-area">
                <div class="row align-items-center">
                    <!-- nav and search button -->
                    <div class="col-4 clearfix">
                        <div class="nav-btn pull-left" style="margin-top: 0px">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                    </div>
                    <!-- profile info & task notification -->
                    <div class="col-8 clearfix">
                        <ul class="notification-area pull-right">
                            <li>
                                <a href="">
                                    Cerrar Sessión
                                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <!-- header area end -->
            <div id="contenidoDinamico" class="main-content-inner">
                <div class="main-header">
                    <h2>DLuxMultiProyectos</h2>
                    <em>Sistemas de Seguridad Electrónica</em>
                </div>
                <div id='contenidoInferior' class="main-content">
                    <p class="lead">Estimado(a) usuario (a), politécnico, a través del aplicativo usted podrá verificar sus bienes, ventas de la Empresa.</p>
                    </br>
                    <!--<img src="assets/img/bienes.png" class="img-responsive center-block" alt="Normal Sidebar">-->
                    <div class="bottom-30px"></div>
                </div>
            </div>
        </div>
        <!-- main content area end -->
        <!-- footer area start-->
        <footer>
            <div class="footer-area">
                <p>© Copyright 2021 <a href="https://colorlib.com/wp/">DLuxMultiProyectos</a>.</p>
            </div>
        </footer>
        <!-- footer area end-->
    </div>
    <!-- page container area end -->
    <!-- jquery latest version -->
    <script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/metisMenu.min.js"></script>
    <script src="assets/js/jquery.slimscroll.min.js"></script>
    <script src="assets/js/jquery.slicknav.min.js"></script>
    
    <!--Cloudinary-->
       <script  src = "https://widget.cloudinary.com/v2.0/global/all.js"  type = "text/javascript"></script>
    
    <!--DATATABLE-->
<!--    <script src="assets/datatable/datatables.min.js" type="text/javascript"></script>
    <script> 
        $(document).ready(function(){ 
            $('#tbl').DataTable(); 
        });
    </script>-->

    <!-- start chart js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    <!-- start highcharts js -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <!-- start zingchart js -->
    <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
    <script>
        zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
        ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
    </script>
    <!-- all line chart activation -->
    <script src="assets/js/line-chart.js"></script>
    <!-- all pie chart -->
    <script src="assets/js/pie-chart.js"></script>
    <!-- others plugins -->
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/scripts.js"></script>
    <!--llamado a el js principal del Sistema-->
    <script src="assets/js/prueba.js" type="text/javascript"></script>
    <!--lamado a el js dtic -->
    <script src="assets/js/dtic.js" type="text/javascript"></script>
</body>



