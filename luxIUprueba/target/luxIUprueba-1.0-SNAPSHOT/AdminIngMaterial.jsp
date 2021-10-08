<%-- 
    Document   : AdminIngMaterial
    Created on : 24/05/2021, 12:51:22
    Author     : Richard
--%>

<%@page import="servicios.sCatalogomaterial"%>
<%@page import="entidades.Catalogomaterial"%>
<%@page import="entidades.Servicio"%>
<%@page import="entidades.Servicio"%>
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

    String codCatalogo = request.getParameter("codCatalogo");//captura del codigo del catalogo del material

    //Setear OBJ Catalogo
    Catalogo objCatalogo = new Catalogo();
    String cadCatalogo = sCatalogo.listaCatalogoId(Integer.parseInt(codCatalogo));
    JSONObject jsonCatalogo = new JSONObject(cadCatalogo);
    objCatalogo = new Gson().fromJson(jsonCatalogo.toString(), Catalogo.class);
    String idCatalogo = objCatalogo.getCatCodigo();
   
    ArrayList<Provincia> arrayProvincia = new ArrayList<Provincia>();
    
    String cadProvincia = sProvincia.listaTodosProvincia();
    String cadJSONProvincia = "{\"respuesta\":" + cadProvincia + "}";
    JSONObject jsonObjProv = new JSONObject(cadJSONProvincia);
    JSONArray jsonArrayProv = jsonObjProv.getJSONArray("respuesta");
    for(int i=0;i<jsonArrayProv.length();i++)
    {
        JSONObject childJSONObject = jsonArrayProv.optJSONObject(i);
        Provincia objProvincia = new Gson().fromJson(childJSONObject.toString(), Provincia.class);
        arrayProvincia.add(objProvincia);
    }
    
    ArrayList<Catalogomaterial> arrayCatalogomaterial = new ArrayList<Catalogomaterial>();
    
    String cadCatalogomaterial = sCatalogomaterial.listaCatalogomaterialporCatalogo(codCatalogo);
    String cadJSONCatalogomaterial = "{\"respuesta\":" + cadCatalogomaterial + "}";
    JSONObject jsonObjCatMat = new JSONObject(cadJSONCatalogomaterial);
    JSONArray jsonArrayCatMat = jsonObjCatMat.getJSONArray("respuesta");
    for(int i=0;i<jsonArrayCatMat.length();i++)
    {
        JSONObject childJSONObject = jsonArrayCatMat.optJSONObject(i);
        Catalogomaterial objCatalogomaterial = new Gson().fromJson(childJSONObject.toString(), Catalogomaterial.class);
        arrayCatalogomaterial.add(objCatalogomaterial);
    }
    
%>

            <div class="main-header" align="center">
                <h4>REGISTRO DE <%=objCatalogo.getCatNombre()%></h4>
                    <br>
            </div>

            <div class="main-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="well well-lg knowledge-recent-popular">
                            <div class="row">
                                <form role="form" id="FormIngMaterial">
                                    <div class="form-row">
                                        <!--Catalogo-->
                                            <input type="hidden" class="form-control" id="matCatalogo"  name="matCatalogo" value="<%= idCatalogo %>">
                                        <!----->
                                        <div class="frm-input col-md-2 mb-3">
                                            <label for="matCodigo">Codigo</label>
                                            <input type="text" class="form-control form-control-sm" id="matCodigo" placeholder="Codigo.." name="matCodigo"  maxlength="8">
                                        </div>
                                        <div class="frm-input col-md-4 mb-3">
                                            <label for="matNombre">Nombre</label>
                                            <input type="text" class="form-control form-control-sm" id="matNombre" placeholder="Nombre.." name="matNombre" >
                                        </div>
                                        <div class="frm-input col-md-2 mb-3">
                                            <label for="matPrecio">Precio</label>
                                            <input type="number" class="form-control form-control-sm" id="matPrecio" placeholder="0.00$" name="matPrecio" min="0" step="0.01">
                                        </div> 
                                        <div class="frm-input col-md-3 mb-3">
                                            <label for="matMarca">Marca</label>
                                            <input type="text" class="form-control form-control-sm" id="matMarca" placeholder="Marca.." name="matMarca" >
                                        </div>
