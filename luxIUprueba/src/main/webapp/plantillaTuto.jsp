
<%@page import="entidades.CustomGmail"%>
<%@page import="servicios.sKit"%>
<%@page import="servicios.sMaterial"%>
<%@page import="entidades.Material"%>
<%@page import="entidades.Kit"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONObject"%>
<%@page import="servicios.sServicio"%>
<%@page import="entidades.Servicio"%>
<%@page import="entidades.Persona"%>

<!--Twilio-->
    <%@page import="com.twilio.Twilio"%>
    <%@page import="com.twilio.converter.Promoter"%>
    <%@page import="com.twilio.rest.api.v2010.account.Message"%> 
    <%@page import="com.twilio.type.PhoneNumber"%>
<!---->

<%@page contentType='text/html' pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">-->
        <!--<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>-->

        <!-- links de google Fonts -->
        <!--<link rel="preconnect" href="https://fonts.gstatic.com">-->
        <!--<link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300&display=swap" rel="stylesheet">-->

        <!--estilos de iconos -->
        <link rel="stylesheet" href="assets/fontawesome/css/all.min.css" type="text/css"/>

        
        <!------------------scripts de la plantilla añadido------------------->    
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
        <!--css Owl Carousel 2 para slider horizontal de imagenes-->
        <!--<link href="assets/css/owl.carousel.min.css" rel="stylesheet" type="text/css"/>-->
        <!--<link rel="stylesheet" href="assets/css/owl.carousel.css">-->
        <!--<link rel="stylesheet" href="assets/css/owl.theme.default.css">-->
        <!--<link rel="stylesheet" href="assets/css/sliderarticulos.css">-->
        <!--css para slider tuto 2  https://www.youtube.com/watch?v=YunLfczBbkY-->
        <link rel="stylesheet" type="text/css" href="assets/css/sliderprod.css"/>
        <link href="assets/css/lightslider.css" rel="stylesheet" type="text/css"/> <!--//CSS usaso parael slider--> 
        
        <!--estilos css estilo para pa paguina principal-->
        <link rel="stylesheet" href="assets/css/estilo.css" type="text/css"/> 
        <!-- modernizar css -->
        <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>

        <title>Hello, world!</title>
    </head>
    <!--<link href="assets/css/owl.theme.default.css" rel="stylesheet" type="text/css"/>-->
    <%
        session.setAttribute("Cedula", "");
        session.setAttribute("TipoUser", "");
        session.setAttribute("ingreso", "false");
        session.setAttribute("carritoMat", "");      //variable para almacenar codigos de materiales
        session.setAttribute("carritoCantMat", "");  //variable para almacenar cantidad de cada material
        session.setAttribute("carritoKit", "");      //variable para almacenar codigos de kits
        session.setAttribute("carritoCantKit", "");  //variable para almacenar cantidad de cada kit
        

    ArrayList<Material> listMaterial = new ArrayList<Material>();
    ArrayList<Kit> listKit = new ArrayList<Kit>();
    
    //prueba para enviar correo por gmail 
    //CustomGmail objCustomGmail = new CustomGmail();
    //objCustomGmail.enviarGmail("iirenelizbeth@gmail.com");
    //objCustomGmail.enviarGmail("deniseinfante2002@gmail.com");
    
    //Materiales de un Servicio determinado
    String cadJSONmatsvr = sMaterial.listaMaterialesPagWeb();
    String resultadoMatsvr = "{\"respuesta\":" + cadJSONmatsvr + "}";
    JSONObject objMatsvr = new JSONObject(resultadoMatsvr);
    JSONArray arrayTipoCer = objMatsvr.getJSONArray("respuesta");
        for (int i = 0; i < arrayTipoCer.length(); i++) {
            JSONObject childJSONObject = arrayTipoCer.getJSONObject(i);
            Material objMenus = new Gson().fromJson(childJSONObject.toString(), Material.class);
            listMaterial.add(objMenus);
        }

    //Kits de un Servicio determinado
    String cadJSONkit = sKit.listaKitsPagWeb();
    String resultadoKit = "{\"respuesta\":" + cadJSONkit + "}";
    JSONObject objKit = new JSONObject(resultadoKit);
    JSONArray arrayKit = objKit.getJSONArray("respuesta");
        for (int i = 0; i < arrayKit.length(); i++) {
            JSONObject childJSONObject = arrayKit.getJSONObject(i);
            Kit objMenus = new Gson().fromJson(childJSONObject.toString(), Kit.class);
            listKit.add(objMenus);
        }
            

        String s = "SRV1";
    %>
    
    
    <body>
        <!--<div class="page-container">-->
            <!--<nav class="navbar navbar-expand-lg navbar-light bg-light">-->
        <div id='menu' class="fixed-top">    
            <nav class="navbar navbar-expand-lg">
            <!--<nav class="navbar navbar-expand-lg nav-custom">-->
                <!--<div class="container" id="menucabezera">-->
                <div class="container" >
                    <a class="navbar-brand" href="#"><img src="assets/images/imglux/logo.png" class="logo-brand" alt="logo"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-bars"></i>
                    </button>

                    <div class="collapse navbar-collapse customnav" id="navbarSupportedContent" align="left">
                        <ul class="navbar-nav ml-auto">
                            <!--<li class="nav-item active">-->
                            <li class="nav-item">
                                <!--<a class="nav-link" href="#">Inicio<span class="sr-only">(current)</span></a>-->
                                <a class="nav-link" href="#" id="idInicio">Inicio</a>
                                <button onclick="mensajeTwilio()" class="btn btn-primary">Watsap</button>
                            </li>
                            <!--                        <li class="nav-item dropdown">
                                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            Servicios
                                                        </a>
                                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                            <a class="dropdown-item" href="#">Action</a>
                                                            <a class="dropdown-item" href="#">Another action</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a class="dropdown-item" href="#">Something else here</a>
                                                        </div>
                                                    </li>-->
                            <li class="nav-item">
                                <a class="nav-link" href="index2.jsp" id="idContactos">Contactos</a>
                            </li>
                            <li class="nav-item">
                                <!--<a class="nav-link disabled" href="#">Disabled</a>-->
                                <a class="nav-link" type="button" href="index.jsp" id="idLogin" class="btn btn-info btn-round" data-toggle="modal" data-target="#loginModal" ty>Login</a>
                            </li>
                        </ul>
                    </div>
                    
                </div>
                
                <div id="iconoCarrito">
                    <button class="border-0" onclick="verCarritoDetalle()" ><i class="fas fa-shopping-cart" style="font-size: 30px;"></i></button>
                </div>
            </nav>
            <div id="alertMensajes">
                <!--Seccion para mensajes dinamicos-->
            </div>
        </div>
