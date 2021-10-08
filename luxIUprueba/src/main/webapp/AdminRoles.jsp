<%-- 
    Document   : AdminRoles
    Created on : 10/03/2021, 20:47:00
    Author     : Richard
--%>

<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
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
<!--    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico">
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/themify-icons.css">
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/metisMenu.css">
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/slicknav.min.css">-->
    <!-- amchart css -->
<!--    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
     others css 
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/typography.css">
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/default-css.css">
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/styles.css">
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/responsive.css">-->
    <!-- modernizr css -->
    <!--<script src="<%out.print(getServletContext().getContextPath());%>/assets/js/vendor/modernizr-2.8.3.min.js"></script>-->
    
    <!-- Fonts Awesome libreria Importada -->
    <link href="assets/fontawesome/css/all.min.css" rel="stylesheet" type="text/css"/>
    
    <!--CSS para el validacion del formulario-->
    <!--<link href="assets/css/validacion.css" rel="stylesheet" type="text/css"/>-->
    
    <!--Validar con Validator jQuery-->
    <!--<script src="assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>-->
    
    <!--DataTable css con Bootstrap 4 -->
    <link rel ="stylesheet" type="text/css" href="assets/datatable/DataTables-1.10.25/css/dataTables.bootstrap4.min.css"/>
    
    <%
