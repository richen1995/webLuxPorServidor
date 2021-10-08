<%-- 
    Document   : login
    Created on : 01/03/2021, 19:55:56
    Author     : Richard
--%>

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
<%
    System.out.println("++++++ESTOY EN LOGIN.jsp+++++");
    //String datos = request.getParameter("datos");
    //JSONObject req = new JSONObject(datos);
    
//    String datos = request.getParameter("datos");
//    JSONObject req = new JSONObject(datos);
//    String em = req.getString("emaill");
//    String pass = req.getString("passwordl");
    
    String p;
    
    String email = request.getParameter("email");
    String password = request.getParameter("clave");
    
    String p1;
    
    session.setAttribute("cedula", "");
    session.setAttribute("rol", "");
    session.setAttribute("permisoNivel", "");
    session.setAttribute("codUser", "");
    session.setAttribute("ingreso", "false");
    
    String cedula = "";
    String rol = "";
    String permisoNivel = "0";
     String codUser = "0";

    Usuario objUsuario = new Usuario();
        String cadUsuario = sUsuario.listaUsuarioEmailContr(email, password);
    if(!cadUsuario.isEmpty()){
        JSONObject jsonUsuario = new JSONObject(cadUsuario);
        objUsuario = new Gson().fromJson(jsonUsuario.toString(), Usuario.class);
        if(objUsuario.getUsEstado()){
            if(objUsuario.getPerCedula() != null){
                cedula = objUsuario.getPerCedula().getPerCedula();
            }
            rol = objUsuario.getUsRol();
            permisoNivel = objUsuario.getPmId().getPmId() + "";
            codUser = objUsuario.getUsId() + "";

            //Guardar Variables de session
                session.setAttribute("cedula", cedula);
                //session.setAttribute("rol", rol);
                session.setAttribute("permisoNivel", permisoNivel);
                session.setAttribute("codUser", codUser);
                session.setAttribute("ingreso", "true");
                
                response.setContentType("text/plain");
            if(rol.equals("1")){  
                System.out.println("admin");
                session.setAttribute("rol", "administrador");
                response.getWriter().write("SI");
                //response.getWriter().write("administrador");
            }  
            
            if(rol.equals("2")){ 
                System.out.println("prof");
                session.setAttribute("rol", "profesional");
                response.getWriter().write("profesional");
            }  
            
            if(rol.equals("3")){  
                System.out.println("cli");
                session.setAttribute("rol", "cliente");
                response.getWriter().write("cliente");
            }  
            //response.sendRedirect("index.jsp");
//            response.setContentType("text/plain");
//            response.getWriter().write("SI");
        
        }else{
                //response.sendRedirect("plantillaTuto.jsp");
                response.setContentType("text/plain");
                response.getWriter().write("NO");
            }
    }else{
        //response.sendRedirect("plantillaTuto.jsp");

        response.setContentType("text/plain");
        response.getWriter().write("NO");
    }
%>

    
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