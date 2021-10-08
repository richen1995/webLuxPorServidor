<%-- 
    Document   : AdminIngKit
    Created on : 07/06/2021, 17:05:32
    Author     : Richard
--%>

<%@page import="servicios.sServicio"%>
<%@page import="entidades.Servicio"%>
<%@page import="servicios.sMaterial"%>
<%@page import="entidades.Material"%>
<%@page import="servicios.sCatalogo"%>
<%@page import="entidades.Catalogo"%>
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
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
    
    <!--CSS para el validacion del formulario-->
    <link href="assets/css/validacion.css" rel="stylesheet" type="text/css"/>
    
    <!--Validar con Validator jQuery-->
    <script src="assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>
    
    <!--DataTable CSS basico-->
    <!--<link href="assets/datatable/DataTables-1.10.25/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>-->
    <!--DataTable css con Bootstrap 4 -->
    <link rel ="stylesheet" type="text/css" href="assets/datatable/DataTables-1.10.25/css/dataTables.bootstrap4.min.css"/>

<%    
//    String p;
//    
//    String email = request.getParameter("email");
//    String password = request.getParameter("clave");
//    
//    String p1;
//    
//    session.setAttribute("cedula", "");
//    session.setAttribute("rol", "");
//    session.setAttribute("permisoNivel", "");
//    session.setAttribute("codUser", "");
//    session.setAttribute("ingreso", "false");
//    
//    String cedula = "";
//    String rol = "";
//    String permisoNivel = "0";
//     String codUser = "0";
//
//    Persona objPersona= new Persona();
//    String cadPersona= sPersona.listaUsuarioEmailContr(email, password);
//    if(!cadPersona.isEmpty()){
//        JSONObject jsonPersona= new JSONObject(cadPersona);
//        objPersona= new Gson().fromJson(jsonPersona.toString(), Persona.class);
//        if(objPersona.getUsEstado()){
//            cedula = objPersona.getPerCedula().getPerCedula();
//            rol = objPersona.getUsRol();
//            permisoNivel = objPersona.getPmId().getPmId() + "";
//            codUser = objPersona.getUsId() + "";
//
//            //Guardar Variables de session
//                session.setAttribute("cedula", cedula);
//                session.setAttribute("rol", rol);
//                session.setAttribute("permisoNivel", permisoNivel);
//                session.setAttribute("codUser", codUser);
//                session.setAttribute("ingreso", "true");
//                
//            //response.sendRedirect("index.jsp");
//            response.setContentType("text/plain");
//            response.getWriter().write("SI");
//        
//        }else{
//                //response.sendRedirect("plantillaTuto.jsp");
//                response.setContentType("text/plain");
//                response.getWriter().write("NO");
//            }
//    }else{
//        //response.sendRedirect("plantillaTuto.jsp");
//
//        response.setContentType("text/plain");
//        response.getWriter().write("NO");
//    }

    //String codCatalogo = request.getParameter("codCatalogo");//captura del codigo del catalogo del material

   
    ArrayList<Material> arrayMaterial = new ArrayList<Material>();
    ArrayList<Servicio> arrayServicio = new ArrayList<Servicio>();
    
    String cadMaterial = sMaterial.listaTodosMaterial();
    String cadJSONMaterial = "{\"respuesta\":" + cadMaterial + "}";
    JSONObject jsonObjMat = new JSONObject(cadJSONMaterial);
    JSONArray jsonArrayMat = jsonObjMat.getJSONArray("respuesta");
    
    for(int i=0;i<jsonArrayMat.length();i++)
    {
        JSONObject childJSONObject = jsonArrayMat.optJSONObject(i);
        Material objMaterial = new Gson().fromJson(childJSONObject.toString(), Material.class);
        arrayMaterial.add(objMaterial);
    }
    
//    Lista de Servicios
    String cadServicio = sServicio.listaServicioDisponibles();
    String cadJSONServicio = "{\"respuesta\":" + cadServicio + "}";
    JSONObject jsonObjSrv = new JSONObject(cadJSONServicio);
    JSONArray jsonArraySrv = jsonObjSrv.getJSONArray("respuesta");
    
    for(int i=0;i<jsonArraySrv.length();i++)
    {
        JSONObject childJSONObject = jsonArraySrv.optJSONObject(i);
        Servicio objServicio = new Gson().fromJson(childJSONObject.toString(), Servicio.class);
        arrayServicio.add(objServicio);
    }
