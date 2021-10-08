<%-- 
    Document   : login
    Created on : 01/03/2021, 19:55:56
    Author     : Richard
--%>

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
%>

            <div class="main-header" align="center">
                <h2>NUEVOS USUARIOS</h2>
                    <em>Registro de Usuarios</em>
                    <br><br>
            </div>

            <div class="main-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="well well-lg knowledge-recent-popular">
                            <div class="row">
                                <!--<form role="form" id="FormIngPersona" class="needs-validation" novalidate>-->
                                <form role="form" id="FormIngPersona">
                                    <div class="form-row">
                                        <div class="frm-input col-md-2 mb-3">
                                            <label for="perCedula">Cédula</label>
                                            <input type="text" class="form-control" id="perCedula" placeholder="Numero de Cedula" value="" maxlength="10" name="perCedula">
                                        </div>
                                        <div class="frm-input col-md-4 mb-3">
                                            <label for="perNombre">Nombres</label>
                                            <input type="text" class="form-control" id="perNombre" placeholder="Nombres" name="perNombre" value="">
                                        </div>
                                        <div class="frm-input col-md-4 mb-3">
                                            <label for="perApellido">Apellidos</label>
                                            <input type="text" class="form-control " id="perApellido" placeholder="Apellidos" name="perApellido" value="">
                                        </div> 
                                        <div class="frm-input col-md-4 mb-3">
                                            <label for="perDireccion">Dirección</label>
                                            <input type="text" class="form-control" id="perDireccion" placeholder="Direccion Domiciliaria" value="" name="perDireccion" >
                                        </div>
                                        <div class="frm-input col-md-3 mb-3">
                                            <label for="perProvincia">Provincia</label>
                                              <select class="custom-select mr-sm-2" id="perProvincia" name="perProvincia">
                                                    <%
                                                    for (Provincia oPet : arrayProvincia) {
                                                        out.println("<option value='" + oPet.getPrvCodigo() + "'>" + oPet.getPrvNombre() + "</option>");
                                                    }
                                                %>
                                              </select>
                                        </div>

                                        <div class="frm-input col-md-3 mb-3" id="idSelectCity">
                                             <!--TUTORIAL: https://www.youtube.com/watch?v=J3jyQxvmwY0-->
                                        </div>
                                              
                                        <div class="frm-input col-md-2 mb-3">
                                            <label for="perCelular">Movil</label>
                                            <input type="text" class="form-control" id="perCelular" placeholder="Numero de Celular" value="" maxlength="10" name="perCelular">
                                        </div>
                                        <div class="frm-input col-md-2 mb-3">
                                            <label for="perRUC">RUC</label>
                                            <input type="text" class="form-control" id="perRUC" placeholder="RUC" name="perRUC" maxlength="13" value="">
                                        </div>
                                        <div class="frm-input col-md-2 mb-3">
                                            <label for="perRol">Rol</label>
                                            <select class="custom-select mr-sm-2" id="perRol" name="perRol">
                                                <option selected>Seleccionar...</option>
                                                <option value='cliente'>Cliente</option>
                                                <option value='tecnico'>Profesional/Tecnico</option>
                                                <option value='administrador'>Administrador</option>
                                            </select>
                                        </div>
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
                                    <div class="col-sm-12" align='center'>
                                        <button id = "btnFormulario" type='submit' class='btn btn-primary' onclick="ingUsuarios()">Agregar Administrador</button>
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
