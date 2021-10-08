
////--------------------Validacion Bootstrap 4 -------------------
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();

//

////------------------ otras funciones -------------------------
    //funcion para abri un modal usando  ajax para poder pasar datos al modal
  function abrirModal(codArtKit,tipo){
    $.ajax({
        url:"zModalConAjax.jsp",
        type:"GET",
        data:{codigo:codArtKit, tipo:tipo},
        contentType:"application/json ; charset=UTF-8",
        success: function(result){
            $('.modal-body-artmat').html(result);
            $('#infoArticuloModal').modal('show');
        },
        error: function (error) {
            location.reload();
        }
    });
  }
  
  //funcion para editar materiales del carrito
  function editSessionCarrito(posicion, tipo){
    $.ajax({     
        url: "controlador.jsp",
        type: "GET",
        data: {entidad:'Carrito', opc:'edit' ,posicion:posicion, tipo:tipo},
        contentType: "application/json ; charset=UTF-8",
        success: function (result) {
            //alert("suceess");
        }
        ,
        error: function (error) {
            //alert("Error"); 
        }
    });
 }
  
  function smsSuccessCarrito(){
      document.getElementById('alertMensajes').innerHTML = ""
           +"<div class=\"row justify-content-center\" id=\"success-alert\">"
              + "<div class=\"alert alert-success col-md-6\">"
                  + "<a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>"
                  +  "<strong>Artículo agregado al Carrito.</strong>"
              + "</div>"
           + "</div>";
      setTimeout(function(){
            document.getElementById('alertMensajes').innerHTML = "";
      },3000,"JavaScript");   
  }
  
//-----------------------

//------------------ALERTAS---------------------------

    function alertAddCuenta() {
      document.getElementById('alertMensajes').innerHTML = ""
           +"<div class=\"row justify-content-center\" id=\"success-alert\">"
              + "<div class=\"alert alert-danger col-md-6\">"
                  + "<a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>"
                  +  "<strong>Cuenta creada Correctamente!</strong>."
              + "</div>"
           + "</div>";
      setTimeout(function(){    
            document.getElementById('alertMensajes').innerHTML = "";
      },3000,"JavaScript");   
    }

