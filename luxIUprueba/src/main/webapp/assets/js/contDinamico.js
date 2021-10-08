(function load(){
    const $form = document.getElementById("frmUsers")
    const $divElements = document.getElementById("divElements")
  
})

//    const templateElement = (data, position) => {
//        return (`
//            <button class="delete" onclick="removeElement(event, ${position})"></button>
//            <strong>User - </strong> ${data}
//        `)
//    }       
//    $btnAdd.addEventListener("click", (event) => {              //addEventListener() Registra un evento a un objeto en específico => target.addEventListener(tipo, listener[, useCapture]);
//                                                                //event:      almacena información sobre un evento y es pasado
//                                                                // "=>": oculta la palabrafunction
//        if($form.name.value != "" && $form.lastName.value != ""){
//            let index = addJsonElement({
//                name: $form.name.value,
//                lastName: $form.lastName.value
//            })
//            const $div = document.createElement("div")
//            $div.classList.add("notification", "is-link", "is-light", "py-2", "my-1")//classList:  es una forma práctica de acceder a la lista de clases de un elemento
//                                                                                     //classList.add: añade las clases indicadas
//            $div.innerHTML = templateElement(`${$form.name.value} ${$form.lastName.value}`, index)
//
//            $divElements.insertBefore($div, $divElements.firstChild)
//
//            $form.reset()
//        }else{
//            alert("Complete los campos")
//        }  
//    })
//        $btnSave.addEventListener("click", (event) =>{
//        parameters = parameters.filter(el => el != null)
//        const $jsonDiv = document.getElementById("jsonDiv")
//        $jsonDiv.innerHTML = `JSON: ${JSON.stringify(parameters)}`
//        $divElements.innerHTML = ""
//        parameters = []
//    })
//})
    
 