<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONObject"%>
<%@page import="servicios.sServicio"%>
<%@page import="entidades.Servicio"%>
<%@page import="entidades.Persona"%>
<%@page contentType='text/html' pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">-->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <!-- links de google Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300&display=swap" rel="stylesheet">

        <!--estilos de iconos -->
        <link rel="stylesheet" href="assets/fontawesome/css/all.min.css" type="text/css"/>

        <!--estilos css estilo para pa paguina principal-->
        <link rel="stylesheet" href="assets/css/estilo.css" type="text/css"/>
        
        <!------------------scripts de la plantilla añadido------------------->    
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/themify-icons.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/metisMenu.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/slicknav.min.css">
        <!-- amchart css -->
        <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
        <!-- others css -->
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/typography.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/default-css.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/styles.css">
        <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/responsive.css">
        <!--css Owl Carousel 2 para slider horizontal de imagenes-->
        <!--<link href="assets/css/owl.carousel.min.css" rel="stylesheet" type="text/css"/>-->
        <!--<link rel="stylesheet" href="assets/css/owl.carousel.css">-->
        <!--<link rel="stylesheet" href="assets/css/owl.theme.default.css">-->
        <!--<link rel="stylesheet" href="assets/css/sliderarticulos.css">-->
        <!--css para slider tuto 2  https://www.youtube.com/watch?v=YunLfczBbkY-->
        <link rel="stylesheet" type="text/css" href="assets/css/sliderprod.css"/>
        <link href="assets/css/lightslider.css" rel="stylesheet" type="text/css"/> <!--//CSS usaso parael slider--> 
        <!-- modernizar css -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/vendor/modernizr-2.8.3.min.js"></script>

        <title>Hello, world!</title>
    </head>
    <link href="assets/css/owl.theme.default.css" rel="stylesheet" type="text/css"/>
    <%
        session.setAttribute("Cedula", "");
        session.setAttribute("TipoUser", "");
        session.setAttribute("ingreso", "false");
    %>
    

    <body>
        <section id="sl1">
             <ul id="autoWidth" class="cs-hidden">
                <!----------1----------->
                <li class="item-a">
                    <div class="box">
                        <div class="slider">
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
                <!----------2-----------> 
                <li class="item-b">
                    <div class="box">
                        <div class="slider">
                            <img src="assets/images/imglux/camara-hikvision.jpg" alt="camara"/>

                        </div>
                        <div class="detail-box">
                            <div class="type">
                                <a href="#">XXXXXXXXXXXXXXXXXX</a> 
                                <span>Camara</span>
                            </div>  
                            <a href="#" class="price">$23</a>   
                        </div>
                    </div>
                </li>
                <!------------3----------->
                <li class="item-c">
                    <div class="box">
                        <div class="slider">
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
                <!-----------4----------->
                <li class="item-d">
                    <div class="box">
                        <div class="slider">
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
                <!------------5----------->
                <li class="item-c">
                    <div class="box">
                        <div class="slider">
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
                <!-----------6----------->
                <li class="item-d">
                    <div class="box">
                        <div class="slider">
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
        <section id="sl2">
            <ul id="autoWidth1" class="cs-hidden">
                <!----------1----------->
                <li class="item-a">
                    <div class="box">
                        <div class="slider">
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
                <!----------2-----------> 
                <li class="item-b">
                    <div class="box">
                        <div class="slider">
                            <img src="assets/images/imglux/camara-hikvision.jpg" alt="camara"/>

                        </div>
                        <div class="detail-box">
                            <div class="type">
                                <a href="#">XXXXXXXXXXXXXXXXXX</a> 
                                <span>Camara</span>
                            </div>  
                            <a href="#" class="price">$23</a>   
                        </div>
                    </div>
                </li>
                <!------------3----------->
                <li class="item-c">
                    <div class="box">
                        <div class="slider">
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
                <!-----------4----------->
                <li class="item-d">
                    <div class="box">
                        <div class="slider">
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
                <!------------5----------->
                <li class="item-c">
                    <div class="box">
                        <div class="slider">
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
                <!-----------6----------->
                <li class="item-d">
                    <div class="box">
                        <div class="slider">
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
            
    </body>
    
            <!-------------------mas scripts de la plantilla--------------------------->
        <script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
        <!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>-->
       <!-- bootstrap 4 js -->
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/popper.min.js"></script>
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/bootstrap.min.js"></script>
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/owl.carousel.min.js"></script>
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/metisMenu.min.js"></script>
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.slimscroll.min.js"></script>
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.slicknav.min.js"></script>

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
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/line-chart.js"></script>
       <!-- all pie chart -->
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/pie-chart.js"></script>
       <!-- others plugins -->
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/plugins.js"></script>
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/scripts.js"></script>
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/prueba.js" type="text/javascript"></script>
    
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
        $(document).ready(function() {
          $('#autoWidth').lightSlider({
              autoWidth:true,
              loop:true,
              onSliderLoad: function() {
                  $('#autoWidth').removeClass('cS-hidden');
              } 
          });  
        });
      </script>
      
      <script>
        $(document).ready(function() {
          $('#autoWidth1').lightSlider({
              autoWidth:true,
              loop:true,
              onSliderLoad: function() {
                  $('#autoWidth1').removeClass('cS-hidden');
              } 
          });  
        });
      </script>
</html>