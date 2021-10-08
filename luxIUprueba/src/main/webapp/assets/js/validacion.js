/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


// const form         = document.getElementById('form');
// const perCedula    = document.getElementById('perCedula');
// /*const perNombre    = document.getElementById('perNombre');
// const perApellido  = document.getElementById('perApellido');
// const perSexo      = document.getElementById('perSexo');
// const perFechNac   = document.getElementById('perFechNac');
// const perDireccion = document.getElementById('perDireccion');
// const perProvincia = document.getElementById('perProvincia');
// const perCiudad    = document.getElementById('perCiudad');
// const perRUC       = document.getElementById('perRUC');
// const perRol       = document.getElementById('perRol');*/
// 
// form.addEventListener('submit',e =>{ //recibe evento y llama a un metodo
//     e.preventDefault();
//     checkInputs();
//});
// 
//function checkInputs(){
//    const perCedulaValue    = perCedula.nodeValue.trim(); //trim() elimina cualquier caracter vacio al inicio y final del campo
//    /*const perNombreValue    = perNombre.nodeValue.trim();
//    const perApellidoValue  = perApellido.nodeValue.trim();
//    const perSexoValue      = perSexo.nodeValue.trim();
//    const perFechNacValue   = perFechNac.nodeValue.trim();
//    const perDireccionValue = perDireccion.nodeValue.trim();
//    const perProvinciaValue = perProvincia.nodeValue.trim();
//    const perCiudadValue    = perCiudad.nodeValue.trim();
//    const perRUCValue       = perRUC.nodeValue.trim();
//    const perRolValue       = perRol.nodeValue.trim();*/
//    
//    if(perCedulaValue === '')
//    {
//        setErrorFor(perCedula, 'No se puede dejar la cedula en blanco');
//    }else 
//        setSuccessFor(perCedula);
//    
//    /*if(perNombreValue === '')
//    {
//        setErrorFor(perNombre, 'No se puede dejar el nombre en blanco');
//    }else 
//        setSuccessFor(perNombre);
//    
//    if(perApellidoValue === '')
//    {
//        setErrorFor(perApellido, 'No se puede dejar el apellido en blanco');
//    }else 
//        setSuccessFor(perApellido);
//    
//    if(perSexoValue === '')
//    {
//        setErrorFor(perSexo, 'No se puede dejar el sexo en blanco');
//    }else 
//        setSuccessFor(perSexo);
//    
//    if(perFechNacValue === '')
//    {
//        setErrorFor(perFechNac, 'No se puede dejar la fecha de nacimiento en blanco');
//    }else 
//        setSuccessFor(perFechNac);
//    
//    if(perDireccionValue === '')
//    {
//        setErrorFor(perDireccion, 'No se puede dejar l direccion en blanco');
//    }else 
//        setSuccessFor(perDireccion);
//    
//    if(perProvinciaValue === '')
//    {
//        setErrorFor(perProvincia, 'No se puede dejar la provincia en blanco');
//    }else 
//        setSuccessFor(perProvincia);
//    
//    if(perCiudadValue === '')
//    {
//        setErrorFor(perCiudad, 'No se puede dejar la ciudad en blanco');
//    }else 
//        setSuccessFor(perCiudad);
//    
//    if(perRUCValue === '')
//    {
//        setErrorFor(perRUC, 'No se puede dejar el RUC en blanco');
//    }else 
//        setSuccessFor(perRUC);
//    
//    if(perRolValue === '')
//    {
//        setErrorFor(perRol, 'No se puede dejar el ROL en blanco');
//    }else 
//        setSuccessFor(perRol);*/
//    //Aqui falta la validacion del Email tuto https://www.youtube.com/watch?v=ow8r5jLQabc&t=1304s
//}
//
//function setErrorFor(input,message)
//{ 
//  const formControl     = input.parentElement;//parece ser q parentElement toma la referencia d la etiqueta padre del input en este caso 
//  const small           = formControl.querySelector('small'); //querySelector hace referencia a la etiqueta small 
//  formControl.className = 'frm-input error'; //className adquiere el nombre de la clase 
//  small.innerText       = message;
//}
//
//function setSuccessFor(input){
//  const formControl = input.parentElement;
//  formControl.className = 'frm-input error';
//}

//function isEmail(perEmail){
//  return  /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(perEmail);
//}