<!--                                        <div class="frm-input col-md-4 mb-3">
                                            <label for="matCantidad">Cantidad</label>
                                            <input type="number" class="form-control" id="matCantidad" placeholder="Marca" value="" min="1" name="matCantidad" >
                                        </div>-->
                                        <div class="frm-input col-md-5 mb-3">
                                            <label for="matDescripcion">Detalle</label>
                                            <textarea type="text" class="form-control form-control-sm" id="matDescripcion" placeholder="Decripcion....." name="matDescripcion" ></textarea>
                                        </div>
                                        <div class="frm-input col-md-4 mb-3">
                                            <label for="matImagen">Imagen</label>
                                            <input type="text" class="form-control form-control-sm" id="matImagen" placeholder="Imagen" name="matImagen" >
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleFormControlFile1">Imagen</label>
                                            <input type="file" class="form-control-file" id="matImagen" name="matImagen">
                                        </div>
                                        <div class="form-group">
                                            <label for="matTipCat">Tipo de <%=objCatalogo.getCatNombre()%></label>
                                            <select class="custom-select mr-sm-2" id="matTipCat" name="matTipCat">
                                            <%
                                                for (Catalogomaterial oPet : arrayCatalogomaterial) {
                                                    out.println("<option value='" + oPet.getCtmtId() + "'>" + oPet.getCtmtNombre() + "</option>");
                                                }
                                            %>
                                            </select>
                                        </div>
                                        <%if(idCatalogo.equals("CAT1") || idCatalogo.equals("CAT2") || idCatalogo.equals("CAT5") || idCatalogo.equals("CAT6")){%> 
                                        
                                            <div class="frm-input col-md-2 mb-3">
                                                <label for="matVoltaje">Voltaje</label>
                                                <input type="number" class="form-control form-control-sm" id="matVoltaje" placeholder="0" maxlength="3" name="matVoltaje" min="0" step="0.01">
                                            </div>
                                            <div class="frm-input col-md-2 mb-3">
                                                <label for="matCorriente">Corriente</label>
                                                <input type="number" class="form-control form-control-sm" id="matCorriente" placeholder="0" name="matCorriente"  maxlength="4"  min="0" step="0.01">
                                            </div>
                                            <div class="frm-input col-md-2 mb-3">
                                                <label for="matPotencia">Potencia</label>
                                                <input type="number" class="form-control form-control-sm" id="matPotencia" placeholder="0" name="matPotencia"maxlength="4" min="0" step="0.01">
                                            </div>
                                            <div class="frm-input col-md-3 mb-3">
                                                <label for="matTipoconexion">Tipo de Conexion</label>
                                                <input type="text" class="form-control form-control-sm" id="matTipoconexion" placeholder="conexion" name="matTipoconexion" >
                                            </div>
                                            <div class="frm-input col-md-3 mb-3">
                                                <label for="matCompatibilidad">Compatibildad</label>
                                                <input type="text" class="form-control form-control-sm" id="matCompatibilidad" placeholder="Compatibilidad" name="matCompatibilidad">
                                            </div>
                                        <%}%>
                                        </div>
                                    
                                    <br><br>
                                    <div class="col-sm-12" align='center'>
                                        <button id = "btnFormulario" type='submit' class='btn btn-primary' onclick="ingMateriales()">Agregar Articulo Electrónico</button>
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

            <script>
                
//                $('#perProvincia').change(function(){//desabilitar la opcion de ciudadsi no ha seleccionado una provincia
//                    $('#perCiudad').removeAttr('disabled');
//                });
                
                $("#FormIngPersona").validate({
                rules: {
                    perCedula : {required: true, number: true},
                    perNombre: {required: true},
                    perApellido: {required: true},
                    perSexo: {required: true},
                    perFechNac : {required: true},
                    perDireccion: {required: true},
                    perProvincia: {required: true},
                    perCiudad: {required: true},
                    perRUC: {required: true},
                    perRol: {required: true}
                  }
            });

        $("#btnFormulario").click(function()
        {
            if($("#FormIngPersona").valid() === false){
                return; 
            }
            
            let cedula      = $("#perCedula").val();
//            let nombre      = $("#perNombre").val();
//            let apellido    = $("#perApellido").val();
            alert(cedula);
        });

        </script>

        <script>
            $(document).ready(function(){
                recargarSelectCity();
                $('#perProvincia').change(function(){
                    recargarSelectCity();
                });    
            }); 
        </script>
        
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