<!--            <div class="row" id="alertMensajes">
                <h5>holitas</h5>
                Seccion Dinamica para Mostrar alertas
            </div>-->
            <br><br><br><br>
            <!--<div class="cnt">-->
            <div class='container' id="secDinamicaBody">
                <div class="row fila">
                    <div class="col-md-2">
                        
                        <div class="main-menu">
                            <div class="menu-inner">
                                <nav class="menu-lateral">
                                    <!--<ul class="metismenu" id="menu">-->
                                    <ul class="menu-opc">
                                       <li class="active"><a onclick="verArticuloServicio('SRV1','inicio')"><i class="fa fa-home"></i> <span>Inicio</span></a></li>
                                       <li style='cursor: pointer'>
                                           <a onclick="verArticuloServicio('SRV1','subseccion')"><i class="fa fa-bolt"></i> <span>VIDEO VIGILANCIA</span></a>
                                            <!--<ul class="collapse">-->
                                            <ul data-toggle="collapse">
                                                <li><a onclick="verArtPorOpcMenu('videovigilancia','resolucion','720P')"><i class="fa fa-archive"></i>Cámaras 720 Hikvision</a></li>
                                                <li><a onclick="verArtPorOpcMenu('videovigilancia','resolucion','1080P')"><i class="fa fa-cubes"></i>Cámaras 1080 Hikvision</a></li>
                                                <li><a onclick="verArtPorOpcMenu('videovigilancia','resolucion','5MP')"><i class="fa fa-archive"></i>Cámaras de 5MP Hikvision</a></li>
                                                <li><a onclick="verArtPorOpcMenu('videovigilancia','resolucion','5MP')"><i class="fa fa-cubes"></i>Cámaras IP 2MP y 4MP</a></li>
                                                <li><a onclick="verArtPorOpcMenu('videovigilancia','colorvu','')"><i class="fa fa-archive"></i>Cámaras Color VU</a></li>
                                                <li><a onclick="verArtPorOpcMenu('videovigilancia','marca','EZVIZ')"></i>Cámaras IP EZVIZ</a></li>
                                                <li><a onclick="verArtPorOpcMenu('videovigilancia','marca','HIKVISION')"><i class="fa fa-archive"></i>Cámaras IP Hikvision</a></li>
                                                <li><a onclick="verArtPorOpcMenu('videovigilancia','camaratermica','')"><i class="fa fa-cubes"></i>Cámaras Térmicas</a></li>
                                                <li><a onclick="verArtPorOpcMenu('videovigilancia','dvr','720P')"><i class="fa fa-archive"></i>DVR TURBO 720P</a></li>
                                                <li><a onclick="verArtPorOpcMenu('videovigilancia','dvr','1080P')"><i class="fa fa-archive"></i>DVR TURBO 1080P</a></li>
                                                <li><a onclick="verArtPorOpcMenu('videovigilancia','catalogo','DISCO DURO')"><i class="fa fa-archive"></i>Discos Duros</a></li>
                                                <li><a onclick="verArtPorOpcMenu('videovigilancia','catalogo','MEMORIA')"><i class="fa fa-archive"></i>MICRO SD</a></li>
                                                <li><a onclick="verArtPorOpcMenu('videovigilancia','catalogo','NVR')"><i class="fa fa-archive"></i>NVR Hikvision</a></li>
                                                <li><a onclick="verArtPorOpcMenu('videovigilancia','accesorios','')"><i class="fa fa-archive"></i>Accesorios</a></li>
                                            </ul>
                                       </li>
                                        <li>
                                            <a href="#dash" aria-expanded="false" data-toggle="collapse" class="dropdown-toggle"><i class="ti-dashboard"></i><span>dashboard</span></a>
                                            <ul class="collapse" id="dash">
                                                <li class="active"><a href="index.html">ICO dashboard</a></li>
                                                <li><a href="index2.html">Ecommerce dashboard</a></li>
                                                <li><a href="index3.html">SEO dashboard</a></li>
                                            </ul>
                                        </li>
                                        <li style='cursor: pointer'><a onclick="verArticuloServicio('SRV3','subseccion')"><i class="fa fa-bolt"></i> <span>DETECCIÓN Y EXTINCIÓN DE INCENDIOS</span></a></li>
                                        <li style='cursor: pointer'><a onclick="verArticuloServicio('SRV5','subseccion')"><i class="fa fa-bolt"></i> <span>CERCAS ELÉCTRICAS Y ALARMAS PERIMETRALES</span></a></li>
                                        <li style='cursor: pointer'><a onclick="verArticuloServicio('SRV2','subseccion')"><i class="fa fa-bolt"></i> <span>CABLEADO ELÉCTRICO</span></a></li>
                                        <li>
                                            <a href="#collapsePersonal" data-toggle="collapse" aria-expanded="true"><i class="fa fa-tag"></i><span>Personal</span></a>
                                            <ul class="collapse" id="collapsePersonal">
                                                <li style='cursor: pointer'><a onclick="AdminUsuarios()"><i class="fa fa-cubes"></i>Usuarios</a></li>
                                                <li style='cursor: pointer'><a onclick="AdminUsuarios(<%= "2" %>)"><i class="fa fa-cubes"></i>Profesionales</a></li>
                                                <li style='cursor: pointer'><a onclick="AdminUsuarios(<%= "3" %>)"><i class="fa fa-archive"></i>Clienes</a></li>
                                                <li style='cursor: pointer'>
                                                    <a onclick="">
                                                        <i class="fa fa-filter"></i><span class="text">Administradores</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#collapseExample" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-tag"></i><span>Instalaciones</span></a>
                                            <ul class="collapse show" id="collapseExample">
                                                <li><a href=""><i class="fa fa-archive"></i> Productos</a></li>
                                                <li><a href=""><i class="fa fa-cubes"></i> Categorias</a></li>
                                                <li><a href=""><i class="fa fa-archive"></i> Productos</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a data-toggle="collapse" data-target="#collapseThree"><i class="fa fa-tag"></i><span>Delivery</span></a>
                                            <ul id="collapseThree" class="collapse">
                                                <li><a href=""><i class="fa fa-archive"></i> Productos</a></li>
                                                <li><a href=""><i class="fa fa-cubes"></i> Categorias</a></li>
                                                <li><a href=""><i class="fa fa-archive"></i> Productos</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)"><i class="fa fa-tag"></i><span>Admin. Art. Electronicos</span></a>
                                            <ul class="collapse">
                                                <li style='cursor: pointer'><a onclick="AdminArtWeb()"><i class="fa fa-cubes"></i>Admin Web</a></li>
                                            </ul>
                                        </li>
                                        
                                        <li>
                                            <a data-toggle="collapse" data-target="#collapse4" data-parent="menup"><i class="fa fa-tag"></i><span>Delivery</span></a>
                                            <ul id="collapse4" class="collapse">
                                                <li><a href=""><i class="fa fa-archive"></i> Productos</a></li>
                                                <li><a href=""><i class="fa fa-cubes"></i> Categorias</a></li>
                                                <li><a href=""><i class="fa fa-archive"></i> Productos</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a data-toggle="collapse" data-target="#collapse5" data-parent="menup"><i class="fa fa-tag"></i><span>Delivery</span></a>
                                            <ul id="collapse5" class="collapse">
                                                <li><a href=""><i class="fa fa-archive"></i> Productos</a></li>
                                                <li><a href=""><i class="fa fa-cubes"></i> Categorias</a></li>
                                                <li><a href=""><i class="fa fa-archive"></i> Productos</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                                                
