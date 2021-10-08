<%-- 
    Document   : AdminFrmMaterial
    Created on : 26/05/2021, 12:28:30
    Author     : Richard
--%>

<%@page import="servicios.sKit"%>
<%@page import="entidades.Kit"%>
<%@page import="entidades.Materialkit"%>
<%@page import="servicios.sMaterialservicio"%>
<%@page import="entidades.Materialservicio"%>
<%@page import="entidades.Servicio"%>
<%@page import="servicios.sServicio"%>
<%@page import="servicios.sCiudad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="servicios.sMaterial"%>
<%@page import="entidades.Material"%>
<%@page import="entidades.Ciudad"%>
<%@page import="entidades.Persona"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONObject"%>
<%@page import="servicios.sMaterial"%>
<%@page import="entidades.Material"%>
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
    
  <%
    String codSistema = request.getParameter("codSistema");//captura del codigo del sistema de seguridad electronico(servicio) 
    
    String UsuLinea = session.getAttribute("cedula").toString();
    String rolMaterial = session.getAttribute("rol").toString();

    ArrayList<Materialservicio> listMaterialservicio = new ArrayList<Materialservicio>();
    ArrayList<Kit> listKit = new ArrayList<Kit>();
    
    
    if (session.getAttribute("ingreso").toString().equals("true")) {
        //Materiales de un Servicio determinado
        String cadJSONmatsvr = sMaterialservicio.listaMaterialservicioporServicio(codSistema);
        String resultadoMatsvr = "{\"respuesta\":" + cadJSONmatsvr + "}";
        JSONObject objMatsvr = new JSONObject(resultadoMatsvr);
        JSONArray arrayTipoCer = objMatsvr.getJSONArray("respuesta");
            for (int i = 0; i < arrayTipoCer.length(); i++) {
                JSONObject childJSONObject = arrayTipoCer.getJSONObject(i);
                Materialservicio objMenus = new Gson().fromJson(childJSONObject.toString(), Materialservicio.class);
                listMaterialservicio.add(objMenus);
            }
            
        //Kits de un Servicio determinado
        String cadJSONkit = sKit.listaKitporServicio(codSistema);
        String resultadoKit = "{\"respuesta\":" + cadJSONkit + "}";
        JSONObject objKit = new JSONObject(resultadoKit);
        JSONArray arrayKit = objKit.getJSONArray("respuesta");
            for (int i = 0; i < arrayKit.length(); i++) {
                JSONObject childJSONObject = arrayKit.getJSONObject(i);
                Kit objMenus = new Gson().fromJson(childJSONObject.toString(), Kit.class);
                listKit.add(objMenus);
            }
            
    } else {
        response.sendRedirect("index.jsp");
    }

    %>
    <div class="main-content ">
        <div class="col-sm-12 d-flex justify-content-center" align='right'>
            <%
                Servicio objservicio = new Servicio();
                String cadJSONservicio = sServicio.listaServicioId(codSistema);
                JSONObject jsonServicio = new JSONObject(cadJSONservicio);
                objservicio = new Gson().fromJson(jsonServicio.toString(), Servicio.class);
            %>
            <h3> MATERIALES Y KIDS DE <%= objservicio.getSrvNombre() %></h3>
        </div>
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link active" href="#blkListMateriales" data-toggle="tab">Materiales</a></li>
                <li class="nav-item"><a class="nav-link" href="#blkListKits" data-toggle="tab">Kits</a></li>
                <!--<li class="nav-item"><a class="nav-link" href="#blkAddMaterial" data-toggle="tab">Agregar nuevo</a></li>-->
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="blkListMateriales">
                    <div class="row">
                        <div class="widget widget-table">
                            <div class="widget-header">
                                <h5><i class="fa fa-table"></i>EQUIPOS ELECTRÓNICOS</h5> 
                            </div>
                            <div class="widget-content">
                              <div class="table-responsive">
                                <table id="featured-datatable" class="table table-sorting table-hover table-bordered datatable">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Nombre</th>
                                            <th>Precio</th>
                                            <th>Stock</th>
                                            <th>Marca</th>                                            
                                            <th>Imagen</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <% Integer cont = 0; 
                                            for (Materialservicio oPet : listMaterialservicio) {
//                                                if((!oPet.getIntrolId().getStrnombre().equals("MI PERFIL")) && (oPet.getIntrolId().getStrnombre().equals("CB ADMINISTRADOR"))&& rolOpc.equals("administrador"))
                                                //if(Integer.parseInt(oPet.getUsRol()) == 3) 
                                                //{
                                                    cont++;
                                                    out.println("<tr>");
                                                    out.println("<td>" + cont + "</td>");
                                                    out.println("<td>" + oPet.getMatId().getMatNombre() + "</td>");
                                                    out.println("<td>" + oPet.getMatId().getMatPrecio() +"</td>");
                                                    out.println("<td>" + oPet.getMatId().getMatStock()  + "</td>");
                                                    out.println("<td>" + oPet.getMatId().getMatMarca()  + "</td>");
                                                    out.println("<td>" + oPet.getMatId().getMatImagen() +"</td>");
                                                    /*if (oPet.getUsEstado() == true) {
                                                        out.println("<td> <span class='badge badge-pill badge-success'>Habilitado</span> </td>");
                                                    }
                                                    if (oPet.getUsEstado() == false) {
                                                        out.println("<td> <span class='badge badge-pill badge-danger'>Desabilitado</span> </td>");
                                                    }
                                                    out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='MostAdministrador(" + oPet.getUsId() + ");' class='fa fa-edit' title='Editar' ></i></td>");
                                                    out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='ChekPermisos(" + oPet.getUsId()  + ", \"supervisor\");' class='fa fa-check-circle' title='Permisos' ></i></td>");*/
                                                    out.println("</tr>");
                                                //}
                                            }                                            
                                        %>
                                    </tbody>
                                </table>
                            </div>
                            </div>
                        </div>

                    </div>
                </div>
                           
                <!--KITS-->
                <div class="tab-pane" id="blkListKits">
                    <div class="row">
                        <div class="widget widget-table">
                            <div class="widget-header">
                                <h5><i class="fa fa-table"></i>EQUIPOS ELECTRÓNICOS</h5> 
                            </div>
                            <div class="widget-content">
                              <div class="table-responsive">
                                <table id="featured-datatable" class="table table-sorting table-hover table-bordered datatable">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Elementos del Kit</th>
                                            <th>Precio</th>
