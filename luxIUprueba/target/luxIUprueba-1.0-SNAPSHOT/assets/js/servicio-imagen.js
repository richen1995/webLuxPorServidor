/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
'use strict';
const boton_foto = document.querySelector('#btnKitImagen');
const imagen = document.querySelector('#divImgKit');
let widget_cloudinary = window.cloudinary.createUploadWidget({
    cloudName: 'imgluxflame',
    uploadPreset: 'preset_pabs'
    }, (err,result)=>{
    if(!err && result && result.event === 'success'){ 
        console.log('Imagen subidad con exito',result.info);
        imagen.src = result.info.secure_url;
    }
});

boton_foto.addEventListener('click',() =>{
    widget_cloudinary.open();
},false );
    
    
