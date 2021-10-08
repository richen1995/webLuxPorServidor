//------------DATATABLE PARA CUALQUIER TABLA
$(document).ready(function () {
    
    $('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
        $($.fn.dataTable.tables(true)).DataTable().columns.adjust();
    });
//    
//    $('a[data-toggle="tab"]').on( 'shown.bs.tab', function (e) {
        //$.fn.dataTable.tables( {visible: true, api: true} ).columns.adjust();
//    });
    
    $('#tbl,#tbl2,#tbl3,#tbl4').DataTable({
        language: {
            processing: "Tratamiento en curso...",
            search: "Buscar&nbsp;&nbsp;:",
            lengthMenu: "Agrupar de _MENU_ registros",
            info: "Mostrando del item _START_ al _END_ de un total de _TOTAL_ items",
            infoEmpty: "No existen datos.",
            infoFiltered: "(filtrado de _MAX_ elementos en total)",
            infoPostFix: "",
            loadingRecords: "Cargando...",
            zeroRecords: "No se encontraron datos con tu busqueda",
            emptyTable: "No hay datos disponibles en la tabla.",
            paginate: {
                first: "Primero",
                previous: "Anterior",
                next: "Siguiente",
                last: "Ultimo"
            },
            aria: {
                sortAscending: ": active para ordenar la columna en orden ascendente",
                sortDescending: ": active para ordenar la columna en orden descendente"
            }
        },
        scrollY: "",
        lengthMenu: [ [10, 25, -1], [10, 25, "All"] ]
    });

});


