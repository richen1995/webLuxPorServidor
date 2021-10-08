<%-- 
    Document   : MostrarArtServicio
    Created on : 30/07/2021, 12:12:01
    Author     : Richard
--%>
<%@page import="servicios.sMaterial"%>
<%@page import="entidades.Material"%>
<%@page import="servicios.sKit"%>
<%@page import="entidades.Kit"%>
<%@page import="servicios.sMaterialservicio"%>
<%@page import="entidades.Materialservicio"%>
<%@page import="servicios.sCiudad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="servicios.sProvincia"%>
<%@page import="entidades.Provincia"%>
<%@page import="entidades.Ciudad"%>
<%@page import="entidades.Persona"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONObject"%>
<%@page import="servicios.sUsuario"%>
<%@page import="entidades.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Login</title>
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
    <!-- modernizr css -->
    <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/vendor/modernizr-2.8.3.min.js"></script>
    
    <!--CSS para el validacion del formulario-->
    <link href="assets/css/validacion.css" rel="stylesheet" type="text/css"/>
    
    <!--Validar con Validator jQuery-->
    <script src="assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>
    
    <!-- librerias para slider-->
    <link rel="stylesheet" type="text/css" href="assets/css/sliderprod.css"/>
    <link href="assets/css/lightslider.css" rel="stylesheet" type="text/css"/> <!--//CSS usaso parael slider--> 
    

        <%