<!--                        <div id="menu-menu">
                            
                        </div>-->
                        
                        <div id="accordion">
                            <div class="card">
                              <div class="card-header" id="headingOne">
                                <h5 class="mb-0">
                                  <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne">
                                    Collapsible Group Item #1
                                  </button>
                                </h5>
                              </div>

                              <div id="collapseOne" class="collapse show">
                                <div class="card-body">
                                  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                </div>
                              </div>
                            </div>
                            <div class="card">
                              <div class="card-header" id="headingTwo">
                                <h5 class="mb-0">
                                  <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    Collapsible Group Item #2
                                  </button>
                                </h5>
                              </div>
                              <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                                <div class="card-body">
                                  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                </div>
                              </div>
                            </div>
                            <div class="card">
                              <div class="card-header" id="headingThree">
                                <h5 class="mb-0">
                                  <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    Collapsible Group Item #3
                                  </button>
                                </h5>
                              </div>
                              <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                                <div class="card-body">
                                  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10" id="secDinamicaSrvSeg">
<!--                        <div id="secDinamicaSrvSeg">
                            probando seccion dinamica  para los materiiales electronio
                        </div>-->
                        <section id="portfolio">
                            <div class="container-fluid">
<!--                                <div class="content-center">
                                    <h2>Instalacion y Manteniiento de Servicios de Seguridad Electronica<h2>
                                            <p>Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. 
                                                Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500<p>
                                </div>
                                    <br><br>-->

                                <!--<div class="row m-5">
                                    <div class="col-md-4">
                                        <div class="portfolio-container">
                                            <div class="portfolio-details">
                                                Esto esta comentado porque estas letras se sobreponen sobre el modal login
                                                <a href="#">
                                                    <h2>Camaras de Seguridad</h2>
                                                </a>
                                                <a href="#">
                                                    <p>Camaras en Blanco y Negro</p>
                                                </a>
                                            </div>
                                            <img class="img-fluid" src="assets/images/imglux/SisSeguridadPr.jpg">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="portfolio-container">
                                            <div class="portfolio-details">
                                                <a href="#">
                                                    <h2>Camaras de Seguridad</h2>
                                                </a>
                                                <a href="#">
                                                    <p>Camaras en Blanco y Negro</p>
                                                </a>
                                            </div>
                                            <img class="img-fluid" src="assets/images/imglux/SisSeguridadPr.jpg">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="portfolio-container">
                                            <div class="portfolio-details">
                                                <a href="#">
                                                    <h2>Camaras de Seguridad</h2>
                                                </a>
                                                <a href="#">
                                                    <p>Camaras en Blanco y Negro</p>
                                                </a>
                                            </div>
                                            <img class="img-fluid" src="assets/images/imglux/SisSeguridadPr.jpg">
                                        </div>
                                    </div>
                                </div>-->
                                <div class="text-center topmargin-sm ">
                                    <p>Servicios de Control<p>
                                    <button onclick="mensajeTwilio()" class="btn btn-primary">Watsap</button>
                                </div>
                            </div>
                        </section>
                        <section id="slider1">
                            <!--<ul id="autoWidth" class="cs-hidden">-->
                            <ul class="row cs-hidden">
                                    <!----------1----------->
