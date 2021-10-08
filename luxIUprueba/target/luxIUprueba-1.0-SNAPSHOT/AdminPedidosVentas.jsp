<%-- 
    Document   : AdminPedidosVentas
    Created on : 06/09/2021, 23:47:35
    Author     : Richard
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="servicios.sVentaprevia"%>
<%@page import="entidades.Ventaprevia"%>
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
    
        <!--estilos de iconos -->
    <link rel="stylesheet" href="assets/fontawesome/css/all.min.css" type="text/css"/>
    
    <!--Validar con Validator jQuery-->
    <script src="assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>
    
    <!--DataTable css con Bootstrap 4 -->
    <link rel ="stylesheet" type="text/css" href="assets/datatable/DataTables-1.10.25/css/dataTables.bootstrap4.min.css"/>
    <!--bootstrap-datepicker-->
    <link href="assets/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css"/>
    <!--alertify-->
    <link href="assets/css/alertify.css" rel="stylesheet" type="text/css"/>
    <!--toast-->
    <link href="assets/css/toastr.min.css" rel="stylesheet" type="text/css"/>

    
  <%
    String codSistema = request.getParameter("codSistema");//captura del codigo del sistema de seguridad electronico(servicio) 
    
    String UsuLinea = session.getAttribute("cedula").toString();
    String rolMaterial = session.getAttribute("rol").toString();

    //OBTENER FECHA ACTUAL
    Date date = new Date();
    DateFormat fechaHora = new SimpleDateFormat("yyyy-MM-dd");
    String fechaActual = fechaHora.format(date);
    
    ArrayList<Ventaprevia> listVentaprevia = new ArrayList<Ventaprevia>();
    ArrayList<Kit> listKit = new ArrayList<Kit>();
    
    
    if (session.getAttribute("ingreso").toString().equals("true")) {
        //Materiales de un Servicio determinado
        String cadJSONvntprv = sVentaprevia.listaOrdenadaPorFecha();
        String resultadoVntprv = "{\"respuesta\":" + cadJSONvntprv + "}";
        JSONObject objVntprv = new JSONObject(resultadoVntprv);
        JSONArray arrayTipoCer = objVntprv.getJSONArray("respuesta");
            for (int i = 0; i < arrayTipoCer.length(); i++) {
                JSONObject childJSONObject = arrayTipoCer.getJSONObject(i);
                Ventaprevia objMenus = new Gson().fromJson(childJSONObject.toString(), Ventaprevia.class);
                listVentaprevia.add(objMenus);
            }
            
        //    
            
            
        //Kits de un Servicio determinado
//        String cadJSONkit = sKit.listaKitporServicio(codSistema);
//        String resultadoKit = "{\"respuesta\":" + cadJSONkit + "}";
//        JSONObject objKit = new JSONObject(resultadoKit);
//        JSONArray arrayKit = objKit.getJSONArray("respuesta");
//            for (int i = 0; i < arrayKit.length(); i++) {
//                JSONObject childJSONObject = arrayKit.getJSONObject(i);
//                Kit objMenus = new Gson().fromJson(childJSONObject.toString(), Kit.class);
//                listKit.add(objMenus);
//            }
            
    } else {
        response.sendRedirect("index.jsp");
    }


    SimpleDateFormat formato1 = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat formato2 = new SimpleDateFormat("dd-MM-yyyy");
    Date f;
    
    %>
    
    <div class="main-header">
        <br>
        <h4>Pedidos / Ventas de Kits y Materiales Electrónicos</h4>
        <em>PEDIDOS/VENTAS</em>
        <hr>
    </div>
    <div class="container">
        <!--<div class="well well-lg knowledge-recent-popular">-->
            <div class="row">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Busqueda por Fechas</h5>
                        <form class="form-inline" id = "FrmBuscarVntPed">
                            <div class="form-group col-md-4">
                                <label for="FechaInicial">Fecha Inicial</label>
                                <input data-date-format="DD MMMM YYYY" value="<%= fechaActual %>" required="true" type="date" class="form-control" id="FechaInicial" name="FechaInicial" placeholder="Ingrese la Fecha Inicial">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="FechaFinal">Fecha Final</label>
                                <input data-date-format="DD MMMM YYYY" value="<%= fechaActual %>" required="true" type="date" class="form-control" id="FechaFinal" name="FechaFinal" placeholder="Ingrese la Fecha Final">
                            </div>
                            <div class="form-group col-md-3">
<!--                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="rdOperacion" id="rdPedido" value="pedido" checked>
                                    <label class="form-check-label" for="inlineRadio2">Pedidos de Compra</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="rdOperacion" id="rdVenta" value="venta">
                                    <label class="form-check-label" for="inlineRadio2">Ventas</label>
                                </div>-->
                            </div>
                             <button type="button" onclick="buscarVntPedFecha()" class="btn btn-primary mb-2">Buscar</button>
                        </form>
                    </div>
                </div>
            </div>
        <!--</div>-->
        <div class="col-sm-12 d-flex justify-content-center" align='right'>
            <%
