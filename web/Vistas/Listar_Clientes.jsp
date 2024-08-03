

<%@page import="java.util.List"%>
<%@page import="Persistencia.DaoClientes"%>
<%@page import="Persistencia.DaoDocumento"%>

<%@page import="Modelo.Clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Lista Clientes</title>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
              integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" 
              crossorigin="anonymous" referrerpolicy="no-referrer">
        <!-- DataTable -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.3.3/css/buttons.bootstrap5.min.css">

        <!-- Incluye los archivos CSS de Bootstrap -->  
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-...." crossorigin="anonymous" />
        <!--link href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/css/bootstrap.min.css" rel="stylesheet"-->

        <link href="Vistas/css4/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="Vistas/css4/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
        <link href="Vistas/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="Vistas/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>  
        <link href="Vistas/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
        <link href="Vistas/css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">     

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">


        <link href="Vistas/Estilos_css/estilo4.css" rel="stylesheet" type="text/css"/>
        <link href="Vistas/Estilos_css/css_tablas.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>  

        <main>

            <!--Barra de Navegacion -->
            <nav class="navbar  navbar-expand-md navbar-dark border-3 fixed-top border-bottom ">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#"></a>
                    <img src="./Vistas/Imagenes/MI.jpg" alt="Logo" style="float: left; width: 90px;" />
                    <button 
                        class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse  " id="navbarSupportedContent">


                        <%--    <ul class="navbar-nav ml-3 me-auto">  
                            <form class="navbar-nav ms-auto ml-auto" role="search">
                                <input class="formulario__input " type="search" name="txtbuscar" placeholder="Buscar Empresa, Nombres" aria-label="Buscar">
                                <button  type="submit" name="accion" value="buscar" style="background:  rgb(212, 173, 17)" class="btn btn-warning ml-1">Buscar</button>
                            </form>

                        </ul>--%>
                        <ul class="navbar-nav mx-auto text-center" >   
                            <li class="nav-item" >
                                <a class="nav-link active my-menu-item"  aria-current="page" href="##">
                                    <span >
                                        LISTA  DE CLIENTES
                                    </span>
                                </a>
                            </li>
                        </ul>

                        <ul class="navbar-nav mb-3 mb-lg-0 float-start ">   

                            <li class="nav-item ">
                                <a class="nav-link active"  aria-current="page" href="./index3.jsp"><b>
                                        <span style="margin-left: 10px; border:none" class=" btn btn-outline-light ">
                                            <i class="bi bi-arrow-left-square-fill text-dark"></i> <b> Inicio </b>
                                        </span>
                                </a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link active" aria-current="page" href="ControladorClientes?accion=add">
                                    <span  style="margin-left: 10px; border:none" class=" btn btn-outline-light ">
                                        <i class="bi bi-plus-circle"></i> <b>Añadir</b> </span>
                                </a>
                            </li>

                        </ul>


                    </div>
                </div>
            </nav>
            <br>
            <!--Barra de Navegacion -->
            <div  style="margin-top:55px; margin-bottom: ">
                <br>
                <a title="Agregar Clientes" href="ControladorClientes?accion=add" 
                   class=" btn btn-primary text-warning ml-5 float-start">           
                    <i class="fas fa-plus"></i>
                </a>
            </div>

            <div class="col-sm-12 mb-4 sticky-top" style="margin-top: 60px">
                <div class="table-container ml-3 md-3 table-responsive pagination-container" id="paginationContainer">
                    <table id="miTabla" class="table table-striped table-hover sticky-top">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Empresa</th> 
                                <th>Correo</th>
                                    <%-- <th>Nombres</th>
                                    <th>Tipo_Doc</th>
                                    <th># Docum</th>
                                    <th>Direccion</th>                              
                                    <th>Telefono</th>    --%>                       
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% List<Clientes> Lista = (List<Clientes>) request.getAttribute("listaClientes");
                                for (Clientes clientes : Lista) {%>
                            <tr>
                                <td><%= clientes.getIdclientes()%></td>
                                <td contenteditable="true" onblur="updateCell(this, '<%= clientes.getIdclientes()%>', 'razon_Social')"><%= clientes.getRazon_Social()%></td> 
                                <td><%= clientes.getCorreo()%></td>
                                <%--  <td><%= clientes.getNombres_apellidos()%></td>
                               <td><%= DaoDocumento.obtenerTipoDocumento(clientes.getIdDocumento())%></td>                           
                               <td><%= clientes.getNumero_Documento()%></td>
                               <td><%= clientes.getDireccion()%></td>                           
                      
                               <td><%= clientes.getNumero_Telefono()%></td>    --%>  


                                <%-- <td contenteditable="true" onblur="updateCell(this, '<%= clientes.getIdclientes()%>', 'nombres_apellidos')"><%= clientes.getNombres_apellidos()%></td>
                                <td><%= DaoDocumento.obtenerTipoDocumento(clientes.getIdDocumento())%></td>                           
                                <td contenteditable="true" onblur="updateCell(this, '<%= clientes.getIdclientes()%>', 'numero_Documento')"><%= clientes.getNumero_Documento()%></td>
                                <td contenteditable="true" onblur="updateCell(this, '<%= clientes.getIdclientes()%>', 'direccion')"><%= clientes.getDireccion()%></td>                           
                                <td contenteditable="true" onblur="updateCell(this, '<%= clientes.getIdclientes()%>', 'correo')"><%= clientes.getCorreo()%></td>
                                <td contenteditable="true" onblur="updateCell(this, '<%= clientes.getIdclientes()%>', 'numero_Telefono')"><%= clientes.getNumero_Telefono()%></td> --%>
                                <td>
                                    <div class="btn-group" role="group" aria-label="Acciones">
                                        <a href="ControladorClientes?accion=eliminar&id=<%= clientes.getIdclientes()%>"
                                           class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de que deseas eliminar este Cliente?')">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                        <a href="ControladorClientes?accion=editarclientes&id=<%= clientes.getIdclientes()%>" class="btn btn-primary btn-sm">
                                            <i class="fas fa-pencil-alt"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                    <div class="dataTable_bottom">
                        <div class="dataTables_info"></div>
                        <div class="dataTables_paginate"></div>
                    </div>
                </div>
            </div>




            <h1>${mensaje}</h1>
        </div>

    </main>

    <!-- Alerta Sweet Alert  -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- For alert-style pop-up messages -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> <!-- For AJAX functionality -->

    <!-- JQuery -->
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
        integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
        crossorigin="anonymous"
        referrerpolicy="no-referrer"
    ></script>
    <!-- DataTable -->
    <script   type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>

    <script    type="text/javascript"   src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script    type="text/javascript"   src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script    type="text/javascript"   src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script    type="text/javascript"   src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
    <script    type="text/javascript"   src="https://cdn.datatables.net/buttons/2.3.3/js/dataTables.buttons.min.js"></script>
    <script    type="text/javascript"   src="https://cdn.datatables.net/buttons/2.3.3/js/buttons.bootstrap5.min.js"></script>
    <script    type="text/javascript"   src="https://cdn.datatables.net/buttons/2.3.3/js/buttons.html5.min.js"></script>
    <script    type="text/javascript"   src="https://cdn.datatables.net/buttons/2.3.3/js/buttons.print.min.js"></script>



    <!-- Bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>




    <!-- Funsion para DataTable -->
    <script>


                                               $(document).ready(function () {
                                                   // Inicializa la tabla DataTables
                                                   var table = $('#miTabla').DataTable({
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
                                                                   doc.pageMargins = [5, 5, 5, 5]; // [left, top, right, bottom]
                                                                   doc.defaultStyle.fontSize = 10;

                                                                   // Filtra las columnas que quieres imprimir
                                                                   var filteredColumns = [0, 1, 2, 3, 4, 5, 6, 7, 8]; // Índices de las columnas que quieres imprimir

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
                                                           {orderable: false, targets: [1,2,3]},
                                                           {searchable: false, targets: [2,3]}
                                                       ],
                                                       pageLength: 6,
                                                       destroy: true,
                                                       order: [[1, 'desc']], // Ordena la tabla por la Segunda columna en orden descendente
                                                       pagingType: 'simple_numbers', // Tipo de paginación simple con números
                                                       language: {
                                                           processing: 'Procesando...',
                                                           "lengthMenu": "<span style='color: #09f; font-size: 18px;   '>Mostrar _MENU_ Registros </span>",
                                                           "zeroRecords": "No se Encontraron Resultados",
                                                           "emptyTable": "Ningún dato disponible en esta tabla",
                                                           "info": "<span style='color: #09f; font-size: 18px;'>Mostrando _START_ a _END_ de _TOTAL_ Entradas</span>",
                                                           "infoEmpty": "<span style='color: #09f; font-size: 18px;'>Mostrando 0 a 0 de 0 Entradas</span>",
                                                           "infoFiltered": "<span style='color: purple; font-size: 14px;'>(filtrado de un total de _MAX_ entradas)</span>",
                                                           "search": "<span style='color: #09f; font-size: 18px; border-bottom: 2px  solid #ccc;'>Buscar:</span>",
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

    </script>

    <!-- Funsion para Actualizar  -->
    <script>
        function updateCell(cell, id, column) {
            var newValue = cell.innerText;

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "ControladorClientes?accion=updatecell", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    if (xhr.responseText === "success") {
                        console.log('Dato actualizado correctamente');
                    } else {
                        console.error('Error al actualizar el dato');
                    }
                }
            };
            xhr.send("id=" + id + "&column=" + column + "&value=" + encodeURIComponent(newValue));
        }
    </script>

    <!-- Styles particular para DataTable-->
    <style>

        /* CSS personalizado para DataTables */

        /*  .dataTables_wrapper //  Cambia el estilo  de letra mas negrita*/
        .dataTables_wrapper {
            font-family: 'Roboto', sans-serif;

        }
        .dataTables_info {
            margin-top:  25px;
            font-weight: 700;

        }
        /* Con la propiedad bottom y letf controlo la aubicacion de la info */
        .dataTables_paginate {
            font-family: 'Roboto', sans-serif;
            font-weight: 700;
            bottom: -15%;
            left:  100%;
            margin-bottom: 5px; /* Ajusta según sea necesario */
        }

        /* Mueve Los botones al final */
        .dataTables_wrapper .dt-buttons {
            position: absolute;
            bottom: -40px;
            left: 50%;
            transform: translateX(-60%);
            margin-bottom: 20px; /* Ajusta según sea necesario */
        }

        /* Estilos redondeados para los btn */

        .btn {
            border-radius: 20px; /* Redondear los botones */
        }
        #paginationContainer {
            float: right
        }
        a #mipapelera{
            font-size: 25px;
            color: #66ff66;
            transition: 0.3s;

        }
        a #mipapelera:hover{

            color: #FF0000;
            box-shadow: 3px 0px 30px rgba(246, 78, 60, 1.5);

        }


    </style>


    <!-- Funsion para Eliminar -->
    <script>
        function eliminarCliente(id) {
            swal({
                title: "¿Estás seguro?",
                text: "Una vez eliminado, no podrás recuperar este Cliente.",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                    .then((willDelete) => {
                        if (willDelete) {
                            // Aquí rediriges a la URL de eliminación
                            window.location.href = "ControladorClientes?accion=eliminar&id=" + id;
                        } else {
                            swal("El Cliente está a salvo.");
                        }

                    });
        }
    </script>

    <!-- Funsion para Eliminar -->
    <script>
        $(document).ready(function () {
            $(document).on("click", ".btnDelete", function () {
                var idp = $(this).data("id");
                confirmarEliminacion(idp);
            });

            function confirmarEliminacion(idp) {
                swal({
                    title: "¿Está seguro de eliminar Cliente?",
                    text: "Una vez eliminado deberá agregar de nuevo.",
                    icon: "warning",
                    buttons: {
                        confirmar: "Sí, Eliminar",
                        cancelar: "No, Cancelar"
                    },
                }).then((isConfirm) => {
                    if (isConfirm) {
                        eliminarRegistro(idp);
                    } else {
                        swal("Cancelado", "Cancelaste la eliminación", "error");
                    }
                });
            }

            function eliminarRegistro(idp) {
                var url = "ControladorClientes?accion=eliminar&id=" + idp;

                console.log("URL de eliminación:", url);

                $.ajax({
                    type: 'POST',
                    url: url,
                    async: true,
                }).done(function (response) {
                    console.log("Respuesta del servidor:", response);

                    if (response === "success") {
                        swal("Eliminado", "El Cliente se ha eliminado", "success");
                        setTimeout(function () {
                            window.location.href = "ControladorClientes?accion=listar";
                        }, 1000);
                    } else {
                        swal("Error Cliente en Uso", response, "error");
                    }
                }).fail(function () {
                    swal("Error", "Hubo un problema al intentar eliminar el Cliente", "error");
                });
            }
        });
    </script>

    <!-- Estilos CSS DataTable-->
    <style>
        /* CSS personalizado para DataTables */
        .dataTables_wrapper {
            font-family: 'Roboto', sans-serif;
            color:green;

        }
        /* Estilos redondeados para los btn */

        .btn {
            border-radius: 20px; /* Redondear los botones */
        }



    </style>

</body>
</html>