//----------------------------------------------------
function ingEsquema(email, clave, recargar) { /*login de usuario*/
    $.ajax({     
        url: "login.jsp",
        type: "GET",
        data: {email: email, clave: clave},
        contentType: "application/json ; charset=UTF-8",
        success: function (result) {
            if (result.indexOf("SI") === 0){
                window.location = '/luxIUprueba/index.jsp';
            }else{
                if (result.indexOf("NO") === 0){
                    alert("No existe una cuenta con estos datos");
                }else{
                    alert("Cuenta Iniciada");
                    //$('#loginModal').modal('toggle');
                    $('#loginModal').modal('hide');
                    verArticuloServicio('SRV1','inicio');
                }
            }
            
//            var posicion = result.indexOf("SI"); //retorna 0 si hay la palabra si sino retornara -1
//            if (posicion === -1){
//                window.location = '/luxIUprueba/plantillaTuto.jsp';
//            }else{
//                window.location = '/luxIUprueba/index.jsp';
//            }
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
}

//function AdminUsuarios(rol) { /*Redireccion a jsp que gestiona los 3 roles del Sistema*/
function AdminUsuarios() { /*Redireccion a jsp que gestiona los 3 roles del Sistema*/    
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
//    VentanaPorte();
    $.ajax({
        url: "AdminRoles.jsp",
        type: "GET",
//        data: {rolOpc: rol},
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
}

//        function enviarFormparaLogin() {
////            alert("estoy en ingEsquema");
//        //    document.getElementById('contenidoDinamico').innerHTML = "";
//        //    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
//        //    VentanaPorte();
//            var datos = Objeto2Json('FrmEditCargo');
//            $.ajax({     
//                url: "login.jsp",
//                type: "POST",
//                data: {datos:datos},
//                contentType: "application/json ; charset=UTF-8",
//                success: function (result) {
//                   //alert("success: estoy en success de ingEsquema");
//                        //$("#resultado").html(result);
//                    var posicion = result.indexOf("SI"); //retorna 0 si hay la palabra si sino retornara -1
//                    //muestraMensaje();
//                    if (posicion === -1){
//                        window.location = '/luxIUprueba/plantillaTuto.jsp';
//                        //alertDuplicado();
//                        //alert("Duplicado");
//                    }else{
//                        window.location = '/luxIUprueba/index.jsp';
//                        //alert("Añadido");
////                        alertAdd();
//                    }
//                }
//                ,
//                error: function (error) {
//                    location.reload();
//                }
//            });
//        }

function OpenFrmUsuario()/*funcion q abre el formulario de ingreso de un usuario*/
{
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
//    VentanaPorte();
    $.ajax({
        url: "AdminIngUsuario.jsp",
        type: "GET",
//        data: {rolOpc: rol},
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {   
            location.reload();
        }
    });
}

function recargarSelectCity()//funcion para recargar select de ciudades de una provincia 
{
    $.ajax({
        url:"SelectCiudad.jsp",
        type:"POST",
        data:"provincia=" + $('#perProvincia').val(),
        success:function(datos){
            $('#idSelectCity').html(datos);
        }
    });
}

function ingUsuarios()//funcion para pasar datos del formulario para registrarlos 
{
//     alert("estoy en ingEsquema");
//    document.getElementById('contenidoDinamico').innerHTML = "";
//    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
//    VentanaPorte();
    //var datos = convertirObjetoJson('FormIngPersona');
    var datos = Objeto2Json('FormIngPersona');
    $.ajax({     
        url: "controlador.jsp",
        type: "GET",
        data: {entidad:'Usuario', opc:'addUsuario' ,datos:datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (result) {
            AdminUsuarios(); 
            //alert("success: estoy en success de ingEsquema");
            //$("#resultado").html(result);
//            var posicion = result.indexOf("SI"); //retorna 0 si hay la palabra si sino retornara -1
//            //muestraMensaje();
//            if (posicion === -1){
//                window.location = '/luxIUprueba/plantillaTuto.jsp';
//                //alertDuplicado();
//                //alert("Duplicado");
//            }else{
//                window.location = '/luxIUprueba/index.jsp';
//                //alert("Añadido");
//                //alertAdd();
//            }                        
        }
        ,
        error: function (error) {
            //location.reload();
            AdminUsuarios(); 
        }
    });
}

//funcion para pasar datos del formulario de Materiales para registrarlos
function ingMateriales() 
{
    var datos = Objeto2Json('FormIngMaterial');
    $.ajax({     
        url: "controlador.jsp",
        type: "GET",
        data: {entidad:'Material', opc:'addMaterial' ,datos:datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (result) {
            AdminArtWeb();                       
        }
        ,
        error: function (error) {
            AdminArtWeb(); 
        }
    });
}

//funcion registrar nuevos Kits
function ingKits(cadprod, precio, urlimagen) 
{
    //alert(cadProd);
    var datos = Objeto2Json('FormIngKit');
    $.ajax({     
        url: "controlador.jsp",
        type: "GET",
        data: {entidad:'Kit', opc:'addKit' ,datos:datos, cadprod:cadprod, precio:precio,urlimagen:urlimagen},
        contentType: "application/json ; charset=UTF-8",
        success: function (result) {
            AdminArtWeb();                       
        }
        ,
        error: function (error) {
            AdminArtWeb(); 
        }
    });
}

//function ingUsuariosPrueba(){
//    var datos = Objeto2Json('FormIngPersonaPrueba');
//    $.ajax({     
//        url: "controlador.jsp",
//        type: "GET",
//        data: {datos:datos, opc: 'Prueba Pasar Parametros'},
//        contentType: "application/json ; charset=UTF-8",
//        success: function (result) {
//            AdminUsuarios();                       
//        }
//        ,
//        error: function (error) {
//            AdminUsuarios(); 
//        }
//    });
//}

function AdminArtWeb() { /*Redireccion a jsp de los Articulo Electronicos*/    
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
//    VentanaPorte();
    $.ajax({
        url: "AdminArtElectr.jsp",
        type: "GET",
//        data: {rolOpc: rol},
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
}

function AdminPedidosVentas() { /*Redireccion a jsp de los Articulo Electronicos*/    
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
//    VentanaPorte();
    $.ajax({
        url: "AdminPedidosVentas.jsp",
        type: "GET",
//        data: {rolOpc: rol},
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos) {
            $("#contenidoDinamico").html("");
            $("#contenidoDinamico").html(datos);
        }
        ,
        error: function (error) {
            location.reload();
        }
    });
}

function openSistSeg(codSistema){//pasar cod de servicio seleccionado a ventana que muestra istado de materiales y kits
    document.getElementById('secDinamicoKitMateriales').innerHTML = "";
    document.getElementById('secDinamicoKitMateriales').innerHTML = "<div class='loader'>Cargando...</div>";
    $.ajax({
       url:"AdminMatrsKit.jsp",
       type:"GET",
       contentType:"application/json ; charset=UTF-8",
       data:{codSistema: codSistema},
       success: function(datos){
           $("#secDinamicoKitMateriales").html("");
           $("#secDinamicoKitMateriales").html(datos);
       },
       error:function(error){
           location.reload();
       }
    });
}

//abrir formulario de un material determinado
function openFrmMaterial(codCatalogo){
    document.getElementById('secIngMaterialDinamico').innerHTML = "";
    document.getElementById('secIngMaterialDinamico').innerHTML = "<div class='loader'>Cargando...</div>";
    $.ajax({
        url:"AdminIngMaterial.jsp",
        type:"GET",
        contentType:"application/json charset=UTF-8",
        data:{codCatalogo: codCatalogo},
        success: function(datos){
            $("#secIngMaterialDinamico").html("");
            $("#secIngMaterialDinamico").html(datos);
        },
        error: function(error){
            location.reload();
        }
    });
}

function openFrmKit(){
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando....</div>";
    $.ajax({
       url:"AdminIngKit.jsp",
       type:"GET",
       contentType:"application/json charset=UTF-8",
       data:{},
       success: function (datos){
           $("#contenidoDinamico").html("");
           $("#contenidoDinamico").html(datos);         
       },
       error: function(error){
           location.reload();
       }
    });
}

//----- Funciones para  le Visitante o Cliente------//

function verArticuloServicio(tipsrv,seccion){
    document.getElementById('secDinamicaSrvSeg').innerHTML = "";
    document.getElementById('secDinamicaSrvSeg').innerHTML = "<div class='loader'>Cargando....</div>";
    $.ajax({
        url:"MostrarArtServicio.jsp",
        type:"GET",
        data: {servicio:tipsrv, seccion:seccion},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos){
            $("#secDinamicaSrvSeg").html("");
            $("#secDinamicaSrvSeg").html(datos);    
        },
        error: function (error){
            location.reload();
        }
        
    });
}

//Ver los Articulos ssegun la opcion de menu selecionados
function verArtPorOpcMenu(servicio,caracteristica,subcaracteristica){
    document.getElementById('secDinamicaSrvSeg').innerHTML = "";
    document.getElementById('secDinamicaSrvSeg').innerHTML = "<div class='loader'>Cargando....</div>";
    $.ajax({
        url:"MostrarArtPorMenu.jsp",
        type:"GET",
        data: {servicio:servicio, caracteristica:caracteristica, subcaracteristica:subcaracteristica},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos){
            $("#secDinamicaSrvSeg").html("");
            $("#secDinamicaSrvSeg").html(datos);    
        },
        error: function (error){
            location.reload();
        }
        
    });
}

 
//function pasarACarrito(codart) 
function pasarACarrito(codart, cant, tipo) 
{
    $.ajax({     
        url: "controlador.jsp",
        type: "GET",
        data: {entidad:'Carrito', opc:'create', codarticulo:codart, cantidad:cant, tipo:tipo},
        contentType: "application/json ; charset=UTF-8",
        success: function (result) {
            //alert(result);
            //alert("suceess");
            ///AdminArtWeb(); 
            ///aqui solo debe actualizarze el icono del carrito y haber guardado  en la tabla o en el objeto
        }
        ,
        error: function (error) {
            alert("Error"); 
        }
    });
}

function verCarritoDetalle(){
    document.getElementById('secDinamicaSrvSeg').innerHTML = "";
    document.getElementById('secDinamicaSrvSeg').innerHTML = "<div class='loader'>Cargando....</div>";
    $.ajax({
        url:"AdminCarrito.jsp",
        type:"GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos){
            $("#secDinamicaSrvSeg").html("");
            $("#secDinamicaSrvSeg").html(datos);    
        },
        error: function (error){
            location.reload();
        } 
    });
}

function abrirFormularioUser(){
    document.getElementById('secDinamicaSrvSeg').innerHTML = "";
    document.getElementById('secDinamicaSrvSeg').innerHTML = "<div class='loader'>Cargando....</div>";
    $.ajax({
        url:"IngUsuario.jsp",
        type:"GET",
        data: {},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos){
            $("#secDinamicaSrvSeg").html("");
            $("#secDinamicaSrvSeg").html(datos);    
        },
        error: function (error){
            location.reload();
        } 
    });
}

function ingCuenta(){
    
    var datos = Objeto2Json('FormIngCuenta');
    //var d = "{\"resp\":" + datos + "}";
    const obj = JSON.parse(datos);
    var correo = obj.email;
    if(obj.email.length === 0){
        $("#secDinamicaCuentaEmailError").html("Complete este campo");  
    }else{
        var expresion =  /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/;
        if(expresion.test(correo) === false){
            $("#secDinamicaCuentaEmailError").html("Direccion de Correo incorrecta"); 
        }else{
            if(obj.password1.length < 6){
            $("#secDinamicaCuentaSuccess").html("La contraseña debe tener 6 o mas caracteres");
            }else{
                if(obj.password1 !== obj.password2){
                    $("#secDinamicaCuentaSuccess").html("Las contraseñas no son iguales");
                }else{
                    //alert("igales");
                    $("#secDinamicaCuentaSuccess").html("");
                    $("#secDinamicaCuentaEmailError").html(""); 
                    $("#secDinamicaCuentaError").html("Datos Correctos !!"); 

                    $.ajax({     
                        url: "controlador.jsp",
                        type: "GET",
                        data: {entidad:'ValidarCuenta', correo:correo},
                        contentType: "application/json ; charset=UTF-8",
                        success: function (result) {
                            var operacion = result.indexOf("SI"); 
                            if(operacion === -1){
                               $("#secDinamicaCuentaEmailError").html("Este correo ya existe en el Sistema. Ingrese uno nuevo Porfavor"); 
                            } else{
                               guardarCuenta();
                            }
                        }
                        ,
                        error: function (error) {
                            alert("Error"); 
                        }
                    });
                }
            }            
        }
    }
}

function guardarCuenta(){
    var datos = Objeto2Json('FormIngCuenta');
    $.ajax({     
        url: "controlador.jsp",
        type: "GET",
        data: {entidad:'Cuenta', opc:'addCuenta', datos:datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (result) {
            $('#cuentaModal').modal('hide');
            $("#secDinamicaCuentaError").html("");
            alertAddCuenta();        
        }
        ,
        error: function (error) {
            alert("Error"); 
        }
    });
}
        
        
function guardarVenta(cedula){
    //$('#confirmarPedido').modal('hide');
    //document.getElementById('secDinamicaSrvSeg').innerHTML = "";
    //document.getElementById('secDinamicaSrvSeg').innerHTML = "<div class='loader'>Cargando....</div>";

    var datos = Objeto2Json('FormIngVenta');
    $.ajax({     
        url: "controlador.jsp",
        type: "GET",
        data: {entidad:'Venta', opc:'addVenta', cedula:cedula, datos:datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (result) {
            if (result.indexOf("NO") === 0){
                alert("Error No existe la Compra Previa");
            }else{
               //$('#confirmarPedido').modal('hide');
                pasarObjVentaPrevia(result);
            }
        }    
        ,
        error: function (error) {
            alert("Error"); 
        }
    });
}

//funcion para pasar objVentaPrevia
function pasarObjVentaPrevia(objvntprv){
    document.getElementById('secDinamicaSrvSeg').innerHTML = "";
    document.getElementById('secDinamicaSrvSeg').innerHTML = "<div class='loader'>Cargando....</div>";
    $.ajax({
        url:"EnviarPdfEmailWhatsap.jsp",
        type:"GET",
        data: {objventaprevia:objvntprv},
        contentType:"application/json ; charset=UTF-8",
        success: function (datos){
            $("#secDinamicaSrvSeg").html("");
            $("#secDinamicaSrvSeg").html(datos);    
        },
        error: function (error){
            location.reload();
        }
        
    });
}


function detalleVntAdmin(codvntprv){
    document.getElementById('contenidoDinamico').innerHTML = "";
    document.getElementById('contenidoDinamico').innerHTML = "<div class='loader'>Cargando....</div>";
    $.ajax({
        url:"AdminDetallePedVnt.jsp",
        type:"GET",
        data: {codvntprv: codvntprv},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos){
           $("#contenidoDinamico").html("");
           $("#contenidoDinamico").html(datos);  
        },
        error: function (error){
            location.reload();
        } 
    });
}

function buscarVntPedFecha(){
    var datos = Objeto2Json('FrmBuscarVntPed');
    document.getElementById('contenidoDinamicoVntPed').innerHTML = "";
    document.getElementById('contenidoDinamicoVntPed').innerHTML = "<div class='loader'>Cargando....</div>";
    $.ajax({
        url:"BuscarVentaPedido.jsp",
        type:"GET",
        data: {datos: datos},
        contentType: "application/json ; charset=UTF-8",
        success: function (datos){
           $("#contenidoDinamicoVntPed").html("");
           $("#contenidoDinamicoVntPed").html(datos);  
        },
        error: function (error){
            location.reload();
        } 
    });
}

function actualizarEstado(idventapedido){
//    $("#estadoPedidoModal .close").click();

    var datos = Objeto2Json('FrmAtualizarVntPed');
    $.ajax({
        url:"controlador.jsp",
        type:"GET",
        contentType: "application/json ; charset=UTF-8",
        data: {entidad:'Ventaprevia', opc:'editVentaprevia',datos: datos, idventapedido:idventapedido},
        success: function (datos){ 
           AdminPedidosVentas(); 
        },
        error: function (error){
            location.reload();
        } 
    });
}
         
//function enviarCotCorreoWhats(objventprv,medio){
//    
//}
function verPDF(codvntprv){
    var datos = window.btoa(unescape(encodeURIComponent(codvntprv)));
    var url = "ReportePedidoCompra.jsp?cert=" + datos;
    var params = 'width=' + screen.width;
    params += ', height=' + screen.height;
    params += ', top=0, left=0';
    params += ', fullscreen=yes';
    window.open(url, "", params);
}

function reportePedidoCompra() { //datNomb ; datIDPerio ; datTipoCer ; datFecha; datPerio
    var datos = Objeto2Json('buscarMantenimientoGeneral');
    datos = window.btoa(unescape(encodeURIComponent(datos)));
    var url = "ReportePedidoCompra.jsp?cert=" + datos;
    var params = 'width=' + screen.width;
    params += ', height=' + screen.height;
    params += ', top=0, left=0';
    params += ', fullscreen=yes';
    alert(url);
    window.open(url, "", params);

}



//funcion para enviar mensaje por URL de Whatsapp
function mensajeURLEmail(url, correo){
    alert("url" + url);
    alert("correo" + correo);
    $.ajax({
        url:"controlador.jsp",
        type:"GET",
        contentType: "application/json ; charset=UTF-8",
        data: {entidad:'Email', url:url, correo:correo},
        success: function (datos){ 
          console.log("Email Enviado");
        },
        error: function (error){
            location.reload();
        } 
    }); 
}

//funcion para enviar mensaje por URL de Whatsapp
function mensajeURLWhatsApp(url, num)
{ 
    alert("URL: "+ url);
    alert("NUM: "+ num);
//    var sms = document.getElementById("idsms").value;
//    var num = document.getElementById("idnum").value;
    //var sms = "cotizacion del pedido" + "  " + "https://mariogl.com/wp-content/uploads/2019/07/angular-8-diapositivas.pdf";
    var sms = "cotizacion del pedido" + "  " + url;
    
    var cadsms = "";
    for(var i = 0; i < sms.length; i++){
        if(sms[i] === " "){
            cadsms = cadsms + "%20"; 
        }else{
            if(sms[i] === "á"){
                cadsms = cadsms + "%C3%A1"; 
            }else{
                if(sms[i] === "é"){
                    cadsms = cadsms + "%C3%A9"; 
                }else{
                    if(sms[i] === "í"){
                        cadsms = cadsms + "%C3%AD"; 
                    }else{
                        if(sms[i] === "ó"){
                            cadsms = cadsms + "%C3%B3"; 
                        }else{
                            if(sms[i] === "ú"){
                                cadsms = cadsms + "%C3%BA"; 
                            }else{
                                cadsms = cadsms + sms[i]; 
                            }
                        }
                    }
                }
            }
        }
    }
    alert("cadsms = " + cadsms);
    var cadnum = "";
    for(var i = 0; i < num.length; i++){
        if(i !== 0){
            cadnum = cadnum + num[i]; 
        }
    }
    alert("cadnum = " + cadnum);
    //abrir nueva pestaña en el navegador
    var url = "https://api.whatsapp.com/send?phone=593" + cadnum +  "&text=" + cadsms;
    var win = window.open(url,'_blank');
    win.focus();    
}

//esto es una prieba para twilio de whatsapp 
/*function mensajeTwilio()
{ 
    var sms = document.getElementById("idsms").value;
    var num = document.getElementById("idnum").value;
    sms = sms + "  " + "https://mariogl.com/wp-content/uploads/2019/07/angular-8-diapositivas.pdf";
    
    var cadsms = "";
    for(var i = 0; i < sms.length; i++){
        if(sms[i] === " "){
            cadsms = cadsms + "%20"; 
        }else{
            if(sms[i] === "á"){
                cadsms = cadsms + "%C3%A1"; 
            }else{
                if(sms[i] === "é"){
                    cadsms = cadsms + "%C3%A9"; 
                }else{
                    if(sms[i] === "í"){
                        cadsms = cadsms + "%C3%AD"; 
                    }else{
                        if(sms[i] === "ó"){
                            cadsms = cadsms + "%C3%B3"; 
                        }else{
                            if(sms[i] === "ú"){
                                cadsms = cadsms + "%C3%BA"; 
                            }else{
                                cadsms = cadsms + sms[i]; 
                            }
                        }
                    }
                }
            }
        }
    }
    alert("cadsms = " + cadsms);
    var cadnum = "";
    for(var i = 0; i < num.length; i++){
        if(i !== 0){
            cadnum = cadnum + num[i]; 
        }
    }
    alert("cadnum = " + cadnum);
    //abrir nueva pestaña en el navegador
    var url = "https://api.whatsapp.com/send?phone=593" + cadnum +  "&text=" + cadsms;
    var win = window.open(url,'_blank');
    win.focus();    
}*/

//https://api.whatsapp.com/send?phone=593986025399&text=mensaje%201223