<!--                                            <th>Stock</th>
                                            <th>Marca</th>                                            
                                            <th>Imagen</th>-->
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <% Integer cont1 = 0; 
                                            for (Kit oPet : listKit) {
//                                                if((!oPet.getIntrolId().getStrnombre().equals("MI PERFIL")) && (oPet.getIntrolId().getStrnombre().equals("CB ADMINISTRADOR"))&& rolOpc.equals("administrador"))
                                                //if(Integer.parseInt(oPet.getUsRol()) == 3) 
                                                //{
                                                    cont1++;
                                                    out.println("<tr>");
                                                    out.println("<td>" + cont1 + "</td>");
                                                    out.println("<td>" + oPet.getKitMateriales()+ "</td>");
                                                    out.println("<td>" + oPet.getKitPrecio() +"</td>");
//                                                    out.println("<td>" + oPet.getMatId().getMatStock()  + "</td>");
//                                                    out.println("<td>" + oPet.getMatId().getMatMarca()  + "</td>");
//                                                    out.println("<td>" + oPet.getMatId().getMatImagen() +"</td>");
                                                    /*if (oPet.getUsEstado() == true) {
                                                        out.println("<td> <span class='badge badge-pill badge-success'>Habilitado</span> </td>");
                                                    }
                                                    if (oPet.getUsEstado() == false) {
                                                        out.println("<td> <span class='badge badge-pill badge-danger'>Desabilitado</span> </td>");
                                                    }
                                                    out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='MostAdministrador(" + oPet.getUsId() + ");' class='fa fa-edit' title='Editar' ></i></td>");
                                                    out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='ChekPermisos(" + oPet.getUsId()  + ", \"supervisor\");' class='fa fa-check-circle' title='Permisos' ></i></td>");*/
                                                    out.println("</tr>");
                                                //}
                                            }                                            
                                        %>
                                    </tbody>
                                </table>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
                                    
            </div>
        </div>
    </div>
                 
    <!--JS mensajes para el validacion del formulario-->
    <script src="assets/js/traducciones.js" type="text/javascript"></script>
        
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
       
       
    </html>