<!--                                    <li class="item-a">
                                        <div class="box">-->
                                            <% 
                                            Integer cont = 0; 
                                            for (Material oMat : listMaterial) {
                                                //out.println("<td>" + oPet.getMatId().getMatImagen() +"</td>");
                                                
                                                //out.println("<li class=\"item-" + "cont" + "\">");
                                                out.println("<li class=\"item-"+ cont +"\">");
                                                    out.println("<div class=\"box\">");
                                                        out.println("<div class=\"slide-img\">");
                                                            out.println("<img src=\""+ oMat.getMatImagen() +"\" onclick=\"abrirModal('" + oMat.getMatId() + "','material')\" alt=\"camara\"/>");
                                                        out.println("</div>");
                                                        out.println("<div class=\"detail-box\">");
                                                            out.println("<div class=\"type\">"); 
                                                                out.println("<a href=\"#\">"+ oMat.getCtmtId().getCtmtNombre() +"</a>");
                                                                out.println("<span> "+ oMat.getMatNombre() + "</span>");
                                                            out.println("</div>");
                                                            out.println("<a href=\"#\" class=\"price\">" + oMat.getMatPrecio() + " $</a>");
                                                        out.println("</div>");
                                                        out.println("<button id=\"btnCarrito\" class=\"btn btn-outline-secondary\" onclick=\"codMatKit('" + oMat.getMatId() + "','material')\"><i class=\"fas fa-shopping-cart\"></i>  Agregar al Carrito</button>");
                                                    out.println("</div>");
                                                out.println("</li>");
                                                cont++;
                                            }
                                          %>

                                    <!-----------6----------->
                                    <li class="item-d">
                                        <div class="box">
                                            <div class="slide-img">
                                                <img src="assets/images/imglux/camara-hikvision.jpg" alt="camara"/>

                                            </div>
                                            <div class="detail-box">
                                                <div class="type">
                                                    <a href="#">HIKVISION</a> 
                                                    <span>Camara</span>
                                                </div>  
                                                <a href="#" class="price">$23</a>   
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                        </section>

                        <section id="slider2">
                            <!--<ul id="autoWidth1" class="cs-hidden">-->
                            <ul class="row   cs-hidden">
                                <%
                                //Integer cont = 0; 
                                for (Kit oKit : listKit) {
                                    //out.println("<td>" + oPet.getMatId().getMatImagen() +"</td>");

                                    out.println("<li class=\"item-a\">");
                                        out.println("<div class=\"box\">");
                                            out.println("<div class=\"slide-img\">");
                                                out.println("<img src=\""+ oKit.getKitImagen() +"\" onclick=\"abrirModal('" + oKit.getKitId() + "','kit')\" alt=\"camara\"/>");
                                            out.println("</div>");
                                            out.println("<div class=\"detail-box\">");
                                                out.println("<div class=\"type\">");
                                                    out.println("<a href=\"#\">"+ oKit.getKitMateriales() +"</a>");
                                                    out.println("<span>DLUX:"+ oKit.getKitId() + "</span>");
                                                out.println("</div>");
                                                //float pdescueto = oKit.getKitPrecio().floatValue() * oKit.getKitDescuento().floatValue();
                                                out.println("<a href=\"#\" class=\"price\">" + "" + " $</a>");
                                            out.println("</div>");
                                            out.println("<button class=\"btn btn-outline-secondary\" onclick=\"codMatKit('" + oKit.getKitId() + "','kit')\"><i class=\"fas fa-shopping-cart\"></i>  Agregar al Carrito</button>");
                                        out.println("</div>");
                                    out.println("</li>");
                                }
                                %>   
                             </ul>
                        </section>
            
