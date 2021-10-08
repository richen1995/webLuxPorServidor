<%-- 
    Document   : zModalConAjax
    Created on : 01/08/2021, 22:15:02
    Author     : Richard
--%>

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

    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%out.print(getServletContext().getContextPath());%>/assets/css/font-awesome.min.css"/>
    
    <!--estilos de iconos -->
    <link rel="stylesheet" href="assets/fontawesome/css/all.min.css" type="text/css"/>

    <%
        System.out.println("Jsp-Modal-Ajax");
        
        String codigo = request.getParameter("codigo");
        String tipo = request.getParameter("tipo"); 
        //tipo = kit
        //tipo = material
        
        Material objMat = new Material();
        Kit objKit = new Kit(); 
        
      if(tipo.equals("material")){ 
        String cadJSONmat = sMaterial.listaMaterialId(codigo);
        JSONObject JSONMat = new JSONObject(cadJSONmat);
        objMat = new Gson().fromJson(JSONMat.toString(), Material.class);
        System.out.println("Material: " + objMat.getCtmtId().getCtmtNombre());
      }   
      if(tipo.equals("kit")){ 
        String cadJSONkit = sKit.listaKitId(codigo);
        JSONObject JSONKit = new JSONObject(cadJSONkit);
        objKit = new Gson().fromJson(JSONKit.toString(), Kit.class);
        System.out.println("Kit: " + objKit.getKitMateriales());
      }
    %>
    
    <style>
/*        #part1{
           background-color: yellow; 
        }
        #part2{
           background-color: green; 
        }*/
    </style>
    
<!--    <div clas="main-content">-->
    <div class="row">
            <div class="col-md-6">                                        
                <div class="zoom-img modal-footer d-flex justify-content-center">
                    <!--<div class="signup-section"><a href="#a" class="text-info"> Registrarse</a>.</div>-->
                    <%
                        if(tipo.equals("material")){
                            out.println("<img src=\"" + objMat.getMatImagen() + "\" alt=\"camara\"/>");
                        }
                        if(tipo.equals("kit")){
                            out.println("<img src=\"" + objKit.getKitImagen() + "\" alt=\"camara\"/>");
                        }
                    %>
                </div>
            </div>
            <div class="col-md-6">
                <%
                if(tipo.equals("material")){
                %>
                    <h4><%= objMat.getCtmtId().getCtmtNombre() %></h4>
                    <hr width="90%"/>
                    <h3> <%= objMat.getMatPrecio() %>  $</h3>
                    <hr width="90%"/>
                    <p class = "modal-dialog-scrollable"> <%= objMat.getMatNombre() %> <br>
                     <%= objMat.getMatMarca() %> <br>
                     <%= objMat.getMatDescripcion() %> <br>
                
                <%
                    String subcaract = "";
                    if(objMat.getMatVoltaje() != null){  subcaract = subcaract + objMat.getMatVoltaje() + " V";} 
                    if(objMat.getMatCorriente() != null){subcaract = subcaract + " | " + objMat.getMatCorriente() + " A";}    
                    if(objMat.getMatPotencia() != null){subcaract = subcaract + " | " + objMat.getMatPotencia() + " W";}   
                    out.println("" + subcaract + "</p>");
                }

                if(tipo.equals("kit")){
                %> 
                    <h4>KIT</h4>
                    <h3> <%= objKit.getKitPrecio() %>  $</h3>
                    <hr width="90%"/>
                    <p> <%= objKit.getKitMateriales() %> </p>                
                <%
                }
                %> 
                
                <hr width="90%"/>
                <div class="row">
                    <div class="col-md-4" id="part1">
                        <div class="input-group">
                          <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button">+</button>
                          </div>
                          <input type="text" class="form-control"  aria-label="Recipient's username" value="1" aria-describedby="basic-addon2" id="idCantidad">
                          <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button">-</button>
                          </div>
                        </div>
                    </div>
                    <div class="col-md-7" id="part2">
                        <!--<button class="btn btn-outline-secondary" onclick="codMaterial('<%= objMat.getMatId()%>')"><i class="fas fa-shopping-cart"></i>  Agregar al Carrito</button>-->
                        <%
                            if(tipo.equals("material")){
                                out.println("<button class=\"btn btn-outline-secondary\" onclick=\"codMatKit('" + objMat.getMatId() + "','material')\"><i class=\"fas fa-shopping-cart\"></i>  Agregar al Carrito</button>");
                            }
                            
                            if(tipo.equals("kit")){
                                out.println("<button class=\"btn btn-outline-secondary\" onclick=\"codMatKit('" + objKit.getKitId() + "','kit')\"><i class=\"fas fa-shopping-cart\"></i>  Agregar al Carrito</button>");
                            }
                        %>
                    </div>
                </div>
            </div>
    </div>
    
    <script>
        function codMatKit(codmat, tipo){
            let cant = document.getElementById("idCantidad").value;
            pasarACarrito(codmat,cant,tipo);
            $('#infoArticuloModal').modal('hide');
            smsSuccessCarrito();
        }

    </script>
        <JQUERY>
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/vendor/jquery-2.2.4.min.js"></script>
       
       <!-- bootstrap 4 js -->
       <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/bootstrap.min.js"></script>
       <script src="https://code.highcharts.com/highcharts.js"></script>

       <!-- start chart js -->
        <script src="assets/js/prueba.js" type="text/javascript"></script>

</html>


