<%-- 
    Document   : AdminDetallePedVnt
    Created on : 10/09/2021, 10:45:15
    Author     : Richard
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="servicios.sVentakit"%>
<%@page import="entidades.Ventakit"%>
<%@page import="entidades.Ventamaterial"%>
<%@page import="servicios.sVentamaterial"%>
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
    
  <% 
    String UsuLinea = session.getAttribute("cedula").toString();
    String rolMaterial = session.getAttribute("rol").toString();

    String codvntprv = request.getParameter("codvntprv");//captura del codigo de la tabla VentaPrevia 
    
    Ventaprevia objVntPrv = new Ventaprevia();
    ArrayList<Ventamaterial> listVentamaterial = new ArrayList<Ventamaterial>();
    ArrayList<Ventakit> listVentakit = new ArrayList<Ventakit>();
    
    ArrayList<Kit> listKit = new ArrayList<Kit>();
    
    
    if (session.getAttribute("ingreso").toString().equals("true")) {
        
        //VENTAPREVIA - PEDIDO
        String cadJSONvntprv = sVentaprevia.listaVentapreviaId(Integer.parseInt(codvntprv));
        JSONObject jsonObjVntprv = new JSONObject(cadJSONvntprv);
        objVntPrv = new Gson().fromJson(jsonObjVntprv.toString(), Ventaprevia.class);
        
        //VENTA-MATERIAL
        String cadJSONvntmat = sVentamaterial.listaVentamaterialporCodVntPrv(codvntprv);
        if(!cadJSONvntmat.isEmpty()){
            String resultadoVntmat = "{\"respuesta\":" + cadJSONvntmat + "}";
            JSONObject objVntmat = new JSONObject(resultadoVntmat);
            JSONArray arrayVntmat = objVntmat.getJSONArray("respuesta");
            for (int i = 0; i < arrayVntmat.length(); i++) {
                JSONObject childJSONObject = arrayVntmat.getJSONObject(i);
                Ventamaterial objMenus = new Gson().fromJson(childJSONObject.toString(), Ventamaterial.class);
                listVentamaterial.add(objMenus);
            }
        }
        
        //VENTA-KIT
        String cadJSONvntkit = sVentakit.listaVentakitporCodVntPrv(codvntprv);
        if(!cadJSONvntkit.isEmpty()){
            String resultadoVntkit = "{\"respuesta\":" + cadJSONvntkit + "}";
            JSONObject objVntkit = new JSONObject(resultadoVntkit);
            JSONArray arrayVntkit = objVntkit.getJSONArray("respuesta");
            for (int i = 0; i < arrayVntkit.length(); i++) {
                JSONObject childJSONObject = arrayVntkit.getJSONObject(i);
                Ventakit objMenus = new Gson().fromJson(childJSONObject.toString(), Ventakit.class);
                listVentakit.add(objMenus);
            }
        }  
        
        
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
        <div class="row">
            <div class="col-md-6">
                <br>
                <h4>Datos del Pedido de Compra Solicitado</h4>
                <em>PEDIDO DE COMPRA</em>               
            </div>
            <div class="col-md-6" align="right">
                <br>
                <!--<h3><span class='badge badge-pill badge-danger'>Cancelado</span></h3>-->
                    <%
                    if (objVntPrv.getVntpEstado().equals("pendiente")) {
                        out.println("<h3 align='rigth'> <span class='badge badge-pill badge-warning'>En espera</span> </h3>");
                    }
                    if (objVntPrv.getVntpEstado().equals("cancelado")) {
                        out.println("<h3> <span class='badge badge-pill badge-danger'>Cancelado</span> </h3>");
                    }
                    if (objVntPrv.getVntpEstado().equals("pagado")) {
                        out.println("<h3> <span class='badge badge-pill badge-success'>Pagado</span> </h3>");
                    }
                %>
            </div>
        </div>
        <hr><br>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="header-title">Datos Personales</h5>  
                        <div class="frm-input col-md-12">
                            <h6>Nombre</h6> 
                            <label style="font-size:1.2em"><%= objVntPrv.getPerCedula().getPerNombre() + " " + objVntPrv.getPerCedula().getPerApellido()%></label>
                        </div>
                        <div class="frm-input col-md-6">
                            <h6>Cédula</h6> 
                            <label style="font-size:1.2em"><%= objVntPrv.getPerCedula().getPerCedula() %></label>
                        </div>
                        <div class="frm-input col-md-6">
                            <h6>Celular</h6>
                            <label style="font-size:1.2em"><%= objVntPrv.getPerCedula().getPerCelular() %></label>
                        </div>
                        <div class="frm-input col-md-12">
                            <h6>Correo Electrónico</h6>
                            <label style="font-size:1.2em"><%= objVntPrv.getPerCedula().getPerCelular() %></label>
                        </div> 
                    </div>
                </div>
            </div>
        
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="header-title">Dirección de Envio</h5>  
                            <div class="row">
                                <div class="frm-input col-md-6 mb-3">
                                    <h6>Provincia</h6>
                                    <label style="font-size:1.2em"><%= objVntPrv.getCidCodigo().getPrvCodigo().getPrvNombre()%></label>
                                </div>
                                <div class="frm-input col-md-6 mb-2">
                                    <h6>Ciudad</h6>
                                    <label style="font-size:1.2em"><%= objVntPrv.getCidCodigo().getCidNombre() %></label>
                                </div>
                                <div class="frm-input col-md-12 mb-1">
                                    <h6>Calle Principal</h6>
                                    <label style="font-size:1.2em"><%= objVntPrv.getVntpCallefirst() %></label>
                                </div>
                                <div class="frm-input col-md-12">
                                    <h6>Calle Secundaria</h6>
                                    <label style="font-size:1.2em"><%= objVntPrv.getVntpCallesecond() %></label>
                                </div>
                                <div class="frm-input col-md-6">
                                    <h6 >Codigo Postal</h6>
                                    <label style="font-size:1.2em"><%= objVntPrv.getVntpCodpostal() %></label>
                                </div>
                                <div class="frm-input col-md-6">
                                    <h6 >No. de Casa</h6>
                                    <label style="font-size:1.2em"><%= objVntPrv.getVntpNumcasa() %></label>
                                </div>
                                <div class="frm-input col-md-12 mb-3">
                                    <h6 >Sector</h6>
                                    <label style="font-size:1.2em"><%= objVntPrv.getVntpSector() %></label>
                                </div>
                                <div class="frm-input col-md-12 mb-3">
                                    <h6 >Referencia</h6>
                                    <label style="font-size:1.2em"><%= objVntPrv.getVntpReferencia() %></label>
                                </div>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
    </div>
    <br>
    <!--<div class="main-content">-->
    <div class="container">
        <div class="col-sm-12 d-flex justify-content-center" align='left'>
<!--            <form role="form" id="buscarPedMat">
                <legend class="col-form-label">Estado del Pedido</legend>
                <div class="form-group row">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked>
                        <label class="form-check-label" for="inlineRadio1">Pendiente</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                        <label class="form-check-label" for="inlineRadio2">Pagado</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                        <label class="form-check-label" for="inlineRadio2">Cancelado</label>
                    </div>
                </div>
            </form>-->
            <%
//                Servicio objservicio = new Servicio();
//                String cadJSONservicio = sServicio.listaServicioId(codSistema);
//                JSONObject jsonServicio = new JSONObject(cadJSONservicio);
//                objservicio = new Gson().fromJson(jsonServicio.toString(), Servicio.class);
            %>

        </div>
            
        <table id="featured-datatable" class="table table-sorting table-hover table-bordered datatable">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Imagen</th>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Cantidad</th>                                           
                    <th>Precio Total</th>                                            
                </tr>
            </thead>
            <tbody>
                <% int cont = 0; 
                   float pt ;
                    for (Ventamaterial oPet : listVentamaterial) {
//                                                if((!oPet.getIntrolId().getStrnombre().equals("MI PERFIL")) && (oPet.getIntrolId().getStrnombre().equals("CB ADMINISTRADOR"))&& rolOpc.equals("administrador"))
                        //if(Integer.parseInt(oPet.getUsRol()) == 3) 
                        //{
                        cont++;
                        out.println("<tr>");
                        out.println("<td>" + cont + "</td>");
                        out.println("<td><img style='width: 110px' src = '" + oPet.getMatId().getMatImagen() + "'></td>");
                        out.println("<td style='font-size: 0.8em;'>" + oPet.getMatId().getMatNombre() +"</td>");
                        //out.println("<td>" + oPet.getMatId().getCtmtId().getCtmtNombre() + "</td>");
                            String cadDetalle = oPet.getMatId().getCtmtId().getCtmtNombre();
                            if(oPet.getMatId().getMatMarca() != null){
                                cadDetalle = cadDetalle + " | " + oPet.getMatId().getMatMarca();
                            }
                            if(oPet.getMatId().getMatResolucion() != null){
                                cadDetalle = cadDetalle + " | " + oPet.getMatId().getMatResolucion();
                            }
                            if(oPet.getMatId().getMatVoltaje() != null){
                                cadDetalle = cadDetalle + " | " + oPet.getMatId().getMatVoltaje() + " V";
                            }
                            if(oPet.getMatId().getMatCorriente() != null){
                                cadDetalle = cadDetalle + " | " + oPet.getMatId().getMatCorriente() + " A";
                            }
                            if(oPet.getMatId().getMatPotencia() != null){
                                cadDetalle = cadDetalle + " | " + oPet.getMatId().getMatPotencia() + " W";
                            }
                            if(oPet.getMatId().getMatTipoconexion() != null){
                                cadDetalle = cadDetalle + " | " + oPet.getMatId().getMatTipoconexion();
                            }
                            if(oPet.getMatId().getMatCapacidad() != null){
                                cadDetalle = cadDetalle + " | " + oPet.getMatId().getMatCapacidad();
                            }
                            if(oPet.getMatId().getMatSalidas() != null){
                                cadDetalle = cadDetalle + " | " + oPet.getMatId().getMatSalidas();
                            }
                            if(oPet.getMatId().getMatCompresion() != null){
                                cadDetalle = cadDetalle + " | " + oPet.getMatId().getMatCompresion();
                            }
                            if(oPet.getMatId().getMatTasa() != null){
                                cadDetalle = cadDetalle + " | " + oPet.getMatId().getMatTasa();
                            }
                            if(oPet.getMatId().getMatDimencion() != null){
                                cadDetalle = cadDetalle + " | " + oPet.getMatId().getMatDimencion();
                            }
                        out.println("<td>" + cadDetalle + "</td>");
                        out.println("<td>" + oPet.getMatId().getMatPrecio() +" $</td>");
                        out.println("<td>" + oPet.getVtmtCantidad() +"</td>");
                        pt = oPet.getMatId().getMatPrecio().floatValue() * oPet.getVtmtCantidad();
                        out.println("<td>" + pt +" $</td>");
                        out.println("</tr>");
                    }    

                    for (Ventakit oKit : listVentakit) {
                        cont++;
                        out.println("<tr>");
                        out.println("<td>" + cont + "</td>");
                        out.println("<td><img style='width: 110px' src = '" + oKit.getKitId().getKitImagen() + "'></td>");
                        out.println("<td style='font-size: 0.8em;'>" + oKit.getKitId().getKitId() +"</td>");
                        out.println("<td>" + oKit.getKitId().getKitMateriales() + "</td>");
                        out.println("<td>" + oKit.getKitId().getKitPrecio() +" $</td>");
                        out.println("<td>" + oKit.getVtktCantidad() +"</td>");
                        pt = oKit.getKitId().getKitPrecio().floatValue() * oKit.getVtktCantidad();
                        out.println("<td>" + pt +" $</td>");
                        out.println("</tr>");
                    }
                %>
            </tbody>
        </table>                                            

    </div>
    <div class="container"> 
        <div class="row">
            <div class="col-md-6">
<!--                <h4>Modo de Pago</h4>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                    <label class="form-check-label" for="exampleRadios1">
                      Deposito/Transferencia
                    </label>
                </div>
                <div class="col-sm-6" align='center'>
                    <button id = "btnFormulario" class="btn btn-primary" data-toggle="modal" onclick="guardarVenta(<%= "cedula"%>)" data-target="#cuentaBancoModal">Confirmar Pedido</button>
                </div>-->
            </div>
            <div class="col-md-6">
                <div class="table-responsive align-self-center">
                    <table id="tbl" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>Precio</th>
                             </tr>
                        </thead>
                        <tbody>
                            <% cont = 0;
                                float totmat = 0, totkit = 0;
                                DecimalFormat df = new DecimalFormat("#.##");
                                for (Ventamaterial oPet:listVentamaterial) {
                                    cont++;
                                    out.println("<tr id='fila" + cont + "'>");
                                        out.println("<td>" + oPet.getMatId().getCtmtId().getCtmtNombre() + "</td>");
                                        out.println("<td>" + oPet.getVtmtCantidad() + "</td>");
                                        float precio = oPet.getVtmtCantidad() * oPet.getMatId().getMatPrecio().floatValue();
                                        totmat = totmat + precio;
                                        out.println("<td>" + precio +" $"+ "</td>");
                                    out.println("</tr>");
                                }
                                cont = 0; 
                                for (Ventakit oKit:listVentakit) {
                                    cont++;
                                    out.println("<tr id='filaa" + cont + "'>"); 
                                        out.println("<td>" + oKit.getKitId().getKitMateriales() + "</td>");
                                        out.println("<td>" + oKit.getVtktCantidad() + "</td>");
                                        float precio = oKit.getVtktCantidad() * oKit.getKitId().getKitPrecio().floatValue();
                                        totkit = totkit + precio;
                                        out.println("<td>" + precio +" $"+ "</td>");
                                    out.println("</tr>");
                                }
                            %>
                            <tr>
                                <td colspan="2">Subtotal</td>
                                <td><%= df.format(totkit + totmat) %> $</td>
                            </tr>
                            <tr>
                                <td colspan="2">IVA</td>
                                <td><%= df.format((totkit + totmat) * 0.12) %> $</td>
                            </tr>
                            <tr>
                                <td colspan="2">TOTAL</td>
                                <td><%= df.format((totkit + totmat)+(totkit + totmat) * 0.12) %> $</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <button id = "btnFormulario" class="btn btn-primary" data-toggle="modal"  data-target="#estadoPedidoModal">Cambiar el estado del Pedido</button>
                <button id = "btnFormulario" class="btn btn-primary" data-toggle="modal" onclick="guardarVenta(<%= "cedula"%>)" data-target="#cuentaBancoModal" align="right">Generar Factura</button>
            </div>
        </div>
    </div>
                                        
        <!------------Modal para Modificar el estado de un pedido -------------------->
        <div class="modal fade" id="estadoPedidoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Cambiar el estado del pedido</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <form role="form" id="FrmAtualizarVntPed">
                        <div class="form-group" align="center">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="estado" id="inlineRadio1" value="pendiente" checked>
                                <label class="form-check-label" for="inlineRadio1">Pendiente</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="estado" id="inlineRadio2" value="pagado">
                                <label class="form-check-label" for="inlineRadio2">Pagado</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="estado" id="inlineRadio3" value="cancelado">
                                <label class="form-check-label" for="inlineRadio2">Cancelado</label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                  <!--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>-->
                  <div class="container">
                      <div class="row justify-content-center">
                        <div class="col-md-6 text-center">
                            <button type="button" class="btn btn-primary" id="btnFormulario"  data-dismiss="modal" onclick="cambiarestado(<%= objVntPrv.getVntpId() %>)">Aceptar</button>
                        </div>
                      </div>
                  </div>
                </div>
              </div>
            </div>
          </div>                          
      </div> 

        <script>
            function cambiarestado(estado){
                actualizarEstado(estado);
                toastr.info('Estado del pedido modificado');
            }
       </script>
      
      
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
       
        <!--toast-->
       <script src="assets/js/toastr.min.js" type="text/javascript"></script>

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
       <script src="assets/js/prueba.js" type="text/javascript"></script>
       
      
    </html>