//        String rolOpc = request.getParameter("rolOpc");
        String UsuLinea = session.getAttribute("cedula").toString();
        String rolUsuario = session.getAttribute("rol").toString();
        
        ArrayList<Usuario> listUsuarios = new ArrayList<Usuario>();
        ArrayList<Usuario> listUsuariosAnonimos = new ArrayList<Usuario>();
        
        if (session.getAttribute("ingreso").toString().equals("true")) {

            String cadJSONusuario = sUsuario.listaTodosUsuario();
             String resultadoUsuario = "{\"respuesta\":" + cadJSONusuario + "}";
            JSONObject objUsuario = new JSONObject(resultadoUsuario);
            JSONArray arrayTipoCer = objUsuario.getJSONArray("respuesta");
                for (int i = 0; i < arrayTipoCer.length(); i++) {
                JSONObject childJSONObject = arrayTipoCer.getJSONObject(i);
                Usuario objMenus = new Gson().fromJson(childJSONObject.toString(), Usuario.class);
                if(objMenus.getPerCedula() != null){
                    listUsuarios.add(objMenus);
                }else{
                    listUsuariosAnonimos.add(objMenus);
                }
                //int opc = childJSONObject.;
            }
            
        } else {
            response.sendRedirect("index.jsp");
        }

    %>
    
    <div class="main-header">
            <h2>Administracion de los Usuarios del Sistema</h2>
            <em>USUARIOS</em>
    </div>
    <div class="container">
        <div class="col-sm-12" align='right'>
            <button id = "btnFormulario" type='submit' class='btn btn-primary' onclick="OpenFrmUsuario()">Agregar Usuario</button>
        </div>
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link active" href="#blkUserRegistrados" data-toggle="tab">Usuarios Registrados</a></li>
                <li class="nav-item"><a class="nav-link" href="#blkUserAnonimos" data-toggle="tab">Usuarios Anónimos</a></li>
                <!--<li class="nav-item"><a class="nav-link" href="#blkAddUsuario" data-toggle="tab">Agregar nuevo</a></li>-->
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="blkUserRegistrados">
                    <div class="widget widget-table">
                        <div class="widget-header">
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="nav-item"><a class="nav-link active" href="#blkListClientes" data-toggle="tab">Clientes</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#blkListTecnicos" data-toggle="tab">Tecnicos</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#blkListAdministradores" data-toggle="tab">Administradores</a></li>
                                    <!--<li class="nav-item"><a class="nav-link" href="#blkAddUsuario" data-toggle="tab">Agregar nuevo</a></li>-->
                                </ul>
                                <div class="tab-content">
                                    <div class="active tab-pane" id="blkListClientes">
                                        <table id="tbl" class="table table-striped table-bordered" style="width: 100%">
                                          <thead>
                                              <tr>
                                                  <th>No.</th>
                                                  <th>Cédula</th>
                                                  <th>Nombre</th>
                                                  <th>Estado</th>
                                                  <th>Editar</th>                                            
                                                  <th>Permisos</th>
                                              </tr>
                                          </thead>
                                          <tbody>

                                              <% Integer cont = 0; 
                                                  for (Usuario oPet : listUsuarios) {
      //                                                if((!oPet.getIntrolId().getStrnombre().equals("MI PERFIL")) && (oPet.getIntrolId().getStrnombre().equals("CB ADMINISTRADOR"))&& rolOpc.equals("administrador"))
                                                      if(Integer.parseInt(oPet.getUsRol()) == 3) 
                                                      {
                                                          cont++;
                                                          out.println("<tr>");
                                                          out.println("<td>" + cont + "</td>");
                                                          out.println("<td>" + oPet.getPerCedula().getPerCedula()+ "</td>");
                                                          out.println("<td>" + oPet.getPerCedula().getPerNombre() + " " + oPet.getPerCedula().getPerApellido() +"</td>");
                                                          if (oPet.getUsEstado() == true) {
                                                              out.println("<td> <span class='badge badge-pill badge-success'>Habilitado</span> </td>");
                                                          }
                                                          if (oPet.getUsEstado() == false) {
                                                              out.println("<td> <span class='badge badge-pill badge-danger'>Desabilitado</span> </td>");
                                                          }
                                                          out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='MostAdministrador(" + oPet.getUsId() + ");' class='fa fa-edit' title='Editar' ></i></td>");
                                                          out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='ChekPermisos(" + oPet.getUsId()  + ", \"supervisor\");' class='fa fa-check-circle' title='Permisos' ></i></td>");
                                                          out.println("</tr>");
                                                      }
                                                  }                                            
                                              %>
                                              <!--</tr>-->
                                          </tbody>
                                      </table>
                                    </div>
                                    <div class="tab-pane" id="blkListTecnicos">
                                        <table id="tbl2" class="table table-striped table-bordered" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Cédula</th>
                                                    <th>Nombre</th>
                                                    <th>Estado</th>
                                                    <th>Editar</th>
                                                    <th>Permisos</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <%cont = 0;
                                                    for (Usuario oPet : listUsuarios) {
        //                                                if((!oPet.getIntrolId().getStrnombre().equals("MI PERFIL")) && (oPet.getIntrolId().getStrnombre().equals("CB OPERARIO"))&& rolOpc.equals("operario"))
                                                        if(Integer.parseInt(oPet.getUsRol()) == 2)                                                
                                                        {
                                                            cont++;
            //                                                out.println("<tr id=" + oPet.getIntid() + ">");
                                                            out.println("<tr>");
                                                            out.println("<td>" + cont + "</td>");
                                                            out.println("<td>" + oPet.getPerCedula().getPerCedula()+ "</td>");
                                                            out.println("<td>" + oPet.getPerCedula().getPerNombre() + " " + oPet.getPerCedula().getPerApellido() +"</td>");
                                                            if (oPet.getUsEstado() == true) {
                                                                out.println("<td> <span class='badge badge-pill badge-success'>Habilitado</span> </td>");
                                                            }
                                                            if (oPet.getUsEstado() == false) {
                                                                out.println("<td> <span class='badge badge-pill badge-danger'>Desabilitado</span> </td>");
                                                            }
                                                            out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='MostAdministrador(" + oPet.getUsId() + ");' class='fa fa-edit' title='Editar' ></i></td>");
                                                            out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='ChekPermisos(" + oPet.getUsId()  + ", \"supervisor\");' class='fa fa-check-circle' title='Permisos' ></i></td>");
                                                            out.println("</tr>");
                                                        }
                                                    }%>
                                                <!--</tr>-->
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="tab-pane" id="blkListAdministradores">
                                        <table id="tbl3" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Cédula</th>
                                                    <th>Nombre</th>
                                                    <th>Estado</th>
                                                    <th>Editar</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <% cont = 0;
                                                    for (Usuario oPet : listUsuarios) {
        //                                                if((!oPet.getIntrolId().getStrnombre().equals("MI PERFIL")) && (oPet.getIntrolId().getStrnombre().equals("CB SUPERVISOR"))&& rolOpc.equals("supervisor"))
                                                        if(Integer.parseInt(oPet.getUsRol()) == 1)
                                                        {
                                                            cont++;
            //                                                out.println("<tr id=" + oPet.getIntid() + ">");
                                                            out.println("<tr>");
                                                            out.println("<td>" + cont + "</td>");
                                                            out.println("<td>" + oPet.getPerCedula().getPerCedula()+ "</td>");
                                                            out.println("<td>" + oPet.getPerCedula().getPerNombre() + " " + oPet.getPerCedula().getPerApellido() +"</td>");
                                                            if (oPet.getUsEstado() == true) {
                                                                out.println("<td> <span class='badge badge-pill badge-success'>Habilitado</span> </td>");
                                                            }
                                                            if (oPet.getUsEstado() == false) {
                                                                out.println("<td> <span class='badge badge-pill badge-danger'>Desabilitado</span> </td>");
                                                            }
                                                            out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='MostAdministrador(" + oPet.getUsId() + ");' class='fa fa-edit' title='Editar' ></i></td>");
                                                            //out.println("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='cursor: pointer' onclick='ChekPermisos(" + oPet.getUsuId().getUsuId()  + ", \"supervisor\");' class='fa fa-check-circle' title='Permisos' ></i></td>");
                                                            out.println("</tr>");
                                                        }
                                                    }
                                                %>
                                                <!--</tr>-->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="blkUserAnonimos">
                    <div class="widget widget-table">
                        <div class="widget-header">
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="nav-item"><a class="nav-link active" href="#blkListClientesAnonimos" data-toggle="tab">Clientes con Cuentas Anónimas</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="active tab-pane" id="blkListClientesAnonimos">
                                        <table id="tbl4" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Email</th>
                                                    <th>Fecha de Creación de la Cuenta</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <% cont = 0; 
                                                    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                                                    SimpleDateFormat formato2 = new SimpleDateFormat("dd-MM-yyyy");
                                                    Date date = null;
                                                    for (Usuario oPet : listUsuariosAnonimos) {
        //                                                if((!oPet.getIntrolId().getStrnombre().equals("MI PERFIL")) && (oPet.getIntrolId().getStrnombre().equals("CB ADMINISTRADOR"))&& rolOpc.equals("administrador"))
                                                        if(Integer.parseInt(oPet.getUsRol()) == 3) 
                                                        {
                                                            cont++;
                                                            out.println("<tr>");
                                                            out.println("<td>" + cont + "</td>");
                                                            out.println("<td>" + oPet.getUsEmail()+ "</td>");
                                                            String[] fecha = oPet.getUsFechainicial().split("T");
                                                            try{
                                                                date = formato.parse(fecha[0]);
                                                            }catch(ParseException ex){
                                                                ex.printStackTrace();
                                                            }
                                                            out.println("<td>" + formato2.format(date) +"</td>");
                                                            out.println("</tr>");
                                                        }
                                                    }                                            
                                                %>
                                                <!--</tr>-->
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
    </div>

    <!--<script>-->

    <!--</script>--> 
                 
        <!--JS mensajes para el validacion del formulario-->
       <!--<script src="assets/js/traducciones.js" type="text/javascript"></script>-->
       
       
       

       <script src="assets/js/vendor/jquery-2.2.4.min.js" type="text/javascript"></script>
       <!-- bootstrap 4 js -->
