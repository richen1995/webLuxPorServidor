<%-- 
    Document   : IngUsuario
    Created on : 16/08/2021, 18:19:29
    Author     : Richard
--%>

<%@page import="entidades.CustomGmail"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.util.Base64"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entidades.Ventaprevia"%>
<%@page import="servicios.sVentaprevia"%>
<%@page import="entidades.Usuario"%>
<%@page import="servicios.sUsuario"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="servicios.sProvincia"%>
<%@page import="entidades.Provincia"%>
<%@page import="java.util.List"%>
<%@page import="entidades.Ventamaterial"%>
<%@page import="servicios.sKit"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="servicios.sMaterial"%>
<%@page import="entidades.Kit"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Material"%>
<%@page import="conexionAD.URLconsumo"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <!--<title>Login</title>-->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/font-awesome.min.css">
    
    <!--estilos de iconos -->
    <link rel="stylesheet" href="assets/fontawesome/css/all.min.css" type="text/css"/>

    <%
        //String cedula = session.getAttribute("Cedula").toString();
        //System.out.println("cedula: "+ cedula);
        String cad = "", url="", email ="", cel="";
        cad = request.getParameter("objventaprevia");   
        Ventaprevia objvntaprv = new Ventaprevia();
        if(!cad.isEmpty()){
            JSONObject jsonObject = new JSONObject(cad);
            objvntaprv = new Gson().fromJson(jsonObject.toString(), Ventaprevia.class);
            
            /*Encriptar con Base64*/
            Base64.Encoder encoder = Base64.getEncoder();
            String cadEncriptada = encoder.encodeToString(objvntaprv.getVntpId().toString().getBytes(StandardCharsets.UTF_8));
            System.out.println("Cad Encriptada: " + cadEncriptada);
            
            /*Desencriptar con Base64*/
            Base64.Decoder decoder = Base64.getDecoder();
            byte[] decodedByteArray = decoder.decode(cadEncriptada);
            String cadDesencriptada = new String(decodedByteArray); 
            System.out.println("Cad Desencriptada: " + cadDesencriptada);
            
            url = URLconsumo.PREFIJO + URLconsumo.IP + "/luxIUprueba" +"/ReportePedidoCompra.jsp?cert="+cadEncriptada;
            
            //prueba para enviar correo por gmail 
            ////CustomGmail objCustomGmail = new CustomGmail();
            //objCustomGmail.enviarGmail("iirenelizbeth@gmail.com");
            
            //////objCustomGmail.enviarGmail("deniseinfante2002@gmail.com","Ccotización DluxMultiproyectos de Pedido","Cotización de los Articulos Electrónicos " + url);
        
            /*Buscar email de pa persona q hace el pedido*/
            Usuario objUsuario = new Usuario();
            String cadObjUsuario = sUsuario.FindUsuarioPorCedula(objvntaprv.getPerCedula().getPerCedula()); 
            JSONObject jsonObjectUser = new JSONObject(cadObjUsuario);
            objUsuario = new Gson().fromJson(jsonObjectUser.toString(), Usuario.class);
            email = objUsuario.getUsEmail();
            cel = objvntaprv.getPerCedula().getPerCelular();
        }
        
    %>
    
    <div class="main-header" align="center">
            <em>Registro de Usuario</em>
             <br><br>
    </div>
    
    <div class="container">
        <div class="row">
            <div class="col-md-10" align="center"> 
                <h6>Su orden ha finalizado</h6>
                    <p>GRACIAS POR HACER UN PEDIDO CON NOSOTROS.</p> 
                    <p>HEMOS RECEPTADO CON EXITO TU PEDIDO</p>
                    <p>Recibir Cotizacion del pedido por mi Gmail Personal</p>
                    <br>
                     <button type="button"  class="btn btn-primary"onclick="mensajeURLEmail('<%= url%>', '<%= email%>')">Enviar al Correo</button>
                <br>
                <h6>Recibir Cotización del pedido por mi WhatsApp Personal</h6>
                <br>
                <button type="button" class="btn btn-primary"  onclick="enviarCotCorreoWhats(<%= objvntaprv.getVntpId() %>, 'whatsapp')">Enviar</button>  
                <button type="button" class="btn btn-primary"  onclick="mensajeURLWhatsApp('<%= url%>','<%= cel%>')">Enviar Fernanda</button>  
                <br><br>
                <button  class='btn btn-primary' onclick="verPDF(<%= objvntaprv.getVntpId() %>)"><i class="fa fa-check-circle"></i>Ver PDF</button>
            </div>           
        </div>
    </div>
      
    <script>
        //function verPDF(){
            //alert("objvntaprv.getVntpId() : " +a);
            //alert(b);
        //}
    </script>
            
    <script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
    
    <!--popper-->
    <script src="assets/js/vendor/popper.min.js" type="text/javascript"></script>
    
    <!-- bootstrap 4 js -->
    <script src="assets/js/bootstrap.min.js"></script>

    <script src="assets/js/prueba.js" type="text/javascript"></script>
    

</html>