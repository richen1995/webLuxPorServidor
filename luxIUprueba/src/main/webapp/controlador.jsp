<%-- 
    Document   : login
    Created on : 01/03/2021, 19:55:56
    Author     : Richard
--%>

<%@page import="entidades.CustomGmail"%>
<%@page import="entidades.CustomWhatsap"%>
<%@page import="java.util.List"%>
<%@page import="servicios.sVentakit"%>
<%@page import="entidades.Ventakit"%>
<%@page import="servicios.sVentamaterial"%>
<%@page import="entidades.Ventamaterial"%>
<%@page import="entidades.Venta"%>
<%@page import="servicios.sVentaprevia"%>
<%@page import="entidades.Ventaprevia"%>
<%@page import="servicios.sCliente"%>
<%@page import="entidades.Cliente"%>
<%@page import="servicios.sCatalogomaterial"%>
<%@page import="entidades.Catalogomaterial"%>
<%@page import="servicios.sMaterialkit"%>
<%@page import="entidades.Materialkit"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="entidades.CustomMaterial"%>
<%@page import="servicios.sKit"%>
<%@page import="servicios.sServicio"%>
<%@page import="entidades.Servicio"%>
<%@page import="entidades.Kit"%>
<%@page import="servicios.sCatalogo"%>
<%@page import="entidades.Catalogo"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="entidades.Material"%>
<%@page import="servicios.sMaterial"%>
<%@page import="servicios.sPermiso"%>
<%@page import="entidades.Permiso"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="servicios.sCiudad"%>
<%@page import="entidades.Ciudad"%>
<%@page import="servicios.sPersona"%>
<%@page import="entidades.Persona"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONObject"%>
<%@page import="servicios.sUsuario"%>
<%@page import="entidades.Usuario"%>

<!--Twilio-->
    <%@page import="com.twilio.Twilio"%>
    <%@page import="com.twilio.converter.Promoter"%>
    <%@page import="com.twilio.rest.api.v2010.account.Message"%> 
    <%@page import="com.twilio.type.PhoneNumber"%>