<!--                        <section id="aboutus" class="bg-light-grey">
                            <div class="container">
                                <div class="content-center">
                                    <h2>Quienes somos</h2>
                                    <p>Ingenieros Electronicos</p>
                                </div>
                            </div>
                            <div class="row m-5" >
                                <div class="col-md-4">
                                    <div class="member-container">
                                        <div class="member-details">
                                            <h5>Pepe Perez</h5>
                                            <span>Creative Director</span>
                                            <ul class="list-inline">
                                                <li class="list-inline-item"><a href="#"><i class="fab fa-instagram"></i></a></li>
                                                <li class="list-inline-item"><a href="#"><i class="fab fa-instagram"></i></a></li>
                                                        <li class="list-inline-item"><a href="#"><i class="fab fa-instagram"></i></a></li>
                                                <li class="list-inline-item"><a href="#"><i class="fab fa-instagram"></i></a></li>
                                            </ul>
                                        </div>
                                        <img src="assets/images/imglux/electronico.jpg" class="img-fluid" alt="art1">
                                    </div>
                                </div>   
                                <div class="col-md-4">
                                    <div class="member-container">
                                        <div class="member-details">
                                            <h5>Pepe Perez</h5>
                                            <span>Creative Director</span>
                                            <ul class="list-inline">
                                                <li class="list-inline-item"><a href="#"><i class="fab fa-instagram"></i></a></li>
                                                <li class="list-inline-item"><a href="#"><i class="fab fa-instagram"></i></a></li>
                                                <li class="list-inline-item"><a href="#"><i class="fab fa-instagram"></i></a></li>
                                                <li class="list-inline-item"><a href="#"><i class="fab fa-instagram"></i></a></li>
                                            </ul>
                                        </div>
                                        <img src="assets/images/imglux/electronico.jpg" class="img-fluid" alt="art1">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="member-container">
                                        <div class="member-details">
                                            <h5>Pepe Perez</h5>
                                            <span>Creative Director</span>
                                            <ul class="list-inline">
                                                <li class="list-inline-item"><a href="#"><i class="fab fa-instagram"></i></a></li>
                                                <li class="list-inline-item"><a href="#"><i class="fab fa-instagram"></i></a></li>
                                                <li class="list-inline-item"><a href="#"><i class="fab fa-instagram"></i></a></li>
                                                <li class="list-inline-item"><a href="#"><i class="fab fa-instagram"></i></a></li>
                                            </ul>
                                        </div>
                                        <img src="assets/images/imglux/electronico.jpg" class="img-fluid" alt="art1">
                                    </div>
                                </div>
                            </div> 
                        </section>-->
                                            <h1>DIV 1</h1>
                                            <h6>Numero: </h6> <input id="idnum" type="text">
                                            <h6>Mensaje: </h6> <input id="idsms" type="text">
                                            <!--<button onclick="mensajeTwilio()" class="btn btn-outline-secondary">Watsap</button>-->
                                            <!--<button type="button" class="btn btn-primary">Primary</button>-->
                                            
                                            
                                            
                                            <form>
                                                <div class="form-group">
                                                  <label for="exampleFormControlFile1">Example file input</label>
                                                  <input type="file" class="form-control-file" id="exampleFormControlFile1">
                                                </div>
                                                <button type="submit" class="btn btn-primary mb-2">SAVE IMG</button>
                                            </form>
                                            
                                            
                                            
                    </div>
                                            <h1>DIV 2</h1>
                </div> 
            </div>
                            <section id="footer" class="bg-dark">
                                <div class="container">
                                    <img src="assets/images/imglux/logo.png" class="logo-brand" alt="logo">
                                    <ul class="list-inline"> 
                                        <li class="list-inline-item footer-menu"><a href="#">Inicio</a> </li>
                                        <li class="list-inline-item footer-menu"><a href="#">Contactos</a> </li>
                                        <li class="list-inline-item footer-menu"><a href="#">Login</a> </li>
                                    </ul>

                                    <ul class="list-inline">
                                        <li class="list-inline-item"><a href="#"><i class="fab fa-instagram"></i></a></li>
                                        <li class="list-inline-item"><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                        <li class="list-inline-item"><a href="#"><i class="fab fa-twitter-square"></i></a></li>
                                        <li class="list-inline-item"><a href="#"><i class="fab fa-youtube"></i></a></li>
                                    </ul>
                                    <small>@2021 Derechos Reservados Luxflame</small
                                    
                                    <!--esto tambien es un prueb-->
