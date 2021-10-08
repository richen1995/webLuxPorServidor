<%-- 
    Document   : AdminArtElectr
    Created on : 12/05/2021, 12:44:02
    Author     : Richard
--%>

<%@page import="servicios.sKit"%>
<%@page import="entidades.Kit"%>
<%@page import="servicios.sCatalogo"%>
<%@page import="entidades.Catalogo"%>
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
    
    <!--DataTable css con Bootstrap 4 -->
    <link rel ="stylesheet" type="text/css" href="assets/datatable/DataTables-1.10.25/css/dataTables.bootstrap4.min.css"/>
    
  <%
//        String rolOpc = request.getParameter("rolOpc");
    String UsuLinea = session.getAttribute("cedula").toString();
    String rolMaterial = session.getAttribute("rol").toString();

    ArrayList<Material> listMaterials = new ArrayList<Material>();
    ArrayList<Kit> listKits = new ArrayList<Kit>();
    ArrayList<Servicio> listServicios = new ArrayList<Servicio>();
    ArrayList<Catalogo> listCatalogos = new ArrayList<Catalogo>();
    
    
    if (session.getAttribute("ingreso").toString().equals("true")) {
        //Invocando a todos los Materiales existentes
        String cadJSONmaterial = sMaterial.listaTodosMaterial();
        String resultadoMaterial = "{\"respuesta\":" + cadJSONmaterial + "}";
        JSONObject objMaterial = new JSONObject(resultadoMaterial);
        JSONArray arrayTipoCer = objMaterial.getJSONArray("respuesta");
            for (int i = 0; i < arrayTipoCer.length(); i++) {
                JSONObject childJSONObject = arrayTipoCer.getJSONObject(i);
                Material objMenus = new Gson().fromJson(childJSONObject.toString(), Material.class);
                listMaterials.add(objMenus);
            }
           
        //Invocando a todos los Kits existentes
        String cadJSONkit = sKit.listaTodosKit();
        String resultadoKit = "{\"respuesta\":" + cadJSONkit + "}";
        JSONObject objKit = new JSONObject(resultadoKit);
        JSONArray arrayKit = objKit.getJSONArray("respuesta");
            for (int i = 0; i < arrayKit.length(); i++) {
                JSONObject childJSONObject = arrayKit.getJSONObject(i);
                Kit objMenus = new Gson().fromJson(childJSONObject.toString(), Kit.class);
                listKits.add(objMenus);
            }    
            
        //Invocando a los Servicios par llenar el combobox o select  con elementos con estado true
        String cadJSONservicio = sServicio.listaServicioDisponibles();
        String resultadoServicio = "{\"respuesta\":" + cadJSONservicio + "}";
        JSONObject objServicio = new JSONObject(resultadoServicio);
        JSONArray arrayJSONSrv = objServicio.getJSONArray("respuesta");
            for (int i = 0; i < arrayJSONSrv.length(); i++) {
                JSONObject childJSONObject = arrayJSONSrv.getJSONObject(i);
                Servicio objMenus = new Gson().fromJson(childJSONObject.toString(), Servicio.class);
                listServicios.add(objMenus);
            }
        //Invocando a los elementos del Catalogo
        String cadJSONcatalogo = sCatalogo.listaTodosCatalogo();
        String resultadoCatalogo = "{\"respuesta\":" + cadJSONcatalogo + "}";
        JSONObject objCatalogo = new JSONObject(resultadoCatalogo);
        JSONArray arrayJSONCat = objCatalogo.getJSONArray("respuesta");
            for (int i = 0; i < arrayJSONCat.length(); i++) {
                JSONObject childJSONObject = arrayJSONCat.getJSONObject(i);
                Catalogo objMenus = new Gson().fromJson(childJSONObject.toString(), Catalogo.class);
                listCatalogos.add(objMenus);
            }
    } else {
        response.sendRedirect("index.jsp");
    }

    %>
    <div class="main-header" align="center">
            <h2>Administración de los Equipos Electrónicos</h2>
            <em>ARTÍCULOS Y KITS ELECTRÓNICOS</em><br><br>
    </div>
    <div class="main-content ">
        <div class="col-sm-12 d-flex justify-content-between" align='right'>
            <div class="col-sm-6 input-group mb-3">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="inputGroupSelect01">Sistema de Seguidad</label>
                </div>
                <select class="custom-select" id="listaMatKit">
                   <option selected>Escoger...</option>
                    <%
                        for (Servicio oPet : listServicios) {
                            out.println("<option value='" + oPet.getSrvId() + "'>" + oPet.getSrvNombre() + "</option>");
                        }
                    %>
                </select>                
            </div>
            <div class="botones">    
                <button id = "btnFormulario" type='submit' class='btn btn-primary btn-sm' onclick="openFrmKit()">Agregar Kit</button>
                <!--<button id = "btnFormulario" type='submit' class='btn btn-primary btn-sm' onclick="openFrmMaterial()">Agregar Material</button>-->
                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modalIngMaterial">Agregar Material</button> <!--Boton para abrir modal para ingresar un material-->
            </div>
        </div>
        <div id="secDinamicoKitMateriales" class="main-content-inner">        
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="nav-item"><a class="nav-link active" href="#blkAllArticulos" data-toggle="tab">Todos los Aparatos Electrónicos</a></li>
                    <li class="nav-item"><a class="nav-link" href="#blkAllKits" data-toggle="tab">Todos los Kits Electrónicos</a></li>
                </ul>
                <div class="tab-content">
                    <div class="active tab-pane" id="blkAllArticulos">
                        <div class="widget widget-table">
                            <div class="widget-content">
                                <div class="table-responsive">
                                    <!--<table id="tbl" class="table table-sorting table-hover table-bordered datatable">-->
                                    <table id="tbl" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Imagen</th>
                                                <th>Código</th>
                                                <th align="center">Artículo Electrónico</th>                                          
                                                <th>Precio</th>
                                                <th>Stock</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <% Integer cont = 0; 
                                                for (Material oPet : listMaterials) {
    //                                                if((!oPet.getIntrolId().getStrnombre().equals("MI PERFIL")) && (oPet.getIntrolId().getStrnombre().equals("CB ADMINISTRADOR"))&& rolOpc.equals("administrador"))
                                                    //if(Integer.parseInt(oPet.getUsRol()) == 3) 
                                                    //{
                                                        cont++;
                                                        out.println("<tr>");
                                                        out.println("<td>" + cont + "</td>");
                                                        out.println("<td><img style='width: 110px' src = '" + oPet.getMatImagen() + "'></td>");
                                                        out.println("<td style='font-size: 0.8em;'>" + oPet.getMatNombre() + "</td>");
                                                            String cadDetalle = oPet.getCtmtId().getCtmtNombre();
                                                            if(oPet.getMatMarca() != null){
                                                                cadDetalle = cadDetalle + " | " + oPet.getMatMarca();
                                                            }
                                                            if(oPet.getMatResolucion() != null){
                                                                cadDetalle = cadDetalle + " | " + oPet.getMatResolucion();
                                                            }
                                                            if(oPet.getMatVoltaje() != null){
                                                                cadDetalle = cadDetalle + " | " + oPet.getMatVoltaje() + " V";
                                                            }
                                                            if(oPet.getMatCorriente() != null){
                                                                cadDetalle = cadDetalle + " | " + oPet.getMatCorriente() + " A";
                                                            }
                                                            if(oPet.getMatPotencia() != null){
                                                                cadDetalle = cadDetalle + " | " + oPet.getMatPotencia() + " W";
                                                            }
                                                            if(oPet.getMatTipoconexion() != null){
                                                                cadDetalle = cadDetalle + " | " + oPet.getMatTipoconexion();
                                                            }
                                                            if(oPet.getMatCapacidad() != null){
                                                                cadDetalle = cadDetalle + " | " + oPet.getMatCapacidad();
                                                            }
                                                            if(oPet.getMatSalidas() != null){
                                                                cadDetalle = cadDetalle + " | " + oPet.getMatSalidas();
                                                            }
                                                            if(oPet.getMatCompresion() != null){
                                                                cadDetalle = cadDetalle + " | " + oPet.getMatCompresion();
                                                            }
                                                            if(oPet.getMatTasa() != null){
                                                                cadDetalle = cadDetalle + " | " + oPet.getMatTasa();
                                                            }
                                                            if(oPet.getMatDimencion() != null){
                                                                cadDetalle = cadDetalle + " | " + oPet.getMatDimencion();
                                                            }
                                                        out.println("<td>" + cadDetalle + "</td>");
                                                        out.println("<td>" + oPet.getMatPrecio() + "</td>");
                                                        out.println("<td>" + oPet.getMatStock()  + "</td>");
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
                    
                    <div class="tab-pane" id="blkAllKits">
                        <div class="widget widget-table">
                            <div class="widget-content">
                                <div class="table-responsive">
                                    <table id="tbl2" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Imagen</th>
                                                <th>Código</th>
                                                <th>Artículos del Kit</th>                                       
                                                <th>Precio</th>
                                                <th>Descuento</th>
                                                <th>Precio con descuento</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <% cont = 0; 
                                                 float preciodescuento = 0;
                                                for (Kit oPet : listKits) {
    //                                                if((!oPet.getIntrolId().getStrnombre().equals("MI PERFIL")) && (oPet.getIntrolId().getStrnombre().equals("CB ADMINISTRADOR"))&& rolOpc.equals("administrador"))
                                                    //if(Integer.parseInt(oPet.getUsRol()) == 3) 
                                                    //{
                                                        cont++;
                                                        out.println("<tr>");
                                                        out.println("<td>" + cont + "</td>");
                                                        out.println("<td><img style='width: 110px' src = '" + oPet.getKitImagen()+ "'></td>");
                                                        out.println("<td style='font-size: 0.8em;'>" + oPet.getKitId()+ "</td>");
//                                                            String cadDetalle = oPet.getCtmtId().getCtmtNombre();
//                                                            if(oPet.getMatMarca() != null){
//                                                                cadDetalle = cadDetalle + " | " + oPet.getMatMarca();
//                                                            }
                                                        out.println("<td>" + oPet.getKitMateriales() + "</td>");
                                                        out.println("<td>" + oPet.getKitPrecio() + "</td>");
                                                        out.println("<td>" + oPet.getKitDescuento()  + "</td>");
                                                        try{
                                                            preciodescuento = oPet.getKitPrecio().floatValue() - (oPet.getKitDescuento().floatValue() * oPet.getKitPrecio().floatValue());
                                                        }catch(Exception e){
                                                            preciodescuento = 0;
                                                        }
                                                        out.println("<td>" + preciodescuento + "</td>");
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
                                        

                                        
                    <!--Modal de Baja de un Bien-->    
                    <div class="modal fade" id="modalIngMaterial" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                          <div class="modal-header p-3 mb-2 bg-primary text-white text-center">
                            <h5 class="modal-title" id="exampleModalLabel">INGRESO DE EQUIPOS ELECTRÓNICOS</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                                </button>
                          </div>
                          <!--<div class="row col-sm-6 align-self-center">-->
                          <div class="col-sm-12 input-group mb-3 align-self-center">
                            <div class="input-group-prepend">
                                <label class="input-group-text" for="inputGroupSelect01">Tipo de Equipo</label>
                            </div>
                               <div class="caja col-sm-6">
                                  <select class="custom-select" id="listaCatalogoMat">
                                   <option selected>Escoger...</option>
                                    <%
                                        for (Catalogo oPet : listCatalogos) {
                                            out.println("<option value='" + oPet.getCatId() + "'>" + oPet.getCatNombre() + "</option>");
                                        }
                                    %>
                                  </select>   
                              </div>
                          </div>
                            <form id ="FrmIngMaterial">     
                                <div class="modal-body" id="contenido">                                              

<!--                                     <label for="codigoBienId"></label>
                                     <input value="" required="true" type="hidden" class="form-control" id="codigoBienId" name="codigoBienId">-->
                                </div>
                            </form> 
                            <div class="row justify-content-center">
                              <div class="col-sm-11">
                                <div id="secIngMaterialDinamico">
                                  <!--SECCION DE DINAMICA PARA CARGAR FOEMULARIO DE INGRESO DEL MATERIAL-->   
                                </div>                               
                              </div>
                            </div>
                            
<!--                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                              <button type="button" id="btnElegPer" class="btn btn-primary" data-dismiss="modal" onclick="editarMotivoBaja()">Aceptar</button>
                            </div>-->
                        </div>
                      </div>                           
                    </div>
                                        
            </div>
        </div>
    </div>
         
    <script>
        //--------------Cod. para capturar seleccion del combo Box---------
            $(document).ready(function(){            
                $("select#listaMatKit").change(function(){
                   var opc = $(this).children("option:selected").val();
                   //alert("Sistema de Seguridad: " + opc);
                   openSistSeg(opc);
                });
                
                $("select#listaCatalogoMat").change(function(){
                   var opc1 = $(this).children("option:selected").val();
                   //alert("Catalogo: " + opc1);
                   openFrmMaterial(opc1);                   
                });
            });
        //----------------------------------------------------------------- 
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

       <!--DATATABLE-->
       <script src="assets/datatable/DataTables-1.10.25/js/jquery.dataTables.min.js" type="text/javascript"></script>
       <script src="assets/datatable/DataTables-1.10.25/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
       <script src="assets/js/traducciondatatable.js" type="text/javascript"></script>
       
       <!-- start chart js -->
       <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
       <!-- start highcharts js -->
       <script hcharts.com/highcharts.js"></script>
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