<!---->

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
    String tipEntidad = request.getParameter("entidad");

    
    if(tipEntidad.equals("Cuenta")){ //Inggresar una cuenta en la Tabla Usuario 
                                     //aqui la clave Foranea de Persona va ser igual a Null en la Tabla Usuario
        String opcAccion = request.getParameter("opc");
        if(opcAccion.equals("addCuenta")){
            //consuta Permiso
            Permiso objPermiso =  new Permiso(); 
            String jsonPermiso = sPermiso.listaPermisoId(2);
            JSONObject jsonObject = new JSONObject(jsonPermiso);
            objPermiso = new Gson().fromJson(jsonObject.toString(), Permiso.class);
            
            String datos = request.getParameter("datos");
            JSONObject req = new JSONObject(datos);
            Usuario objUsuario = new Usuario();
            objUsuario.setUsEmail(req.getString("email"));
            objUsuario.setUsPassword(req.getString("password1"));
            objUsuario.setUsRol("3");
            objUsuario.setUsEstado(true);
            
                //OBTENER FECHA ACTUAL
                Date date = new Date();
                DateFormat fechaHora = new SimpleDateFormat("yyyy-MM-dd");
                String fecha = fechaHora.format(date);
            objUsuario.setUsFechainicial(fecha + "T00:00:00-05:00");
            objUsuario.setUsFechafinal(null);
            objUsuario.setPerCedula(null);
            objUsuario.setPmId(objPermiso);
            
            String jsonUser = new Gson().toJson(objUsuario,Usuario.class);
            String retornoUser = sUsuario.InsertarUsuario(jsonUser);
            String pp = ""; 
        }
    }
    
    if(tipEntidad.equals("Usuario")){
            String opcAccion = request.getParameter("opc");
        if(opcAccion.equals("addUsuario")){
            String datos = request.getParameter("datos");
            JSONObject req = new JSONObject(datos);
            String resultPersona = sPersona.listaPersonaId(req.getString("perCedula"));
            
            if(resultPersona.isEmpty())//SI NO EXISTE LA PERSONA
            {
                Persona  objPersona = new Persona();
                objPersona.setPerCedula(req.getString("perCedula"));
                objPersona.setPerNombre(req.getString("perNombre"));
                objPersona.setPerApellido(req.getString("perApellido"));
                objPersona.setPerCelular(req.getString("perCelular"));
                objPersona.setPerSexo(req.getString("perSexo"));
                objPersona.setPerRuc(req.getString("perRUC"));
                objPersona.setPerFechanacimiento(req.getString("perFechanacimiento") + "T00:00:00-05:00");
                objPersona.setPerDireccion(req.getString("perDireccion"));
                objPersona.setPerTipo(req.getString("perRol"));
                
                //Setear OBJ Ciudad
                Ciudad objCiudad = new Ciudad();
                String cadCiudad = sCiudad.listaCiudadId(req.getString("perCiudad"));
                JSONObject jsonCiudad = new JSONObject(cadCiudad);
                objCiudad = new Gson().fromJson(jsonCiudad.toString(), Ciudad.class);
                
                objPersona.setCidCodigo(objCiudad);
                
                String datIngJsonCiudad = new Gson().toJson(objPersona,Persona.class);
                String retornoPersona = sPersona.InsertarPersona(datIngJsonCiudad);
                String trrtrtdr = "snasdn";
                
                Persona objPer = new Persona();
                resultPersona = sPersona.listaPersonaId(req.getString("perCedula"));
                JSONObject jsonPer = new JSONObject(resultPersona);
                objPer = new Gson().fromJson(jsonPer.toString(), Persona.class);
                
                //UNA VEZ QUE LA PERSONA YA EXISTE se EMPIEZA POR REGISTRAR AL USUARIO(TABLA)
                if(!resultPersona.isEmpty()){
                //JSONObject jsonPersona = new JSONObject(retornoPersona);
                    Usuario objUsuario = new Usuario();
                    objUsuario.setUsEmail(req.getString("perEmail"));
                    objUsuario.setUsPassword(req.getString("perPassword"));
                    objUsuario.setUsEstado(false);
                    
                    //OBTENER FECHA ACTUAL
                    Date date = new Date();
                    DateFormat fechaHora = new SimpleDateFormat("yyyy-MM-dd");
                    String fecha = fechaHora.format(date);
                    objUsuario.setUsFechainicial(fecha + "T00:00:00-05:00");
                    //objUsuario.setUsFechafinal("");
                    
                    objUsuario.setPerCedula(objPersona);
                    
                    //OBTENER PERMISO       
                    Permiso objPermiso = new Permiso();
                    String cadPermiso;
                    if(req.getString("perRol").equals("cliente")){
                        objUsuario.setUsRol("3");
                        cadPermiso = sPermiso.listaPermisoId(3);
                    }else{
                        if(req.getString("perRol").equals("tecnico")){
                            objUsuario.setUsRol("2");
                            cadPermiso = sPermiso.listaPermisoId(2);
                        }else{
                            objUsuario.setUsRol("1");
                            cadPermiso = sPermiso.listaPermisoId(1);
                        }
                    }           
                    
                    JSONObject jsonPermiso = new JSONObject(cadPermiso);
                    objPermiso = new Gson().fromJson(jsonPermiso.toString(), Permiso.class);
                    
                    objUsuario.setPmId(objPermiso);
                    
                    String datIngJsonUsuario = new Gson().toJson(objUsuario,Usuario.class);
                    String retornoUsuario = sUsuario.InsertarUsuario(datIngJsonUsuario);
                    String prueba = "snasdn";
                     System.out.println("Uuario Ingresado: "+ retornoUsuario);
//                    JSONObject jsonCiudad = new JSONObject(cadCiudad);
//                objCiudad = new Gson().fromJson(jsonCiudad.toString(), Ciudad.class);
                }
                
            }
            

        }
    }
    
    //MATERIAL
    if(tipEntidad.equals("Material")){
        String opcAccion = request.getParameter("opc");
        if(opcAccion.equals("addMaterial")){
            String datos = request.getParameter("datos");
            JSONObject req = new JSONObject(datos);
            String resultMaterial = sMaterial.listaMaterialId(req.getString("matCodigo"));
            
            if(resultMaterial.isEmpty())//SI NO EXISTE EL MATERIAL
            {
                Material objMaterial = new Material();
                objMaterial.setMatCodcustom(req.getString("matCodigo"));
                objMaterial.setMatNombre(req.getString("matNombre"));
                    BigDecimal bigDecimalPrecio = new BigDecimal(req.getString("matPrecio"));
                objMaterial.setMatPrecio(bigDecimalPrecio);
                objMaterial.setMatMarca("matMarca");
                objMaterial.setMatImagen("imagen_controlador");
                objMaterial.setMatColor("color_controlador");
                objMaterial.setMatStock(0);
                objMaterial.setMatDescripcion(req.getString("matDescripcion"));
                objMaterial.setMatVoltaje(Double.parseDouble(req.getString("matVoltaje")));
                objMaterial.setMatCorriente(Double.parseDouble(req.getString("matCorriente")));
                objMaterial.setMatPotencia(Double.parseDouble(req.getString("matPotencia")));
                objMaterial.setMatCompatibilidad(req.getString("matCompatibilidad"));
                objMaterial.setMatTipoconexion(req.getString("matTipoconexion"));

                //Obtener el codigo entero del Catalogo a partir del codigo (Ej: CAT1,CAT2,...ect)
//                Catalogo objCatalogo = new Catalogo();
//                String cadCatalogoCod = sCatalogo.listaCatalogoCodigo(req.getString("matCatalogo"));
//                JSONObject jsonCatalogo = new JSONObject(cadCatalogoCod);
//                objCatalogo = new Gson().fromJson(jsonCatalogo.toString(), Catalogo.class);
                
                
                Catalogomaterial catalogomaterial = new Catalogomaterial();
                String cadCatMat = sCatalogomaterial.listaCatalogomaterialId(Integer.parseInt(req.getString("matTipCat")));
                JSONObject jsonObjCatMat = new JSONObject(cadCatMat);
                catalogomaterial = new Gson().fromJson(jsonObjCatMat.toString(), Catalogomaterial.class);
                
                
                //Setear OBJ SUB - Catalogo
                objMaterial.setCtmtId(catalogomaterial);
                
                String datIngJsonMaterial = new Gson().toJson(objMaterial,Material.class);
                String retornoMaterial = sMaterial.InsertarMaterial(datIngJsonMaterial);
                System.out.println("retornoMaterial: "+ retornoMaterial);
                
                //Modificar codigo del Material recien ingresado
                /*if(!retornoMaterial.isEmpty()){
                    Material objmaterial = new Material();
                    JSONObject reqMaterial = new JSONObject(retornoMaterial);
                    objmaterial = new Gson().fromJson(reqMaterial.toString(), Material.class);
                    String codMat = objmaterial.getMatId();
                    codMat = "MTR" + codMat;
                    objmaterial.setMatCodcustom(codMat);
                    String jsonMat = new Gson().toJson(objmaterial, Material.class);
                    sMaterial.ModficarMaterial(jsonMat,codMat);
                }*/
            }
        }
    }
    //Kit
    if(tipEntidad.equals("Kit")){
        String opcAccion = request.getParameter("opc");
        if(opcAccion.equals("addKit")){
            String datos = request.getParameter("datos");
            JSONObject req = new JSONObject(datos);
            
            //String[] vecIdMat = request.getParameter("cadProd").split(" ");
            
            System.out.println("Este es el Json: " + request.getParameter("cadprod"));
            
            //Lectura de JSON
            ArrayList<CustomMaterial> listCustomMaterial = new ArrayList<CustomMaterial>();
            String jsonMat = "{" + request.getParameter("cadprod") + "}";
            JSONObject jsonObj = new JSONObject(jsonMat);
            JSONArray arrayCustomMat = jsonObj.getJSONArray("JSON");
            for(int i=0;i<arrayCustomMat.length();i++){
                JSONObject childJSONObject = arrayCustomMat.optJSONObject(i);
                CustomMaterial objCustomMaterial = new Gson().fromJson(childJSONObject.toString(),CustomMaterial.class);
                listCustomMaterial.add(objCustomMaterial);
            } 
            
            List<String> listCodMat = new ArrayList<String>();
            List<String> listCodMatDelete = new ArrayList<String>();
            List<String> listDetaMats = new ArrayList<String>();
            String cadCodMats = "";
            String cadCantMats = "";
            String cadDetaMats = "";
            
            String caractKit = "";
            int k = 0;
            String[] detalle  = null;
            for(CustomMaterial oCM: listCustomMaterial){
                listCodMat.add(oCM.getIdmat());
                listCodMatDelete.add(oCM.getIdmat());
                //detalle = oCM.getDetallemat().split(" |");
                listDetaMats.add(oCM.getDetallemat());
                
//                k++;
//                if(k == 1)
//                    caractKit = oCM.getDetallemat();
//                else
//                    caractKit = caractKit + " , " + oCM.getDetallemat();
            }
            
            for (int i = 0; i < listCodMat.size(); i++) {
                int l = 0;
                for (int j = 0; j < listCodMatDelete.size(); j++) {
                    if(listCodMat.get(i).equals(listCodMatDelete.get(j))){
                        listCodMatDelete.set(j, "__");
                        l++;
                    }
                }
                if(l > 0){
                    cadCodMats = cadCodMats + listCodMat.get(i) + "_";
                    cadCantMats = cadCantMats + l + "_";
                    cadDetaMats = cadDetaMats + listDetaMats.get(i) + "_";
                }
                l = 0;
            }
            
            System.out.println("codigos: "     + cadCodMats);
            System.out.println("cantidades: "  + cadCantMats);
            System.out.println("nombres: "  + cadDetaMats);
            
            String[] vecIdMt = cadCodMats.split("_");
            String[] vecCantMt = cadCantMats.split("_");
            String[] vecDetaMt = cadDetaMats.split("_");
            
            for (int i = 0; i < vecIdMt.length; i++) {
                caractKit = caractKit + vecCantMt[i] + " " + vecDetaMt[i] + " , ";
            }
            
            //capturar regisro ultimo de la tabla KIT para generar codigo
            Kit kitObj = new Kit();
            String jsonUltKit = sKit.KitUltimoRegistro();
            JSONObject jsonObjectUltKit = new JSONObject(jsonUltKit);
            kitObj = new Gson().fromJson(jsonObjectUltKit.toString(),Kit.class);
            String cadId =  kitObj.getKitId();
            char [] extraerNum = cadId.toCharArray();
            
            String num = "";
            for (int i = 0; i < extraerNum.length; i++) {
                if(Character.isDigit(extraerNum[i])){
                    num += extraerNum[i];
                }    
            }
            System.out.println("NUM: " + Integer.parseInt(num) + "");  
            System.out.println("CANT-REG: " + (Integer.parseInt(num) + 1) + "");  
            
            Kit objKit = new Kit();
            objKit.setKitId("KIT" + (Integer.parseInt(num) + 1));
            objKit.setKitMateriales(caractKit);
            objKit.setKitImagen(request.getParameter("urlimagen"));
            objKit.setKitPgweb(true);
            objKit.setKitEstado(true);
            
                BigDecimal precio = BigDecimal.valueOf(Double.valueOf(request.getParameter("precio")));
            objKit.setKitPrecio(precio);
                BigDecimal descuento = BigDecimal.valueOf(Double.valueOf(req.getString("descuento")));
            objKit.setKitDescuento(descuento);
            
            /*Servicio*/
            Servicio objServicio = new Servicio();
            String jsonCad = sServicio.listaServicioId(req.getString("kitSistema"));
            JSONObject jsonObject = new JSONObject(jsonCad);
            objServicio = new Gson().fromJson(jsonObject.toString(),Servicio.class);
            
            objKit.setSrvId(objServicio);
            //Guadar en tabla Kit
            
            String jsonKitNew = new Gson().toJson(objKit, Kit.class);
            String retornoKitNew = sKit.InsertarKit(jsonKitNew);
           
            /*Guardar referencia en la tabla MaterialKit*/
            if(retornoKitNew != null){
                //for(CustomMaterial oCM: listCustomMaterial){
                for (int i = 0; i < vecIdMt.length; i++) {
                    Materialkit materialkit = new Materialkit();
                    materialkit.setKitId(objKit);
                    
                    /*LLAMAR MATERIAL DE LA BASE*/
                    Material objmaterial = new Material();
                    String jsonMaterial = sMaterial.listaMaterialId(vecIdMt[i]);
                    JSONObject jsonOBJ = new JSONObject(jsonMaterial);
                    objmaterial = new Gson().fromJson(jsonOBJ.toString(),Material.class);
                    
                    materialkit.setMatId(objmaterial);
                    materialkit.setMtktCantidad(Integer.parseInt(vecCantMt[i]));
                    
                    String jsonMatKitNew = new Gson().toJson(materialkit,Materialkit.class);
                    String retornoMatKitNew = sMaterialkit.InsertarMaterialkit(jsonMatKitNew);
                    
                    System.out.println("retornoMatKitNew: "     + retornoMatKitNew);
                }
            }
        }
    }
    
    
    
    
    
