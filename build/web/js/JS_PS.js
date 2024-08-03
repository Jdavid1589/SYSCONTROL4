
// Función para DataTables
$(document).ready(function () {
    // Inicializa la tabla DataTables
   var table = $('#miTabla2').DataTable({
        dom: 'Blftrip', // Mueve los elementos de paginación al final de la tabla
        buttons: [
            {
                extend: 'excelHtml5',
                text: '<i class="fas fa-file-excel"></i> ',
                titleAttr: 'Exportar a Excel',
                className: 'btn btn-success'
            },
            {
                extend: 'pdfHtml5',
                text: '<i class="fas fa-file-pdf"></i> ',
                titleAttr: 'Exportar a PDF',
                className: 'btn btn-danger',
                orientation: 'landscape', // Establece la orientación horizontal
                customize: function (doc) {
                    // Ajusta las márgenes
                    doc.pageMargins = [20, 5, 5, 5]; // [left, top, right, bottom]
                    doc.defaultStyle.fontSize = 10;
                    // Ajusta el tamaño de la fuente
                    doc.defaultStyle.fontSize = 8; // Por ejemplo, establece el tamaño de la fuente en 10 puntos
                    // Filtra las columnas que quieres imprimir
                    var filteredColumns = [0, 1, 2, 3, 4, 5, 16, 17, 18, 20, 21, 22, 23, 24, 25]; // Índices de las columnas que quieres imprimir
                    // Remueve las columnas no deseadas
                    doc.content[1].table.body.forEach(function (row) {
                        row.splice(0, row.length, ...row.filter((cell, index) => filteredColumns.includes(index)));
                    });
                }
            }
        ],
        lengthMenu: [10, 15, 20, 100],
        columnDefs: [
            {className: 'centered', targets: '_all'}, // Aplica la clase 'centered' a todas las columnas
            {orderable: false, targets: [0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 36, 37, 38]}, // Columnas para filtrar con un click
            {searchable: false, targets: [0, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]} // Col por las que quiero hacer una busqueda,  [ Nota]
        ],
        pageLength: 4,
        destroy: true,
        order: [[1, 'desc']], // Ordena la tabla por la primera columna en orden descendente
        pagingType: 'simple_numbers', // Tipo de paginación simple con números
        language: {
            processing: 'Procesando...',
            "lengthMenu": "<span style='color: #09f; font-size: 18px;   '>Mostrar _MENU_ Registros </span>",
            "zeroRecords": "No se Encontraron Resultados",
            "emptyTable": "Ningún dato disponible en esta tabla",
            "info": "<span style='color: #09f; font-size: 18px;'>Mostrando _START_ a _END_ de _TOTAL_ Entradas</span>",
            "infoEmpty": "<span style='color: #09f; font-size: 18px;'>Mostrando 0 a 0 de 0 Entradas</span>",
            "infoFiltered": "<span style='color: purple; font-size: 14px;'>(filtrado de un total de _MAX_ entradas)</span>",
            "search": "<span style='color: #09f; font-size: 18px;'>Buscar:</span>",
            paginate: {
                first: 'Primero',
                last: 'Último',
                next: 'Siguiente',
                previous: 'Anterior'
            },
            aria: {
                sortAscending: ': Activar para ordenar la columna ascendente',
                sortDescending: ': Activar para ordenar la columna descendente'
            }
        }
    });
 // Mueve los botones a la izquierda de la tabla
    $('.dt-buttons', table.table().container()).appendTo($('#miTabla_wrapper .dataTables_filter'));

    // Función para limitar los botones de paginación
    function limitPagination(table) {
        var pagination = $(table.table().container()).find('.dataTables_paginate .paginate_button');
        var numPages = 4; // Limita a 4 botones de paginación

        pagination.each(function (index, element) {
            if (index > numPages && !$(element).hasClass('next') && !$(element).hasClass('previous')) {
                $(element).css('display', 'none');
            }
        });
    }

    // Llama a la función limitPagination cuando se redibuja la tabla
    table.on('draw', function () {
        limitPagination(table);
    });

    // Llama a la función limitPagination inicialmente
    limitPagination(table);

});






