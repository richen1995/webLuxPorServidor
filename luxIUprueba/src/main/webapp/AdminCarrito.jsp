<%-- 
    Document   : AdminCarrito
    Created on : 04/08/2021, 16:37:25
    Author     : Richard
--%>

<%@page import="java.text.DecimalFormat"%>
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
<!DOCTYPE html>
<html>
<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <!--<title>Login</title>-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--<link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico">-->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/font-awesome.min.css">
<!--    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/themify-icons.css">
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/metisMenu.css">
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/slicknav.min.css">-->
    <!-- amchart css -->
    <!--<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />-->
    <!-- others css -->
<!--    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/typography.css">
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/default-css.css">
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/styles.css">
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/responsive.css">-->
    <!-- modernizr css -->
    <!--<script src="<%out.print(getServletContext().getContextPath());%>/assets/js/vendor/modernizr-2.8.3.min.js"></script>-->
    
    <!--estilos de iconos -->
    <link rel="stylesheet" href="assets/fontawesome/css/all.min.css" type="text/css"/>

    <%
            String cedula    = session.getAttribute("Cedula").toString();
        String tipouser  = session.getAttribute("TipoUser").toString();
        String ingreso   = session.getAttribute("ingreso").toString();
        
        
        System.out.println("CARRITO");
        String cadMatCarrito = session.getAttribute("carritoMat").toString();
        String cadCantMatCarrito = session.getAttribute("carritoCantMat").toString();
        String cadKitCarrito = session.getAttribute("carritoKit").toString();
        String cadCantKitCarrito = session.getAttribute("carritoCantKit").toString();
        
        float totmat = 0, totkit = 0;
        DecimalFormat df = new DecimalFormat("#.##");
        
        ArrayList<Material> listMaterial = new ArrayList<Material>();
        List<String> listCantMat = new ArrayList<String>();
        
        ArrayList<Kit> listKit = new ArrayList<Kit>();
        List<String> listCantKit = new ArrayList<String>();
        
        /*Administrar carrito del material*/
        if(!cadMatCarrito.isEmpty()){
            String[]  codMat = cadMatCarrito.split("_");
            String[]  cantMat = cadCantMatCarrito.split("_");
            
            Material objMaterial = new Material();
            int i = 0;
            String codigo = "";
            do{
                String cadMat = sMaterial.listaMaterialId(codMat[i]);
                JSONObject matJSON = new JSONObject(cadMat);
                objMaterial = new Gson().fromJson(matJSON.toString(),Material.class);
                listMaterial.add(objMaterial);
                listCantMat.add(cantMat[i]);
                try{
                    i++;
                    codigo = codMat[i];
                }catch(Exception e){
                    codigo = null;
                }
                
            //}while(!codMat[i].isEmpty());
            }while(codigo != null);
        }
        
        /*Administrar carrito del kit*/
            if(!cadKitCarrito.isEmpty()){
            String[]  codKit = cadKitCarrito.split("_");
            String[]  cantKit = cadCantKitCarrito.split("_");
            
            Kit objKit = new Kit();
            int i = 0;
            String codigo = "";
            do{
                String cadKit = sKit.listaKitId(codKit[i]);
                JSONObject kitJSON = new JSONObject(cadKit);
                objKit = new Gson().fromJson(kitJSON.toString(),Kit.class);
                listKit.add(objKit);
                listCantKit.add(cantKit[i]);
                try{
                    i++;
                    codigo = codKit[i];
                }catch(Exception e){
                    codigo = null;
                }
                
            //}while(!codMat[i].isEmpty());
            }while(codigo != null);
        }
              
      //session.setAttribute("carrito", "");  //variable para almacenar json del Carrito
    if(listMaterial.size() == 0 && listKit.size() == 0){  
    %>
        <br><br><br><br><br><br>
        <div class="container" style="width:100%">
            <div class="row justify-content-center">
                <h5>Carrito de Compras Vacio</h5>
            </div>
        </div>
    <%
    }else{
    %>
     <br><br>
        <div class="container" style="width:100%">
            <div class="row">
                <div class="table-responsive align-self-center">
                    <table id="tbl" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Imagen</th>
                                <th>Nombre del Arcticulo</th>
                                <th>Precio Unidad</th>
                                <th>Cantidad</th>
                                <th>Subtotal</th>
                                <th>Accion</th>
                             </tr>
                        </thead>
                        <tbody>
                            <% Integer cont = 0; 
                                for (Material oPet:listMaterial) {
                                    cont++;
                                    out.println("<tr id='fila" + cont + "'>");
                                    out.println("<td>" + cont + "</td>");
                                    out.println("<td " + oPet.getMatImagen() + "</td>");
                                    out.println("<td>" + oPet.getCtmtId().getCtmtNombre() + "</td>");
                                    out.println("<td>" + oPet.getMatPrecio() +" $"+ "</td>");
                                    out.println("<td>" + Integer.parseInt(listCantMat.get(cont-1)) + "</td>");
                                    float precio = Integer.parseInt(listCantMat.get(cont-1)) * oPet.getMatPrecio().floatValue();
                                    totmat = totmat + precio;
                                    out.println("<td>" + df.format(precio) +" $"+ "</td>");
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
                                            <button type="button" class="btn btn-warning addBtn" title="Editar" onclick="removeElementMatKit(<%= cont%>, 'material')"><i class="fas fa-times" style="font-size: 17px;"></i></button>
                                        </div>
                                    </td>
                                   <% 
                                    out.println("</tr>");
                                }
                                cont = 0; 
                                        for (Kit oKit:listKit) {
                                    cont++;
                                    out.println("<tr id='filaa" + cont + "'>");
                                    out.println("<td>" + cont + "</td>");
                                    out.println("<td " + oKit.getKitImagen() + "</td>");
                                    out.println("<td>" + oKit.getKitMateriales() + "</td>");
                                    out.println("<td>" + oKit.getKitPrecio() +" $"+ "</td>");
                                    out.println("<td>" + Integer.parseInt(listCantKit.get(cont-1)) + "</td>");
                                    float precio = Integer.parseInt(listCantKit.get(cont-1)) * oKit.getKitPrecio().floatValue();
                                    totkit = totkit + precio;
                                    out.println("<td>" + df.format(precio) +" $"+ "</td>");
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
                                            <button type="button" class="btn btn-warning addBtn" title="Editar" onclick="removeElementMatKit(<%= cont%>,'kit')"><i class="fas fa-times" style="font-size: 17px;"></i></button>
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

            <div class="row">
                <div class="col-sm-6">

                </div>
                <div class="col-sm-6">
                    <div class="table-responsive align-self-center">
                        <table id="tbl" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Total del Carrito de Compras</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Subtotal Carrito</td>   
                                    <td><%= df.format(totmat + totkit) %> $</td>   
                                </tr>
                                <tr>
                                    <td>IVA</td>
                                    <td><%= df.format((totmat + totkit) * 0.12) %> $</td>
                                </tr>
                                <tr>
                                    <td>TOTAL</td>
                                    <td><%= df.format((totmat + totkit) * 0.12 + (totmat + totkit)) %>  $</td>
                                </tr>
                                <tr>
                                    <%if(ingreso.equals("true")){%>
                                        <td colspan="2"><button type="button" class="btn btn-primary btn-block" title="Registrar" onclick="registro('registrado')">Realizar Compra</button></td>                             
                                    <%}else{%>
                                        <!--<a class="nav-link" type="button" id="idLogin" class="btn btn-info btn-round" data-toggle="modal" data-target="#loginModal" ty>Login</a>-->
                                        <!--<td><button type="button" class="btn btn-warning addBtn" title="Registrar" onclick="registro('registrado')"><i class="fas fa-times" style="font-size: 17px;"></i></button></td>-->
                                        <td colspan="2"><button type="button" class="btn btn-primary btn-block" title="Registrar" onclick="registro('sinregistrar')">Realizar Compra</button></td>
                                    <%}%>
                                </tr>                            
                            </tbody>
                        </table>        
                    </div>
                </div>
            </div>
        </div>
    <%
    }%>
     
                           
       <script>
            function removeElementMatKit(cont, tipo){//fn para remover la fila de una tabla 
//                alert(cont);
//                alert(tipo);
               if(tipo === 'material'){
                    $("#fila" + cont).remove();  
               }
               if(tipo === 'kit'){
                    $("#filaa" + cont).remove();  
               }
               editSessionCarrito(cont, tipo);
            } 
            
            function registro(estado){
                if(estado === 'registrado'){
                    abrirFormularioUser();
                }else{
                    $("#loginModal").modal();
                    //abrirOrdenCompra();
                }
            }
       </script>
    
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/vendor/jquery-2.2.4.min.js"></script>
       <!-- bootstrap 4 js -->
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/bootstrap.min.js"></script>
<!--       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/owl.carousel.min.js"></script>
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/metisMenu.min.js"></script>
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.slimscroll.min.js"></script>
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.slicknav.min.js"></script>-->

       <!-- start chart js -->      
<!--       <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
        start highcharts js 
       <script src="https://code.highcharts.com/highcharts.js"></script>
        start zingchart js 
       <script src="https://cdn.zingchart.com/zingchart.min.js"></script>-->
<!--       <script>
           zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
            ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
        </script>
         all line chart activation 
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/line-chart.js"></script>
         all pie chart 
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/pie-chart.js"></script>
         others plugins 
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/plugins.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/scripts.js"></script>-->
        <script src="assets/js/prueba.js" type="text/javascript"></script>

        <!--js para slider : https://youtu.be/Qc-LFzxoU6Q para slider de materiales-->
        <!--<script src="assets/js/lightslider.js" type="text/javascript"></script>-->
</html>