<!--                                        <div id = "resultado">
                                            <h1>DIV RESULTADO</h1>    
                                        </div > 
                                        
                                         <div id = "result">
                                            <h1>DIV RESULT</h1>    
                                        </div > -->
                                    
                                        <!--Esto solo es una prueba para ver si el IU consume el AD-->
                                            <%
//                                                Servicio objServicio = new Servicio();
//                                                String jsonServicio = sServicio.listaServicioId(1);
//                                                JSONObject reqServicio = new JSONObject(jsonServicio);
//                                                objServicio = new Gson().fromJson(reqServicio.toString(), Servicio.class);
                                            %>
<!--                                            <h1>Aqui deberia estar llamando a el servicio<h1>
                                            <br>-->
                                            <%--<%= // objServicio.getSrvId() %>--%>
<!--                                            <br>-->
                                            <%--<%= // objServicio.getSrvNombre() %>--%>
<!--                                            <br>-->
                                            <%--<%= // objServicio.getSrvTipo() %>--%>
                                            
<!--                                                <form role = "form" id="FrmPruebaLogin">
                                                    <div class="form-group" id="email-group">
                                                        <input type="email" class="form-control" id="idemail"placeholder="Correo Electrónico...">
                                                    </div>
                                                    <div class="form-group" id="password-group">
                                                        <i class="fas fa-unlock-alt"></i>
                                                        <input type="password" class="form-control" id="idpassword" placeholder="Contraseña...">
                                                    </div>
                                                </form>
                                            <button type="button" class="btn btn-info btn-block btn-round"  onclick="controlLogin()">Login</button>-->
                                            <!--<button type="button" class="btn btn-info btn-block btn-round"  onclick="muestraMensaje()">Login</button>-->
                                            
                                        <!--------->
                                </div>
                            </section>
                            <!--------------------------------Modal de Login-------------------------------->
                            <!--/////////////////MODAL///////////////////////-->  
                                <!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal" data-whatever="@getbootstrap">Modal Prueba</button>-->

                                <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                  <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Iniciar Sessión</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                        </button>
                                      </div>
                                      <div class="modal-body">
                                        <form>
                                          <div class="frm-input">
                                            <label for="emaill" class="col-form-label">Correo electrónico</label>
                                            <input type="text" class="form-control" id="emaill">
                                          </div>
                                          <div class="frm-input">
                                            <label for="passwordl" class="col-form-label">Contraseña</label>
                                            <input type="password" class="form-control" id="passwordl">
                                          </div>
                                        </form>
                                        <div class="row">
                                            <div class="col-md-12 text-center">
                                                <button type="button" class="btn btn-primary" value='loginAdmin' id="btnModal" onclick="controlLogin()">INGRESAR</button>
                                            </div>
                                        </div>
                                      </div>
                                      <div class="modal-footer">
                                        <!--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>-->
                                        <div class="container">
                                            <div class="row justify-content-md-center">
                                            <!--<div class="col-md-6">-->
                                            
                                                <div class="align-items-center">
                                                    <p>¿No tienes Cuenta?</p>
                                                    <div class="signup-section"><a href="#" class="text-info" data-toggle="modal" data-target="#cuentaModal"  data-dismiss="modal">REGISTRATE</a></div>
                                                </div>
                                            <!--</div>-->