%>

    <script> 
        $("#success-alert").hide();
    </script>
        <div class="row justify-content-center" id="success-alert">
            <div class="alert alert-danger col-md-6 ">
                    <a href="#" class="close" data-dismiss="alert">&times;</a>
                    <strong>Error!</strong> Defina los elemento para el Kit.
            </div>
        </div>
            <div class="main-header" align="center">
                    <h2>Administración de  Equipos Electrónicos</h2>
                    <em>INGRESO DE KITS ELECTRÓNICOS</em><br><br>
            </div>

            <!--https://www.youtube.com/watch?v=A18cIYXPISo-->
            <!--<div class="main-content">--> 
            <div class="container"> 
                <div class="row">
                    <div class="col-md-7">
                        <div class="card">
                            <div class="card text-white bg-secondary " align="center">EQUIPOS ELECTRÓNICOS</div>
                            <div class="card-body">
                                <div class="well well-lg knowledge-recent-popular">
                                    <div class="row">
                                        <div class="table-responsive">
                                            <table id="tbl" class="table table-sorting table-hover table-bordered datatable" style="width:90%">
                                                <thead style="font-size: 0.8em;">
                                                    <tr>
                                                        <th>No</th>
                                                        <th hidden></th> <!--codigo oculto-->
                                                        <th>Codigo</th>