//        String UsuLinea = session.getAttribute("cedula").toString();
//        String rolUsuario = session.getAttribute("rol").toString();
        
        String seccion = request.getParameter("seccion");
        String codservicio = request.getParameter("servicio");
        //tipoSrv = SRV1 => VIDEO VIGILANCIA
        //tipoSrv = SRV3 => DETECCIÓN Y EXTINCIÓN DE INCENDIOS
        //tipoSrv = SRV5 => CERCAS ELÉCTRICAS Y ALARMAS PERIMETRALES
        //tipoSrv = SRV2 => CABLEADO ELÉCTRICO
        
        ArrayList<Materialservicio> listMaterialSrv = new ArrayList<Materialservicio>();
        ArrayList<Material> listMaterial = new ArrayList<Material>();
        ArrayList<Kit> listKit = new ArrayList<Kit>();
        
        //MATERIALES
        if(seccion.equals("inicio")){
            String cadJSONmat = sMaterial.listaMaterialesPagWeb();
            String resultadoMat = "{\"respuesta\":" + cadJSONmat + "}";
            JSONObject objMat = new JSONObject(resultadoMat);
            JSONArray arrayMat = objMat.getJSONArray("respuesta");
                for (int i = 0; i < arrayMat.length(); i++) {
                    JSONObject childJSONObject = arrayMat.getJSONObject(i);
                    Material objMenus = new Gson().fromJson(childJSONObject.toString(), Material.class);
                    listMaterial.add(objMenus);
                    //int opc = childJSONObject.;
                }
        }else{
            String cadJSONmatSrv = sMaterialservicio.listaMaterialservicioporServicio(codservicio);
            String resultadoMatSrv = "{\"respuesta\":" + cadJSONmatSrv + "}";
            JSONObject objMatSrv = new JSONObject(resultadoMatSrv);
            JSONArray arrayMatSrv = objMatSrv.getJSONArray("respuesta");
                for (int i = 0; i < arrayMatSrv.length(); i++) {
                    JSONObject childJSONObject = arrayMatSrv.getJSONObject(i);
                    Materialservicio objMenus = new Gson().fromJson(childJSONObject.toString(), Materialservicio.class);
                    listMaterialSrv.add(objMenus);
                    //int opc = childJSONObject.;
                }
        }
        
        //KIT
        String cadJSONkit = "";
        if(seccion.equals("inicio")){
            cadJSONkit = sKit.listaKitsPagWeb();
        }else{
            cadJSONkit = sKit.listaKitporServicio(codservicio);
        }
        String resultadoKit = "{\"respuesta\":" + cadJSONkit + "}";
        JSONObject objKit = new JSONObject(resultadoKit);
        JSONArray arrayKit = objKit.getJSONArray("respuesta");
            for (int i = 0; i < arrayKit.length(); i++) {
                JSONObject childJSONObject = arrayKit.getJSONObject(i);
                Kit objMenus = new Gson().fromJson(childJSONObject.toString(), Kit.class);
                listKit.add(objMenus);
                //int opc = childJSONObject.;
            }
        
    %>
    <div class="main-header">
            <!--<h2>Articulos Electrónicos</h2>-->
            <!--<em>MATERIALES | KITS</em>-->
    </div>
    <div class="main-content">
        <section id="slider2">
            <ul id="autoWidth1" class="cs-hidden">
                <%
                Integer cont = 0; 
                if(!seccion.equals("inicio")){    
                    //Materiales - Servicio
                    for (Materialservicio objArtSrv : listMaterialSrv) {
                        //out.println("<td>" + oPet.getMatId().getMatImagen() +"</td>");

                        out.println("<li class=\"item-"+ cont +"\">");
                            out.println("<div class=\"box\">");
                                out.println("<div class=\"slide-img\">");
                                    out.println("<img src=\""+ objArtSrv.getMatId().getMatImagen() +"\" onclick=\"abrirModal('" + objArtSrv.getMatId().getMatId() + "','material')\" alt=\"camara\"/>");
                                out.println("</div>");
                                out.println("<div class=\"detail-box\">");
                                    out.println("<div class=\"type\">"); 
                                        out.println("<a href=\"#\">"+ objArtSrv.getMatId().getCtmtId().getCtmtNombre() +"</a>");
                                        out.println("<span>"+ objArtSrv.getMatId().getMatNombre() + "</span>");
                                    out.println("</div>");
                                    out.println("<a href=\"#\" class=\"price\">" + objArtSrv.getMatId().getMatPrecio() + " $</a>");                               
                                out.println("</div>");
                                out.println("<button id=\"btnCarrito\" class=\"btn btn-outline-secondary\" onclick=\"codMatKit('" + objArtSrv.getMatId().getMatId() + "','material')\"><i class=\"fas fa-shopping-cart\"></i>  Agregar al Carrito</button>");
                            out.println("</div>");
                        out.println("</li>");
                        cont++;
                    }
                }else{
                   //Materiales de la Ventana inicial de la Paguina Web
                    for (Material objMat : listMaterial) {
                        //out.println("<td>" + oPet.getMatId().getMatImagen() +"</td>");

                        out.println("<li class=\"item-"+ cont +"\">");
                            out.println("<div class=\"box\">");
                                out.println("<div class=\"slide-img\">");
                                    out.println("<img src=\""+ objMat.getMatImagen() +"\" onclick=\"abrirModal('" + objMat.getMatId() + "','material')\" alt=\"camara\"/>");
                                out.println("</div>");
                                out.println("<div class=\"detail-box\">");
                                    out.println("<div class=\"type\">"); 
                                        out.println("<a href=\"#\">"+ objMat.getCtmtId().getCtmtNombre() +"</a>");
                                        out.println("<span>"+ objMat.getMatNombre() + "</span>");
                                    out.println("</div>");
                                    out.println("<a href=\"#\" class=\"price\">" + objMat.getMatPrecio() + " $</a>");                                  
                                out.println("</div>");
                                out.println("<button id=\"btnCarrito\" class=\"btn btn-outline-secondary\" onclick=\"codMatKit('" + objMat.getMatId() + "','material')\"><i class=\"fas fa-shopping-cart\"></i>  Agregar al Carrito</button>");
                            out.println("</div>");
                        out.println("</li>");
                        cont++;
                    }
                }
                %>   
                 <!----------1----------->
                 <li class="item-a">
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
                 <!----------2-----------> 
                 <li class="item-b">
                     <div class="box">
                         <div class="slide-img">
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
                 <!-----------4----------->
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
                 <!------------5----------->
                 <li class="item-c">
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
                 
            <ul id="autoWidth" class="cs-hidden">
              <%
                //Kits
                for (Kit objKits : listKit) {
                    //out.println("<td>" + oPet.getMatId().getMatImagen() +"</td>");
                    out.println("<li class=\"item-"+ cont +"1\">");
                        out.println("<div class=\"box\">");
                            out.println("<div class=\"slide-img\">");
                                out.println("<img src=\""+ objKits.getKitImagen() +"\" onclick=\"abrirModal('" + objKits.getKitId() + "','kit')\" alt=\"camara\"/>");
                            out.println("</div>");
                            out.println("<div class=\"detail-box\">");
                                out.println("<div class=\"type\">"); 
                                    out.println("<a href=\"#\">"+ objKits.getKitMateriales() +"</a>");
                                    //out.println("<span> "+ objKits.getMatId().getMatNombre() + "</span>");
                                out.println("</div>");
                                out.println("<a href=\"#\" class=\"price\">" + objKits.getKitPrecio() + " $</a>");                                
                            out.println("</div>");
                            out.println("<button class=\"btn btn-outline-secondary\" onclick=\"codMatKit('" + objKits.getKitId() + "','kit')\"><i class=\"fas fa-shopping-cart\"></i>  Agregar al Carrito</button>");
                        out.println("</div>");
                    out.println("</li>");
                    cont++;
                }
              %>
            </ul>
        </section>
       
    </div>
            
        <!-- MODAL -->
        <div class="modal fade" id="crearCuenta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg  modal-dialog-centered " style="width: 80%;" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <!--<h5 class="modal-title" id="exampleModalLabel">Modal del KIT-PROD</h5>-->
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body-artmat">
                <form>
                    <div class="form-group">
                      <label for="emaill" class="col-form-label">Correo electrónico</label>
                      <input type="text" class="form-control" id="emaill">
                    </div>
                    <div class="form-group">
                      <label for="password1" class="col-form-label">Contraseña</label>
                      <input type="password" class="form-control" id="password1">
                    </div>
                    <div class="form-group">
                      <label for="password2" class="col-form-label">Vuelva a escribir la contraseña</label>
                      <input type="password" class="form-control" id="password2">
                    </div>
                </form>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <button type="button" class="btn btn-primary" value='loginAdmin' id="btnModal" onclick="controlLogin()">Crear Cuenta</button>
                    </div>
                </div>
              </div>
              <div class="modal-footer">
                <hr>
                <!--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>-->
                <div class="row">                                    
                    <div class="zoom-img modal-footer d-flex justify-content-center">
                        <div class="signup-section"><a href="#a" class="text-info" data-toggle="modal" data-target="#loginModal">Iniciar sesión</a></div>
                    
                    </div>
                </div>
              </div>
            </div>
        </div>
            
            
            
    
    
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/vendor/jquery-2.2.4.min.js"></script>
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

        <!--js para slider : https://youtu.be/Qc-LFzxoU6Q para slider de materiales-->
        <script src="assets/js/lightslider.js" type="text/javascript"></script>
       
    <script>
        $(document).ready(function() {
          $('#autoWidth, #autoWidth1').lightSlider({
              autoWidth:true,
              loop:true,
              onSliderLoad: function(el) {

                  //$('#autoWidth').removeClass('cS-hidden');
                var maxHeight = 0,
                container = $(el),
                children = container.children();

                children.each(function () {
                    var childHeight = $(this).height();
                    if (childHeight > maxHeight) {
                        maxHeight = childHeight;
                    }
                });
                container.height(maxHeight);
                //$(".box").height(maxHeight);
              } 
          });  
        });
    </script>
      
    <script>
//        $(document).ready(function() {
//          $('#autoWidth1').lightSlider({
//              autoWidth:true,
//              loop:true,
//              onSliderLoad: function(el) {
//                  //$('#autoWidth').removeClass('cS-hidden');
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
//          });  
//        });
    </script>
    </html>