<!--                                            <div class="col-md-6">
                                                <div class="modal-footer d-flex justify-content-center">
                                                    <div class="signup-section"><a href="#a" class="text-info">¿Has olvidado tu contraseña?</a>.</div>
                                                </div>
                                            </div>-->
                                            </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                
                                
                               <!------------Modal con el Formulario para Crear una Cuenta en el Sistema-------------------->

                                <div class="modal fade" id="cuentaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                  <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Crear Cuenta</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                        </button>
                                      </div>
                                      <div class="modal-body">
                                        <form role="form" id="FormIngCuenta">
                                          <div class="frm-input">
                                            <label for="email" class="col-form-label">Correo electrónico</label>
                                            <input type="text" class="form-control" id="email" name="email">
                                           <small id="secDinamicaCuentaEmailError" style="color: red;">
                                               <!--Seccion dimamica para mensajes Success para validar la Correo-->
                                            </small>
                                          </div>
                                          <div class="frm-input">
                                            <label for="password1" class="col-form-label">Contraseña</label>
                                            <input type="password" id="password1" class="form-control" name="password1" minlength="5" maxlength="20">
                                            <small id="passwordHelpInline" class="text-muted">
                                              Máximo de 6 a 20 caracteres.
                                            </small>
                                          </div>
                                          <div class="frm-input">
                                            <label for="password2" class="col-form-label">Vuelva a escribir la contraseña</label>
                                            <input type="password" class="form-control" id="password2" name="password2" minlength="5" maxlength="20">
                                            <small id="secDinamicaCuentaSuccess" style="color: red;">
                                               <!--Seccion dimamica para mensajes de Error para validar la Cuenta-->
                                            </small>
                                            <small id="secDinamicaCuentaError" style="color: green;">
                                               <!--Seccion dimamica para mensajes Success para validar la Cuenta-->
                                            </small>
                                          </div>
                                            
                                          <div class="row">
                                            <div class="col-md-12 text-center">
                                                <button type="button" class="btn btn-primary" id="btnFormulario" onclick="ingCuenta()">Crear Cuenta</button>
                                            </div>
                                          </div>
                                        </form>
                                      </div>
                                      <div class="modal-footer">
                                        <!--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>-->
                                        <div class="container">
                                            <div class="row justify-content-md-center">
                                                <div class="align-items-center">
                                                    <p>¿Ya tienes una Cuenta?</p>
                                                    <div class="signup-section"><a href="#a" class="text-info" data-toggle="modal" data-target="#loginModal"  data-dismiss="modal">INICIAR SESSION</a></div>
                                                </div>
                                            </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                
                            <!--------------------------------Modal Info Material-------------------------------->
                            <!--/////////////////MODAL///////////////////////-->  
                                <!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#infoArticuloModal" data-whatever="@getbootstrap">Modal Prueba</button>-->

                                <div class="modal fade" id="infoArticuloModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                  <div class="modal-dialog modal-lg  modal-dialog-centered " style="width: 80%;" role="document">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <!--<h5 class="modal-title" id="exampleModalLabel">Modal del KIT-PROD</h5>-->
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                        </button>
                                      </div>
                                      <div class="modal-body-artmat">

                                      </div>
                                      <div class="modal-footer">

                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                <!--</div>-->
                                
                            <!------------Modal para Mostrar Datos de una Cuenta de Banco -------------------->
                                <div class="modal fade" id="cuentaBancoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                  <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Cuenta de Banco</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                        </button>
                                      </div>
                                      <div class="modal-body">
                                        <form role="form" id="FormCuentaBanco">
                                            <div id="cuenta1">
                                                <p>
                                                    <b>Titular de cuenta: </b> DluxMultiProyectos  <br>
                                                    <b>Identificación: </b> 1854382945001  <br>
                                                    <b>Email: </b> dlux@gmail.com  <br>
                                                    <b>Contacto: </b> 0984957974  <br>
                                                </p>
                                            <hr>
                                            <div id="cuenta1">
                                                <h5>Banco Pichincha</h5>
                                                <p>
                                                    <b>Identificación: </b> 1854382945001  <br>
                                                    <b>Tipo de cuenta: </b> Cuenta Corriente  <br>
                                                    <b>Numero de cuenta: </b> 1536291670  <br>
                                                </p>
                                            </div>
                                            <hr>
                                            <div id="cuenta2">
                                                <h5>Banco Guayaquil</h5>
                                                <p>
                                                    <b>Identificación: </b> 1854382945001  <br>
                                                    <b>Tipo de cuenta: </b> Cuenta Corriente  <br>
                                                    <b>Numero de cuenta: </b> 1536291670  <br>
                                                </p>
                                            </div>
                                        </form>
                                      </div>
                                      <div class="modal-footer">
                                        <!--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>-->
                                        <div class="container">
                                            <div class="row justify-content-center">
                                              <div class="col-md-6 text-center">
                                                  <button type="button" class="btn btn-primary" id="btnFormulario" onclick="ingCuentaa()">Aceptar</button>
                                              </div>
                                            </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                            </div> 
                           
                            
        <!--</div>-->
    </body>
                                <!--//////////////////////////////////////////////////-->
                            
                                <!-- Optional JavaScript -->
                                <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                                <!--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->
                                <!--<script src="assets/js/popper.min.js" type="text/javascript"></script>-->
                                

                                <!--Esta libreria no se pudo importar-->

                                <!--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->
                                <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>-->
                                <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>-->  

    <script>
        function codMatKit(codmat, tipo){
            //let cant = document.getElementById("idCantidad").value;
            pasarACarrito(codmat,1,tipo);
            smsSuccessCarrito();
        }
    </script>                          

      <script>
        function controlLogin() {
//            alert("Holas");
//            var e = $("#loginModal #emaill").val();
//            var c = $("#passwordl").val();
//                alert("email con val(): "+e);
//                alert("clave con val():"+c);
//            var em = document.getElementById("emaill");
//            var cl = document.getElementById("passwordl");
//                alert("email getElement: "+em);
//                alert("clave getElement: "+cl);
            email = $("input[id='emaill']").val();
            clave = $("input[id='passwordl']").val();
            if (email !== "" && clave !== "") {
//                alert("Holitas");
//                alert("email: "+email);
//                alert("clave: "+clave);
                ingEsquema(email, clave, "");
            } else 
                alert(" Ingrese todos los campos de requeridos");
        }