//---- Funciones Puente para Mostrar Informaion ----//
    if(tipEntidad.equals("Carrito")){
        String tipo = request.getParameter("tipo");
        /*CARRITO -> MATERIAL*/
        if(tipo.equals("material")){
            
            //extraccion de las variables de session
            String sessionCodMat = session.getAttribute("carritoMat").toString();
            String sessionCantMat = session.getAttribute("carritoCantMat").toString();

            //ingresar articulos al carrito
            if(request.getParameter("opc").equals("create")){
                String codarticulo = request.getParameter("codarticulo");       
                sessionCodMat = sessionCodMat + codarticulo + "_";
                session.setAttribute("carritoMat", sessionCodMat);

                String cantidad = request.getParameter("cantidad"); 
                sessionCantMat = sessionCantMat + cantidad + "_";
                session.setAttribute("carritoCantMat", sessionCantMat);
            }

            //actualizar carrito por Session
            if(request.getParameter("opc").equals("edit")){
                int posicion = Integer.parseInt(request.getParameter("posicion"));

                String[] varibleSession = editVarSessiones(sessionCodMat, sessionCantMat, posicion);
                
                session.setAttribute("carritoMat", varibleSession[0]);  
                session.setAttribute("carritoCantMat", varibleSession[1]); 
            }    
        }
        
        /*CARRITO -> KIT*/
        if(tipo.equals("kit")){
            String sessionCodKit = session.getAttribute("carritoKit").toString();
            String sessionCantKit = session.getAttribute("carritoCantKit").toString();

            //ingresar articulos al carrito
            if(request.getParameter("opc").equals("create")){
                String codarticulo = request.getParameter("codarticulo");       
                sessionCodKit = sessionCodKit + codarticulo + "_";
                session.setAttribute("carritoKit", sessionCodKit);

                String cantidad = request.getParameter("cantidad"); 
                sessionCantKit = sessionCantKit + cantidad + "_";
                session.setAttribute("carritoCantKit", sessionCantKit);
            }

            //actualizar carrito por Session
            if(request.getParameter("opc").equals("edit")){
                int posicion = Integer.parseInt(request.getParameter("posicion"));
                String[] varibleSession = editVarSessiones(sessionCodKit, sessionCantKit, posicion);

                session.setAttribute("carritoKit", varibleSession[0]);  
                session.setAttribute("carritoCantKit", varibleSession[1]);  
            }    
        }
    }
    
    //VENTA
    if(tipEntidad.equals("Venta")){ 
       
        String opcAccion = request.getParameter("opc");
        if(opcAccion.equals("addVenta")){
            
            String datos = request.getParameter("datos");
            JSONObject req = new JSONObject(datos);
            String cedula = request.getParameter("cedula");
            String burscaPer = sPersona.listaPersonaId(cedula);
            String returnVentapevia = "";
            
            if(burscaPer.isEmpty()){//Si la cedula NO existe entoncs se registra a la persona 
                //INGRESAR PERSONA
                Persona objPersona = new Persona();
                objPersona.setPerCedula(req.getString("perCedula"));
                objPersona.setPerNombre(req.getString("perNombre"));
                objPersona.setPerApellido(req.getString("perApellido"));
                objPersona.setPerCelular(req.getString("perCelular"));
                objPersona.setPerSexo("sexo");
                objPersona.setPerRuc(req.getString("perRUC"));
                objPersona.setPerFechanacimiento(null);
                objPersona.setPerDireccion("Dir");
                objPersona.setPerTipo("cliente");
                
                //Get OBJ Ciudad
                Ciudad objCiudad = new Ciudad();
                String cadCiudad = sCiudad.listaCiudadId(req.getString("perCiudad"));
                JSONObject jsonCiudad = new JSONObject(cadCiudad);
                objCiudad = new Gson().fromJson(jsonCiudad.toString(), Ciudad.class);
                
                objPersona.setCidCodigo(objCiudad);
                
                String jsonPersona = new Gson().toJson(objPersona,Persona.class);
                String returnPersona = sPersona.InsertarPersona(jsonPersona);
                
                if(!returnPersona.isEmpty()){
                    JSONObject jsonCli = new JSONObject(returnPersona);
                    Persona objPer = new Gson().fromJson(jsonCli.toString(), Persona.class);
                    
                    //USUARIO (get) para modificar 
                    String idUser = session.getAttribute("codUser").toString();
                    Usuario objUser = new Usuario();
                    String cadUser = sUsuario.listaUsuarioId(Integer.parseInt(idUser));
                    JSONObject jsonUser = new JSONObject(cadUser);
                    objUser = new Gson().fromJson(jsonUser.toString(), Usuario.class);
                    objUser.setPerCedula(objPer);
                    String jsonUserMod = new Gson().toJson(objUser,Usuario.class);
                    String returnUser = sUsuario.ModficarUsuario(jsonUserMod.toString(), objUser.getUsId());
                    
                    //CLIENTE
                    Cliente objCliente = new Cliente();
                    objCliente.setCliId(objPer.getPerCedula() + "C");
                    objCliente.setCliEstado(true);
                    objCliente.setPerCedula(objPer);
                    String jsonCliente = new Gson().toJson(objCliente,Cliente.class);
                    String returnCliente = sCliente.InsertarCliente(jsonCliente);
                    
                    if(!returnCliente.isEmpty()){
                        Ventaprevia objVentaprevia = new Ventaprevia();
                            BigDecimal bigDecimalPrecio = new BigDecimal("8.23");
                        objVentaprevia.setVntpImporte(bigDecimalPrecio);
                        objVentaprevia.setVntpEstado("pendiente");
                        objVentaprevia.setVntpTipuser("cliente");
                        objVentaprevia.setVntpCallefirst(req.getString("direcCallePrincipal"));
                        objVentaprevia.setVntpCallesecond(req.getString("direcCalleSecundaria"));
                        objVentaprevia.setVntpSector(req.getString("direcSector"));
                        objVentaprevia.setVntpNumcasa(req.getString("direcNumCasa"));
                        objVentaprevia.setVntpCodpostal(req.getString("direcCodPostal"));
                        objVentaprevia.setVntpReferencia(req.getString("direcPuntoReferencia"));
                            //OBTENER FECHA ACTUAL
                            Date date = new Date();
                            DateFormat fechaHora = new SimpleDateFormat("yyyy-MM-dd");
                            String fecha = fechaHora.format(date);
                        objVentaprevia.setVntpFecha(fecha + "T00:00:00-05:00");
                            //HORA ACTUAL
                            DateFormat formatohora = new SimpleDateFormat("HH:mm:ss");
                        objVentaprevia.setVntpHora("1970-01-01T"+ formatohora.format(date) + "-05:00");
                        objVentaprevia.setPerCedula(objPer);    
                        objVentaprevia.setCidCodigo(objCiudad);    
                        
                        String jsonVentaprevia = new Gson().toJson(objVentaprevia,Ventaprevia.class);
                        returnVentapevia = sVentaprevia.InsertarVentaprevia(jsonVentaprevia);
                    
                    }
                }   
            }else{//Si la Cedula SI existe en a tabla Persona solo registra  la Ventaprevia
                /*
                Persona     (consultar)
                Ciudad      (consultar)
                Ventaprevia (guardar)
                */
                
                //Get OBJ Persona
                Persona objPersona = new Persona();
                String cadPersona = sPersona.listaPersonaId(cedula);
                JSONObject jsonPersona = new JSONObject(cadPersona);
                objPersona = new Gson().fromJson(jsonPersona.toString(), Persona.class);
                
                //Get OBJ Ciudad
                Ciudad objCiudad = new Ciudad();
                String cadCiudad = sCiudad.listaCiudadId(req.getString("perCiudad"));
                JSONObject jsonCiudad = new JSONObject(cadCiudad);
                objCiudad = new Gson().fromJson(jsonCiudad.toString(), Ciudad.class);
                
                //Set Ventaprevia
                Ventaprevia objVentaprevia = new Ventaprevia();
                    BigDecimal bigDecimalPrecio = new BigDecimal(80);
                objVentaprevia.setVntpImporte(bigDecimalPrecio);
                objVentaprevia.setVntpEstado("pendiente");
                objVentaprevia.setVntpTipuser("cliente");
                objVentaprevia.setVntpCallefirst(req.getString("direcCallePrincipal"));
                objVentaprevia.setVntpCallesecond(req.getString("direcCalleSecundaria"));
                objVentaprevia.setVntpSector(req.getString("direcSector"));
                objVentaprevia.setVntpNumcasa(req.getString("direcNumCasa"));
                objVentaprevia.setVntpCodpostal(req.getString("direcCodPostal"));
                objVentaprevia.setVntpReferencia(req.getString("direcPuntoReferencia"));
                    //OBTENER FECHA ACTUAL
                    Date date = new Date();
                    DateFormat fechaHora = new SimpleDateFormat("yyyy-MM-dd");
                    String fecha = fechaHora.format(date);
                objVentaprevia.setVntpFecha(fecha + "T00:00:00-05:00");
                    //HORA ACTUAL
                    DateFormat formatohora = new SimpleDateFormat("HH:mm:ss");
                objVentaprevia.setVntpHora("1970-01-01T"+ formatohora.format(date) + "-05:00");
                objVentaprevia.setPerCedula(objPersona);    
                objVentaprevia.setCidCodigo(objCiudad);    

                String jsonVentaprevia = new Gson().toJson(objVentaprevia,Ventaprevia.class);
                returnVentapevia = sVentaprevia.InsertarVentaprevia(jsonVentaprevia);
                String o = "";
                
            }
             
            if(!returnVentapevia.isEmpty()){
                //Guardar ateriales y kits
                //Materiales
                String carMat = session.getAttribute("carritoMat").toString();
                String carCantMat = session.getAttribute("carritoCantMat").toString();
                String carKit = session.getAttribute("carritoKit").toString();
                String carCantKit = session.getAttribute("carritoCantKit").toString();

                //Extraer Ventaprevia una vez ingresada en la base
                JSONObject jsonObjVentPrv = new JSONObject(returnVentapevia);
                Ventaprevia vntprv = new Gson().fromJson(jsonObjVentPrv.toString(), Ventaprevia.class);

                //recorrer el carrito y gurdar los kits y matereriales
                if(!carMat.isEmpty()){
                    //Ingreso de los materiales de la Venta Previa
                    String [] cadMat = carMat.split("_");
                    String [] cadCantMat = carCantMat.split("_");
                    for(int i=0;i<cadMat.length;i++){
                       Material objMat = new Material();
                       String jsonMat = sMaterial.listaMaterialId(cadMat[i]); 
                       JSONObject jsonObjMat = new JSONObject(jsonMat);
                       objMat = new Gson().fromJson(jsonObjMat.toString(), Material.class);

                       Ventamaterial objVntMat = new Ventamaterial();
                       objVntMat.setMatId(objMat);
                       objVntMat.setVtmtCantidad(Integer.parseInt(cadCantMat[i]));
                       objVntMat.setVntpId(vntprv);

                        String jsonVntMat = new Gson().toJson(objVntMat,Ventamaterial.class);
                        String returnVntMat = sVentamaterial.InsertarVentamaterial(jsonVntMat);
                        String vntMt = "";
                    }
                }

                if(!carKit.isEmpty()){
                    //Ingreso de los kits de la Venta Previa
                    String [] cadKit = carKit.split("_");
                    String [] cadCanKit = carCantKit.split("_");
                    for(int i=0;i<cadKit.length;i++){
                       Kit objKit = new Kit();
                       String jsonKit = sKit.listaKitId(cadKit[i]);
                       JSONObject jsonObjKit = new JSONObject(jsonKit);
                       objKit = new Gson().fromJson(jsonObjKit.toString(), Kit.class);

                       Ventakit objVntKit = new Ventakit();
                       objVntKit.setVtktCantidad(Integer.parseInt(cadCanKit[i]));
                       objVntKit.setKitId(objKit);
                       objVntKit.setVntpId(vntprv);

                        String jsonVntKit = new Gson().toJson(objVntKit,Ventakit.class);
                        String returnVntKit = sVentakit.InsertarVentakit(jsonVntKit);
                        String vntMt = "";  
                    }
                }
            }
            
            if(!returnVentapevia.isEmpty()){
                response.setContentType("text/plain");
                response.getWriter().write(returnVentapevia);
            }else{
                response.setContentType("text/plain");
                response.getWriter().write("NO");
            }
                
        }
    }
    
    //VENTAPREVIA
    if(tipEntidad.equals("Ventaprevia")){    
        String opcAccion = request.getParameter("opc");
        if(opcAccion.equals("editVentaprevia")){
            String cadVentaprevia = sVentaprevia.listaVentapreviaId(Integer.parseInt(request.getParameter("idventapedido")));
            if(!cadVentaprevia.isEmpty()){
                String json = request.getParameter("datos");
                JSONObject req = new JSONObject(json);
                
                Ventaprevia objvntaprv = new Ventaprevia();
                JSONObject jsonObject = new JSONObject(cadVentaprevia);
                objvntaprv = new Gson().fromJson(jsonObject.toString(), Ventaprevia.class);
                if(req.getString("estado").equals("pendiente")){
                    objvntaprv.setVntpEstado("pendiente");
                }
                if(req.getString("estado").equals("pagado")){
                    objvntaprv.setVntpEstado("pagado");
                }
                if(req.getString("estado").equals("cancelado")){
                    objvntaprv.setVntpEstado("cancelado");
                }
                
                String jsonVentaprevia = new Gson().toJson(objvntaprv , Ventaprevia.class);
                sVentaprevia.ModficarVentaprevia(jsonVentaprevia, Integer.parseInt(request.getParameter("idventapedido")));
            }
        }
    }
    
    
    if(tipEntidad.equals("ValidarCuenta")){
        String posicion = "NO";
        String correo = request.getParameter("correo");
        if(correo != null){
            String jsonUser = sUsuario.listaUsuarioEmail(correo);
            if(jsonUser.isEmpty()){
                posicion = "SI";
            }
        }
        response.setContentType("text/plain");
        response.getWriter().write(posicion);
    }
    
    if(tipEntidad.equals("Email")){
        String url      = request.getParameter("url");
        String email    = request.getParameter("correo");
        String asunto   = "Cotización DluxMultiproyectos de Pedido";
        String sms      = "Cotización de los Articulos Electrónicos " + url;
        CustomGmail objCustomGmail = new CustomGmail();
        //objCustomGmail.enviarGmail("iirenelizbeth@gmail.com");
        //objCustomGmail.enviarGmail("deniseinfante2002@gmail.com","Cotización DluxMultiproyectos de Pedido","Cotización de los Articulos Electrónicos " + url);
        objCustomGmail.enviarGmail(email,asunto,sms);
    }
    
    if(tipEntidad.equals("WhatsApp")){
//        CustomWhatsap objWhatsApp = new CustomWhatsap();
//        objWhatsApp.Whatsapp(request.getParameter("sms"), request.getParameter("num"));
        //https://api.whatsapp.com/send?phone=593986025399&text=como%20Fer%20ya%20hiciste%20tus%20deberes?
        
        char [] cadSMS = request.getParameter("sms").toCharArray();
        String sms = "";
        for (int i = 0; i < cadSMS.length; i++) {
            if(" ".equals(cadSMS[i])){
                sms += "%20";
            }else{
                sms += cadSMS[i];
            }
        }
        int k = 0;
        char [] cadNUM = request.getParameter("num").toCharArray();
        String num = "";
        for (int i = 0; i < cadNUM.length; i++) {
            if(Character.isDigit(cadNUM[i])){
                if(k > 0){
                    num += cadNUM[i];    
                }
                k++;
            }    
        }
    }
%>






<%!
/*SubFunciones*/
String[] editVarSessiones(String cadSessionMatArt, String cadSessionCantMatArt, int posicion){
    
    String[]  codMatArt = cadSessionMatArt.split("_");
    String[]  cantMatArt = cadSessionCantMatArt.split("_");

    int i = 0;
    String codigo = "", newcadCarrito = "", newcadCantidad = "";

    do{
        try{
            codigo = codMatArt[i];
            if((posicion - 1) != i){
                newcadCarrito = newcadCarrito + codMatArt[i] + "_"; 
                newcadCantidad = newcadCantidad + cantMatArt[i] + "_";
            }
        }catch(Exception e){
            codigo = null;
        }
       i++;
    }while(codigo != null);
    
    String[] varsSessiones = {newcadCarrito,newcadCantidad};
    
    return varsSessiones;
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