<%-- 
    Document   : BuscarVentaPedido
    Created on : 25/09/2021, 15:52:47
    Author     : Richard
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="entidades.Ventaprevia"%>
<%@page import="servicios.sVentaprevia"%>
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
    
    <!-- Fonts Awesome libreria Importada -->
    <link href="assets/fontawesome/css/all.min.css" rel="stylesheet" type="text/css"/>
    
    <!--DataTable css con Bootstrap 4 -->
    <link rel ="stylesheet" type="text/css" href="assets/datatable/DataTables-1.10.25/css/dataTables.bootstrap4.min.css"/>
    
    <%
        String UsuLinea = session.getAttribute("cedula").toString();
        String rolUsuario = session.getAttribute("rol").toString();
        
        String datos = request.getParameter("datos");
        JSONObject req = new JSONObject(datos);
        //String resultPersona = sPersona.listaPersonaId(req.getString("perCedula"));
        SimpleDateFormat formato1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat formato2 = new SimpleDateFormat("dd-MM-yyyy");
        //DateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
        Date fi = null,ff = null;
        try{
            fi = formato1.parse(req.getString("FechaInicial"));
            ff = formato1.parse(req.getString("FechaFinal"));
        }catch(Exception e){
            System.out.println("FALLOOOO");
        }
        
        ArrayList<Ventaprevia> listVentaprevia = new ArrayList<Ventaprevia>();
        
        if (session.getAttribute("ingreso").toString().equals("true")) {
            String cadJSONvntprv = sVentaprevia.listaBusquedaPorRangoFechas(formato2.format(fi),  formato2.format(ff));
            String resultadoVntprv = "{\"respuesta\":" + cadJSONvntprv + "}";
            JSONObject objVntprv = new JSONObject(resultadoVntprv);
            JSONArray arrayTipoCer = objVntprv.getJSONArray("respuesta");
                for (int i = 0; i < arrayTipoCer.length(); i++) {
                    JSONObject childJSONObject = arrayTipoCer.getJSONObject(i);
                    Ventaprevia objMenus = new Gson().fromJson(childJSONObject.toString(), Ventaprevia.class);
                    listVentaprevia.add(objMenus);
                }
            
        } else {
            response.sendRedirect("index.jsp");
        }
        
    Date f;

    %>
    
    <div class="main-header">
        <h6>    Hay <%= listVentaprevia.size() %> resultados</h6>
    </div>
    <div class="container">
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
                                    out.println("<td> <span class='badge badge-pill badge-warning'>pendiente</span> </td>");
                                }
                                if (oPet.getVntpEstado().equals("cancelado")) {
                                    out.println("<td> <span class='badge badge-pill badge-danger'>cancelado</span> </td>");
                                }
                                if (oPet.getVntpEstado().equals("pagado")) {
                                    out.println("<td> <span class='badge badge-pill badge-success'>pagado</span> </td>");
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

       <script src="assets/js/vendor/jquery-2.2.4.min.js" type="text/javascript"></script>
       
        <!--DATATABLE-->
       <script src="assets/datatable/DataTables-1.10.25/js/jquery.dataTables.min.js" type="text/javascript"></script>
       <script src="assets/datatable/DataTables-1.10.25/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
       <script src="assets/js/traducciondatatable.js" type="text/javascript"></script>

       <script src="assets/js/scripts.js"></script>
       <script src="assets/js/prueba.js" type="text/javascript"></script>
       
</html>