<!--                                                        <th>Marca</th>
                                                        <th>Catalogo</th>-->
                                                        <th>Artículo</th>
                                                        <th>Precio</th>
                                                        <th>Agregar</th>
                                                     </tr>
                                                </thead>
                                                <tbody style="font-size: 0.8em;">
                                                    <% Integer cont = 0; 
                                                        for (Material oPet : arrayMaterial) {
                                                            cont++;
                                                            out.println("<tr>");
                                                            out.println("<td>" + cont + "</td>");
                                                            out.println("<td hidden>" + oPet.getMatId() + "</td>");
                                                            out.println("<td style='font-size: 0.79em;'>" + oPet.getMatNombre() + "</td>");
//                                                            out.println("<td>" + oPet.getMatMarca()+ "</td>");
//                                                            out.println("<td>" + oPet.getCtmtId().getCtmtNombre() + "</td>");
                                                            
                                                            String cadDetalle = oPet.getCtmtId().getCtmtNombre();
                                                            if(oPet.getMatMarca() != null){
                                                                cadDetalle = cadDetalle + " | " + oPet.getMatMarca();
                                                            }
                                                            if(oPet.getMatResolucion() != null){
                                                                cadDetalle = cadDetalle + " | " + oPet.getMatResolucion();
                                                            }
                                                            
                                                            out.println("<td>" + cadDetalle + "</td>");
                                                            out.println("<td>" + oPet.getMatPrecio() +" $"+ "</td>");
                                                            //out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='AddLocalMaterialparaKit(" + oPet.getMatId() + ");' class='fa fa-edit bg-info' title='Agregar' ></i></td>");


                                                            /*if (oPet.getUsEstado() == true) {
                                                                out.println("<td> <span class='badge badge-pill badge-success'>Habilitado</span> </td>");
                                                            }
                                                            if (oPet.getUsEstado() == false) {
                                                                out.println("<td> <span class='badge badge-pill badge-danger'>Desabilitado</span> </td>");
                                                            }
                                                            out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='MostAdministrador(" + oPet.getUsId() + ");' class='fa fa-edit' title='Editar' ></i></td>");
                                                            out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='ChekPermisos(" + oPet.getUsId()  + ", \"supervisor\");' class='fa fa-check-circle' title='Permisos' ></i></td>");*/

                                                            %>
                                                            <td align="center"> 
                                                                <div class="btn-group btn-group-xs">
                                                                    <button type="button" class="btn btn-warning addBtn" title="Editar"><i class="fa fa-plus" style="font-size: 17px;"></i></button>
                                                                </div>
                                                            </td>
                                                           <% 
                                                            out.println("</tr>");
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
                                        
                    <div class="col-md-5">
                        <div class="card">
                            <div id="divJson">
                                <!--Div dinamico que muestra el json de los materiales-->
                            </div>
                            <div class="card text-white bg-secondary " align="center">FORMAR KIT ELECTRÓNICO</div>
                                <div class="card-body">
                                    <div class="well well-lg knowledge-recent-popular">
                                        <div class="container">
                                            <div class="row justify-content-md-center">                                       
                                                <div id="divElements" class="col-md-10">
<!--                                                    <div class="notificacion row">
                                                        <strong class="mr-auto">Bootstrap</strong>
                                                        <small>11 mins ago</small>
                                                        <button type="button" class="ml-2 mb-1 close" aria-label="Close">
                                                         <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>-->
                                                </div>
                                                <input id="sumaKit" hidden>
                                                <div id="divTotKit" class="col-md-10">
                                                    <!--Div dinamico que muestra la suma total del kit-->
                                                </div>
                                            <form role="form" id="FormIngKit">
                                                <div class="form-row">
                                                    <div class="frm-input col-md-3 mb-1">
                                                        <label for="kitDescuento"><strong>Descuento</strong></label>
                                                        <input type="text" class="form-control" id="kitDescuento" onchange="calcDescuento()" placeholder="0.00" value="" name="kitDescuento" maxlength="4" align='center' required>
                                                    </div>
                                                    <div class="frm-input col-md-9 mb-1" align='right' >
                                                        <br>
                                                        <br>
                                                        <div id="totDescuento"> <h6>0.00 $</h6><!--Div dinamico totDescuento>--></div>
                                                    </div>    
                                                    <div class="frm-input col-md-12 mb-3">
                                                        <label for="kitSistema"><strong>Sistema de Seguridad</strong></label>
                                                          <select class="custom-select mr-sm-2" id="kitSistema" name="kitSistema">
                                                            <%
                                                                for (Servicio oPet : arrayServicio) {
                                                                    out.println("<option value='" + oPet.getSrvId() + "'>" + oPet.getSrvNombre() + "</option>");
                                                                }
                                                            %>
                                                          </select>
                                                    </div>
<!--                                                    <div class="form-group">
                                                        <label for="kitImagen"><strong>Imagen</strong></label>
                                                        <input type="file" class="form-control-file" id="kitImagen" name="kitImagen">
                                                    </div>-->
                                                    <input id="divValDescuento" name="descuento" hidden>
                                                    <div class="frm-input col-md-12 mb-3" align='center'>
                                                        <button type="button" class='btn btn-primary' id="btnKitImagen" align='center'>Agregar Imagen</button>
                                                    </div>

                                                    <img id="divImgKit" style="width:200px;">
    
                                                    
                                                </div>              

                                                <br><br>
                                                <div class="col-sm-12" align='center'>
                                                    <!--<button id="btnSave" type='submit' class='btn btn-primary' onclick="ingMateriales()">Agregar Articulo Electrónico</button>-->
                                                    <button id="btnSave" type='button' class='btn btn-primary'>Agregar Kit Electrónico</button>
                                                </div>
                                            </form>

            <!--                                <form role="form" id="FormIngPersonaPrueba">
                                                <div class="form-row">
                                                    <div class="frm-input col-md-3 mb-3">
                                                        <label for="perEmail">Email</label>
                                                        <input type="text" class="form-control" id="perEmail" placeholder="Email" name="perEmail" value="">
                                                    </div>
                                                    <div class="frm-input col-md-3 mb-3">
                                                        <label for="perPassword">Contraseña</label>
                                                        <input type="password" class="form-control" id="perPassword" placeholder="Password" name="perPassword" value="">
                                                    </div>
                                                </div>

                                                <br><br>
                                            </form>   

                                            <div class="col-sm-12" align='center'>
                                                <button  type='button' class='btn btn-primary' onclick="ingUsuariosPrueba()">prueba</button>
                                            </div>-->
                                        </div>
                                    </div>
                            </div>
                        </div>  
                    </div>
                </div>
            </div>

        
        <script> 
            //var sumamat;
            
            let parameters = [];           
            
            const $divElements = document.getElementById("divElements");
            const $divTotKit   = document.getElementById("divTotKit");
            const $btnSave     = document.getElementById("btnSave");
            const divimagen    = document.querySelector('#divImgKit');
            const $divTotDescuento   = document.getElementById("totDescuento");
            
            const addJsonElement = json =>{
                parameters.push(json);
                return parameters.length - 1;
            };
            
            function removeElement(event,posicion){
                event.target.parentElement.parentElement.remove(); 
                //delete parameters[posicion];
                //parameters.splice(0,posicion);dsdaasd..--
                //alert(posicion);
                parameters = reducirVector(posicion);
                calculoPrecioTotal();       
            }
            
            const templateElement = (data,precio,posicion) => {
                var nomart = data.split("|");
                
                return("" 
                    + "<strong class='mr-auto' style='font-size: 0.7em;'>" + nomart[0] + "</strong>"
                    + "<small>" + precio + " $</small>"
                        + "<button type='button' class='ml-2 mb-1 close' aria-label='Close' onclick='removeElement(event,"+ posicion +")'>"
                    +    "<span aria-hidden='true'>&times;</span>"
                    + "</button>");
            };
                  
            $(document).on('click','.addBtn',function(e){
                var cod = $(this).parent().parent().parent().first().text();                   
                //var segcad = cod.split("\n",7);
                var segcad = cod.split("\n",6);
                var id     = segcad[2];
                var codigo = segcad[3];
                var caract = segcad[4];
                    //var arrayprecio = segcad[6].split(" ");
                    var arrayprecio = segcad[5].split(" ");
                var precio = arrayprecio[0];
                let index = addJsonElement({
                    idmat      : id,
                    codigomat  : codigo,
                    detallemat : caract,
                    preciomat  : precio
                });
                const $div = document.createElement("div");
                 $div.classList.add("notificacion", "row");
                $div.innerHTML = templateElement("" + codigo + " " + caract + "",precio,index);
                $divElements.insertBefore($div, $divElements.firstChild); 
                calculoPrecioTotal();
            });
            
            $btnSave.addEventListener("click",(event) =>{
                parameters = parameters.filter(el => el != null);
                const $jsonDiv = document.getElementById("divJson");
                $jsonDiv.innerHTML = "JSON:  "+JSON.stringify(parameters)+"";
                $divElements.innerHTML = "";
                //parameters = [];
                
                 //redireccion y validacion para pasar a guardar
                if(parameters.length > 1){
                    let urlimagen = divimagen.src;
                    var costo = $("#divTotKit").text().split(" ",2);
                        ingKits($("#divJson").text(),costo[0],urlimagen);
                }else
                    error();
                
                parameters = [];
            });
           
            function calculoPrecioTotal(){
                var suma = 0;
                for(var i=0 ;i < parameters.length;i++){
                    if(parameters[i] != null){
                        console.log("Elemento " + i + ": " + parameters[i].preciomat);
                        suma = parseFloat(suma) + parseFloat(parameters[i].preciomat);
                    }
                }
                document.getElementById("sumaKit").value = suma.toFixed(2); //esta escondido para poder hacer operaciones
                //sumamat = suma.toFixed(2);
                $divTotKit.innerHTML = "<strong class='mr-auto' id='totSuma'>" + suma.toFixed(2) + " $</strong>";
                calcDescuento();
            }
            
            function reducirVector(indice){
                let vec = [];
                for(var i=0 ; i< parameters.length;i++){
                    if(i == indice){
                        vec.push(null);
                    }else
                        vec.push(parameters[i]);
                }
                return vec;
            }
            
            function error(){
                $("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
                    $("#success-alert").slideUp(500); 
                });
            }
            
            function getIdMat(){//recolecion de id de los materiales
                var cadIdMat;   
                var j = 0;
                for(var i=0 ;i < parameters.length;i++){
                    if(parameters[i] != null){
                         j++;
                        if(j == 1)
                            cadIdMat = parameters[i].idmat;
                        else
                            cadIdMat = cadIdMat + "," + parameters[i].idmat;
                    }
                }
                return cadIdMat;
            }
            
            
            //Calculo de Descuento
            function calcDescuento(){
                var descuento = document.getElementById('kitDescuento').value;
                var sum = document.getElementById('sumaKit').value;
//                alert("descuento : " + descuento);
//                alert("sumaKit : " + sum);
                var preciodesc = sum - (descuento * sum) ;
//                alert("preciodesc : " + preciodesc);
                if(descuento.length > 0)
                $divTotDescuento.innerHTML = "<strong>" + preciodesc.toFixed(2) + " $ <small> Precio con descuento</small></strong>";
                document.getElementById("divValDescuento").value = descuento;
            }
            
            
            