//                Servicio objservicio = new Servicio();
//                String cadJSONservicio = sServicio.listaServicioId(codSistema);
//                JSONObject jsonServicio = new JSONObject(cadJSONservicio);
//                objservicio = new Gson().fromJson(jsonServicio.toString(), Servicio.class);
            %>

        </div>
        <div class="nav-tabs-custom" id="contenidoDinamicoVntPed">
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link active" href="#blkListPedidos" data-toggle="tab">Pedidos</a></li>
                <li class="nav-item"><a class="nav-link" href="#blkListVentas" data-toggle="tab">Ventas</a></li>
                <!--<li class="nav-item"><a class="nav-link" href="#blkAddMaterial" data-toggle="tab">Agregar nuevo</a></li>-->
            </ul>
            <div class="tab-content">
                <!--PEDIDOS-->
                <div class="active tab-pane" id="blkListPedidos">
                    <div class="widget widget-table">  
                        <div class="widget-content">
                            <table id="tbl" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Nombre</th>
                                        <th>Importe</th>
                                        <th>Fecha</th>
                                        <th>Hora</th>
                                        <th>Estado</th>                                            
                                        <th>Detalle</th>                                            
                                    </tr>
                                </thead>
                                <tbody>
                                    <% int cont = 0; 
                                        for (Ventaprevia oPet : listVentaprevia) {
//                                                if((!oPet.getIntrolId().getStrnombre().equals("MI PERFIL")) && (oPet.getIntrolId().getStrnombre().equals("CB ADMINISTRADOR"))&& rolOpc.equals("administrador"))
                                            //if(Integer.parseInt(oPet.getUsRol()) == 3) 
                                            //{
                                            cont++;
                                            out.println("<tr>");
                                            out.println("<td>" + cont + "</td>");
                                            out.println("<td>" + oPet.getPerCedula().getPerNombre() + " " + oPet.getPerCedula().getPerApellido() + "</td>");
                                            out.println("<td>" + oPet.getVntpImporte() +" $</td>");
                                            String[] fecha = oPet.getVntpFecha().split("T");
                                            f = formato1.parse(fecha[0]);
                                            out.println("<td>" + formato2.format(f) + "</td>");
                                            String[] hora = oPet.getVntpHora().split("T");
                                            String[] h = hora[1].split("-");
                                            out.println("<td>" + h[0] + "</td>");
                                            if (oPet.getVntpEstado().equals("pendiente")) {
                                                out.println("<td> <span class='badge badge-pill badge-warning'>En espera</span> </td>");
                                            }
                                            if (oPet.getVntpEstado().equals("cancelado")) {
                                                out.println("<td> <span class='badge badge-pill badge-danger'>Cancelado</span> </td>");
                                            }
                                            if (oPet.getVntpEstado().equals("pagado")) {
                                                out.println("<td> <span class='badge badge-pill badge-success'>Pagado</span> </td>");
                                            }
                                            out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i style='cursor: pointer' onclick='detalleVntAdmin(" + oPet.getVntpId() + ");' class='fas fa-angle-double-right  badge badge-primary' title='Mas Información'>Detalle</i></td>");
                                            //out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='ChekPermisos(" + oPet.getUsId()  + ", \"supervisor\");' class='fa fa-check-circle' title='Permisos' ></i></td>");
                                            out.println("</tr>");
                                        }                                            
                                    %>
                                </tbody>
                            </table>                                            
                        </div>
                    </div>                                                     
                </div>
                <!--VENTAS-->
                <div class="tab-pane" id="blkListVentas">
                    <div class="widget widget-table">
                        <div class="widget-content">
                          <div class="table-responsive">
                            <table id="tbl2" class="table table table-striped table-bordered">
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

                                    <% /*Integer cont1 = 0; 
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
                                               /* out.println("</tr>");
                                            //}
                                        }*/                                            
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

        <!--DATATABLE-->
       <script src="assets/datatable/DataTables-1.10.25/js/jquery.dataTables.min.js" type="text/javascript"></script>
       <script src="assets/datatable/DataTables-1.10.25/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
       <script src="assets/js/traducciondatatable.js" type="text/javascript"></script>
     
       <!--alertify-->
       <script src="assets/js/alertify.js" type="text/javascript"></script>
       <!--toast-->
       <script src="assets/js/toastr.min.js" type="text/javascript"></script>
       
       <!--bootstrap-datepicker-->
       <script src="assets/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
       
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
       <script src="assets/js/prueba.js"></script>
       
       
    </html>