<%-- 
    Document   : IngUsuario
    Created on : 16/08/2021, 18:19:29
    Author     : Richard
--%>

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
<!DOCTYPE html>
<html>
<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <!--<title>Login</title>-->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    
    <!--estilos de iconos -->
    <link rel="stylesheet" href="assets/fontawesome/css/all.min.css" type="text/css"/>

    <%

        String cadMatCarrito = session.getAttribute("carritoMat").toString();
        String cadCantMatCarrito = session.getAttribute("carritoCantMat").toString();
        String cadKitCarrito = session.getAttribute("carritoKit").toString();
        String cadCantKitCarrito = session.getAttribute("carritoCantKit").toString();
        String ingreso = session.getAttribute("ingreso").toString();
        String cedula = session.getAttribute("cedula").toString();
        String codigoUser = session.getAttribute("codUser").toString();
        String rol = session.getAttribute("rol").toString();
        
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
        
        //PROVINCIA
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
    
        Usuario objUsuario = new Usuario(); 
//        Ventaprevia objVentaPrevia = new Ventaprevia();
        Ventaprevia objVentaPrevia = null;
        
        if(ingreso.equals("true")){
//            if(!cedula.equals("")){
                String jsonUser = sUsuario.listaUsuarioId(Integer.parseInt(codigoUser));
                JSONObject jsonObjUser = new JSONObject(jsonUser); 
                objUsuario = new Gson().fromJson(jsonObjUser.toString(), Usuario.class);
//            }
            
            
                String cadVentaprevia = sVentaprevia.listaVentapreviaporCedula(cedula);
            Date date = null;
            if(!cadVentaprevia.isEmpty()){
                String jsonVentaprevia = "{\"respuesta\":" + cadVentaprevia + "}";
                JSONObject jsonObjVntPrv = new JSONObject(jsonVentaprevia);
                JSONArray arrayVntPrv = jsonObjVntPrv.getJSONArray("respuesta");
                for (int i = 0; i < arrayVntPrv.length(); i++) {
                    JSONObject jsonObjChildren =  arrayVntPrv.optJSONObject(i);
                    Ventaprevia ventaPrevia = new Gson().fromJson(jsonObjChildren.toString(), Ventaprevia.class);
                    String[] fecha = ventaPrevia.getVntpFecha().split("T");
                    Date dateconf = null;
                    try{
                        SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
                        dateconf = format.parse(fecha[0]);
                    }catch(Exception e){
                        
                    }
                    if(i == 0){
//                        date = ventaPrevia.getVntpFecha();
                        date = dateconf ;
                        objVentaPrevia = ventaPrevia;
                    }else{
                        if(dateconf.after(date)){
                            date = dateconf;
                            objVentaPrevia = ventaPrevia;
                        }
                    }
                }
            }
        }
           
    %>
    
    <div class="main-header" align="center">
            <em>Registro de Usuario</em>
             <br><br>
    </div>
    
    <div class="container">
        <div class="row">
            <div class="col-md-12"> 
                <form id="FormIngVenta" class="needs-validation" novalidate>
                        <div class="form-row justify-content-center">
                            <div class= "col-md-8">
                                <h4 class="col-md-11 mb-3">Datos del usuario</h4>
                                <%
                                if(cedula.equals("")){
                                %>
                                    <div class="row">    
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="perNombre">Nombres</label>
                                            <input type="text" class="form-control" id="perNombre" placeholder="Nombres" name="perNombre" value="" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="perApellido">Apellidos</label>
                                            <input type="text" class="form-control " id="perApellido" placeholder="Apellidos" name="perApellido" value="" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>  
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="perEmail">Correo Electrónico</label>
                                            <input type="text" class="form-control" id="perEmail" placeholder="Email" value="<%= objUsuario.getUsEmail() %>" name="perEmail" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="perCedula">Cédula</label>
                                            <input type="text" class="form-control" id="perCedula" placeholder="Numero de Cedula" value="" maxlength="10" name="perCedula" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="perRUC">RUC</label>
                                            <input type="text" class="form-control" id="perRUC" placeholder="RUC" name="perRUC" maxlength="13" value="" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="perCelular">Celular</label>
                                            <input type="text" class="form-control" id="perCelular" placeholder="Numero de Celular" value="" maxlength="10" name="perCelular" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                    </div>
                                <%}else{%>
                                    <div class="row">    
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="perNombre">Nombres</label>
                                            <input type="text" class="form-control" id="perNombre" placeholder="Nombres" name="perNombre" value="<%= objUsuario.getPerCedula().getPerNombre() %>" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="perApellido">Apellidos</label>
                                            <input type="text" class="form-control " id="perApellido" placeholder="Apellidos" name="perApellido" value="<%= objUsuario.getPerCedula().getPerApellido() %>" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>  
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="perEmail">Correo Electrónico</label>
                                            <input type="text" class="form-control" id="perEmail" placeholder="Email" value="<%= objUsuario.getUsEmail() %>" name="perEmail" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="perRUC">RUC</label>
                                            <input type="text" class="form-control" id="perRUC" placeholder="RUC" name="perRUC" maxlength="13" value="<%= objUsuario.getPerCedula().getPerRuc() %>" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="perCelular">Celular</label>
                                            <input type="text" class="form-control" id="perCelular" placeholder="Numero de Celular" value="<%= objUsuario.getPerCedula().getPerCelular() %>" maxlength="10" name="perCelular" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                    </div>
                                <%}%>
                                <hr>
                                <h4 class="col-md-11 mb-3">Datos de Entrega</h4>
                                  <%
                                if(objVentaPrevia != null){
                                %>
                                    <div class="row">
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="perProvincia">Provincia</label>
                                              <select class="custom-select mr-sm-2" id="perProvincia" name="perProvincia" required>
                                                    <%
                                                    for (Provincia oPet : arrayProvincia) {
                                                        out.println("<option value='" + oPet.getPrvCodigo() + "'>" + oPet.getPrvNombre() + "</option>");
                                                    }
                                                %>
                                              </select>
                                        </div>
                                        <div class="frm-input col-md-6 mb-3" id="idSelectCity">
                                             <!--TUTORIAL: https://www.youtube.com/watch?v=J3jyQxvmwY0-->
                                        </div>
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="direcCallePrincipal">Calle principal</label>
                                            <input type="text" class="form-control" id="direcCallePrincipal" placeholder="Calle Principal" name="direcCallePrincipal" value="<%= objVentaPrevia.getVntpCallefirst() %>" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="direcCalleSecundaria">Calle secundaria</label>
                                            <input type="text" class="form-control " id="direcCalleSecundaria" placeholder="Calle Secundarial" name="direcCalleSecundaria" value="<%= objVentaPrevia.getVntpCallesecond() %>">
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>  
                                        <div class="frm-input col-md-6 mb-1">
                                            <label for="direcSector">Sector/Área</label>
                                            <input type="text" class="form-control" id="direcSector" placeholder="Sector, Comunidad, Parroquia, Barrio, etc" value="<%= objVentaPrevia.getVntpSector() %>" name="direcSector" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="direcNumCasa">Numero de casa/Piso</label>
                                            <input type="text" class="form-control" id="direcNumCasa" placeholder="Numero de casa/Piso" name="direcNumCasa" value="<%= objVentaPrevia.getVntpNumcasa() %>" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="direcCodPostal">Codigo postal</label>
                                            <input type="text" class="form-control" id="direcCodPostal" placeholder="Codigo Postal" value="<%= objVentaPrevia.getVntpCodpostal() %>" name="direcCodPostal" maxlength="6" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="direcPuntoReferencia">Punto referencia</label>
                                            <input type="text" class="form-control" id="direcPuntoReferencia" placeholder="Escuela, iglesia, edificio, etc" value="<%= objVentaPrevia.getVntpReferencia() %>" name="direcPuntoReferencia" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                    </div>
                                <%}else{%>
                                    <div class="row">
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="perProvincia">Provincia</label>
                                              <select class="custom-select mr-sm-2" id="perProvincia" name="perProvincia" required>
                                                    <%
                                                    for (Provincia oPet : arrayProvincia) {
                                                        out.println("<option value='" + oPet.getPrvCodigo() + "'>" + oPet.getPrvNombre() + "</option>");
                                                    }
                                                %>
                                              </select>
                                        </div>
                                        <div class="frm-input col-md-6 mb-3" id="idSelectCity">
                                             <!--TUTORIAL: https://www.youtube.com/watch?v=J3jyQxvmwY0-->
                                        </div>
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="direcCallePrincipal">Calle principal</label>
                                            <input type="text" class="form-control" id="direcCallePrincipal" placeholder="Calle Principal" name="direcCallePrincipal" value="" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="direcCalleSecundaria">Calle secundaria</label>
                                            <input type="text" class="form-control " id="direcCalleSecundaria" placeholder="Calle Secundarial" name="direcCalleSecundaria" value="">
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>  
                                        <div class="frm-input col-md-6 mb-1">
                                            <label for="direcSector">Sector/Área</label>
                                            <input type="text" class="form-control" id="direcSector" placeholder="Sector, Comunidad, Parroquia, Barrio, etc" value="" name="direcSector">
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="direcNumCasa">Numero de casa/Piso</label>
                                            <input type="text" class="form-control" id="direcNumCasa" placeholder="Numero de casa/Piso" name="direcNumCasa" value="">
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="direcCodPostal">Codigo postal</label>
                                            <input type="text" class="form-control" id="direcCodPostal" placeholder="Codigo Postal" value="" name="direcCodPostal" maxlength="6" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                        <div class="frm-input col-md-6 mb-3">
                                            <label for="direcPuntoReferencia">Punto referencia</label>
                                            <input type="text" class="form-control" id="direcPuntoReferencia" placeholder="Escuela, iglesia, edificio, etc" value="" name="direcPuntoReferencia" required>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Complete el Campo</div>
                                        </div>
                                    </div>
                                <%}%>
                            </div>
                        </div>
                    <br><br>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-5">
                <div class="table-responsive align-self-center">
                    <table id="tbl" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>Precio</th>
                             </tr>
                        </thead>
                        <tbody>
                            <% Integer cont = 0; 
                                for (Material oPet:listMaterial) {
                                    cont++;
                                    out.println("<tr id='fila" + cont + "'>");
                                        out.println("<td>" + oPet.getCtmtId().getCtmtNombre() + "</td>");
                                        out.println("<td>" + Integer.parseInt(listCantMat.get(cont-1)) + "</td>");
                                        float precio = Integer.parseInt(listCantMat.get(cont-1)) * oPet.getMatPrecio().floatValue();
                                        totmat = totmat + precio;
                                        out.println("<td>" + precio +" $"+ "</td>");
                                    out.println("</tr>");
                                }
                                cont = 0; 
                                for (Kit oKit:listKit) {
                                    cont++;
                                    out.println("<tr id='filaa" + cont + "'>"); 
                                        out.println("<td>" + oKit.getKitMateriales() + "</td>");
                                        out.println("<td>" + Integer.parseInt(listCantKit.get(cont-1)) + "</td>");
                                        float precio = Integer.parseInt(listCantKit.get(cont-1)) * oKit.getKitPrecio().floatValue();
                                        totkit = totkit + precio;
                                        out.println("<td>" + precio +" $"+ "</td>");
                                    out.println("</tr>");
                                }
                            %>
                            <tr>
                                <td colspan="2">Subtotal</td>
                                <td><%= df.format(totkit + totmat) %> $</td>
                            </tr>
                            <tr>
                                <td colspan="2">IVA</td>
                                <td><%= df.format((totkit + totmat) * 0.12) %> $</td>
                            </tr>
                            <tr>
                                <td colspan="2">TOTAL</td>
                                <td><%= df.format((totkit + totmat)+(totkit + totmat) * 0.12) %> $</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-5">
                <h4>Modo de Pago</h4>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                    <label class="form-check-label" for="exampleRadios1">
                      Deposito/Transferencia
                    </label>
                </div>
                <div class="col-sm-6" align='center'>
                    <!--<button id = "btnFormulario" class="btn btn-primary" data-toggle="modal" onclick="guardarVenta(<%= cedula%>)" data-target="#cuentaBancoModal">Confirmar Pedido</button>-->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmarPedido" >Confirmar Pedido</button>
                </div>
            </div>
        </div>
    </div>
                        
        <!------------Modal para Confirmar Pedido -------------------->
        <div class="modal fade" id="confirmarPedido" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Confirmar Pedido</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <p>¿Desea Confirmar y Finalizar su Pedido?</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Regresar</button>
                <button type="button" class="btn btn-primary" id="btnFormulario" data-dismiss="modal" onclick="guardarVenta(<%= cedula%>)">Confirmar</button>        
              </div>
            </div>
          </div>
          </div>
        </div>                
                    
    <script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
    
    <!-- bootstrap 4 js -->
    <script src="assets/js/bootstrap.min.js"></script>
    
    <!--popper-->
    <script src="assets/js/vendor/popper.min.js" type="text/javascript"></script>

    <script src="assets/js/prueba.js" type="text/javascript"></script>
    
    <script>
        $(document).ready(function(){
            recargarSelectCity();
            $('#perProvincia').change(function(){
                recargarSelectCity();
            });    
        }); 
    </script>

</html>