//        $(document).ready(function(){
//            $('#btnModal').click(function(){
//               var dat = $("#loginModal #emaill").val().trim(); 
//               $('#result').html();
//            });
//        });
    </script>
    
    <script>//SCRIPT para control del slider de articulos
//        $('.owl-carousel').owlCarousel({
//            loop:true,
//            margin:10,
//            nav:true,
//            responsive:{
//                0:{
//                    items:1
//                },
//                600:{
//                    items:3
//                },
//                1000:{
//                    items:5
//                }
//            }
//        });
    </script>    
    
    <script>
        //SCRIPT para control del slider de articulos
//        $(".carousel").owlCarousel({
//            margin: 10,
//            loop: true,
//            autoplay: true,
//            autoplayTimeout:2000; 
//            loop:true,
//            margin:10,
//            nav:true,
//            responsive:{
//                0:{
//                    items:1
//                },
//                600:{
//                    items:3
//                },
//                1000:{
//                    items:5
//                }
//            }
 //      });
    </script>
    
    
    
    
    
    
    
          
         <!-------------------mas scripts de la plantilla--------------------------->
        <script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
       <!-- bootstrap 4 js -->
       <script src="assets/js/vendor/popper.min.js" type="text/javascript"></script>
       <script src="assets/js/bootstrap.min.js"></script>
       <script src="assets/js/owl.carousel.min.js"></script>
       <script src="assets/js/metisMenu.min.js"></script>
       <script src="assets/js/jquery.slimscroll.min.js"></script>
       <script src="assets/js/jquery.slicknav.min.js"></script>


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
       <!--<script src="assets/js/prueba.js" type="text/javascript"></script>-->
       <script src="assets/js/prueba.js" type="text/javascript"></script>
       <script src="assets/js/dtic.js" type="text/javascript"></script>
        <!--JS owl Carousel-->
        <!--<script src="assets/js/owl.carousel.js" type="text/javascript"></script>-->
        <!--<script src="assets/js/owl.carousel.min.js" type="text/javascript"></script>-->
        <!--<script src="https://code.jquery.com/jquery-3.6.0.min.js"</script>-->
        <!--<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>-->
        
        
        <!--<script src="assets/js/controluxflame.js" type="text/javascript"></script>-->
        <!--<script src="assets/js/prueba.js" type="text/javascript"></script>-->    
        <!--js para slider : https://youtu.be/Qc-LFzxoU6Q-->
        <script src="assets/js/lightslider.js" type="text/javascript"></script>
        <!--<script src="assets/js/sliderjquery.js" type="text/javascript"></script>-->
    
    <script>
///////        $(document).ready(function() {
 ///////          $('#autoWidth').lightSlider({
///////               autoWidth:true,
///////               loop:true,
///////               onSliderLoad: function(el) {
///////                   $('#autoWidth').removeClass('cS-hidden');
//                var maxHeight = 0,
//                container = $(el),
//                children = container.children();
//
//                children.each(function () {
//                    var childHeight = $(this).height();
//                    if (childHeight > maxHeight) {
//                        maxHeight = childHeight;
//                    }
//                });
//                container.height(maxHeight);
//                $(".box").height(maxHeight);
///////               }
//              onAfterSlide: function(el) {
////                  $('#autoWidth').removeClass('cS-hidden');
//                var maxHeight = 0,
//                container = $(el),
//                children = container.children();
//
//                children.each(function () {
//                    var childHeight = $(this).height();
//                    if (childHeight > maxHeight) {
//                        maxHeight = childHeight;
//                    }
//                });
//                container.height(maxHeight);
//              },
//              onBeforeSlide: function(el) {
////                  $('#autoWidth').removeClass('cS-hidden');
//                var maxHeight = 0,
//                container = $(el),
//                children = container.children();
//
//                children.each(function () {
//                    var childHeight = $(this).height();
//                    if (childHeight > maxHeight) {
//                        maxHeight = childHeight;
//                    }
//                });
//                container.height(maxHeight);
//              }
///////           });  
///////         });
    </script>
      
    <script>
//        $(document).ready(function() {
//          $('#autoWidth1').lightSlider({
//              autoWidth:true,
//              loop:true,
//              onSliderLoad: function() {
//                  $('#autoWidth1').removeClass('cS-hidden');
//              } 
//          });  
//        });
    </script>
    
    <script>
        function error(){
            $("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
                $("#success-alert").slideUp(500); 
            });
        }
    </script>
   
</html>