//            'use strict';
//                const boton_foto = document.querySelector('#btnKitImagen');
//                const imagen = document.querySelector('#divImgKit');
//                let widget_cloudinary = cloudinary.createUploadWidget({
//                    cloudName: 'imgluxflame',
//                    uploadPreset: 'preset_pabs'
//                }, (err,result)=>{
//                    if(!error && result && result.event === 'success'){ 
//                        console.log('Imagen subidad con exito',result.info);
//                        imagen.src = result.info.secure_url;
//                    }
//                });
//
//                boton_foto.addEventListener('click',() =>{
//                    widget_cloudinary.open();
//                },false );
        </script>
        
       <!--Cloudinary-->
       <script  src = "https://widget.cloudinary.com/v2.0/global/all.js"  type = "text/javascript"></script>
       <script  src=  "assets/js/servicio-imagen.js" type="text/javascript"></script>
        
       <!--JQuery--> 
       <script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
       
       <!-- bootstrap 4 js -->
       <script src="assets/js/popper.min.js"></script>
       <script src="assets/js/bootstrap.min.js"></script>
       <script src="assets/js/owl.carousel.min.js"></script>
       <script src="assets/js/metisMenu.min.js"></script>
       <script src="assets/js/jquery.slimscroll.min.js"></script>
       <script src="assets/js/jquery.slicknav.min.js"></script>

       <!--DATATABLE-->
       <script src="assets/datatable/DataTables-1.10.25/js/jquery.dataTables.min.js" type="text/javascript"></script>
       <script src="assets/datatable/DataTables-1.10.25/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
       <script src="assets/js/traducciondatatable.js" type="text/javascript"></script>
       
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
       <script src="assets/js/prueba.js" type="text/javascript"></script>
       
       
    </html> 