<!--       <script src="assets/js/popper.min.js"></script>
       <script src="assets/js/vendor/popper.min.js" type="text/javascript"></script>
       <script src="assets/js/bootstrap.min.js"></script>
       <script src="assets/js/owl.carousel.min.js"></script>
       <script src="assets/js/metisMenu.min.js"></script>
       <script src="assets/js/jquery.slimscroll.min.js"></script>
       <script src="assets/js/jquery.slicknav.min.js"></script>-->
       
        <!--DATATABLE-->
       <script src="assets/datatable/DataTables-1.10.25/js/jquery.dataTables.min.js" type="text/javascript"></script>
       <script src="assets/datatable/DataTables-1.10.25/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
       <script src="assets/js/traducciondatatable.js" type="text/javascript"></script>

<!--        start chart js 
       <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
        start highcharts js 
       <script src="https://code.highcharts.com/highcharts.js"></script>
        start zingchart js 
       <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
       <script>
           zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
           ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
       </script>
        all line chart activation 
       <script src="assets/js/line-chart.js"></script>
        all pie chart 
       <script src="assets/js/pie-chart.js"></script>-->
       <!-- others plugins -->
       <!--<script src="assets/js/plugins.js"></script>-->
       <script src="assets/js/scripts.js"></script>
       <script src="assets/js/prueba.js" type="text/javascript"></script>
       
       <!--JS para el validacion del formulario-->
        <!--<script src="assets/js/validacion.js" type="text/javascript"></script>-->
       <!--JS mensajes para el validacion del formulario-->
       <!--<script src="assets/js/traducciones.js" type="text/javascript"></script>-->
</html>
