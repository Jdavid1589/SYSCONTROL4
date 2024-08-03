
<%@page import="Modelo.ControlSeco"%>
<%@page import="Modelo.Clientes"%>
<%@page import="Persistencia.DaoClientes"%>
<%@page import="Modelo.Productos"%>

<%@page import="java.util.List"%>
<%@page import="Persistencia.DaoProductoSeco"%>

<%@page import="java.util.List"%>
<%@page import="Persistencia.DaoPerfil"%>
<%@page import="Persistencia.DaoDocumento"%>
<%@page import="Persistencia.DaoProductos"%>

<%@page import="Persistencia.DaoSeguimientos"%>
<%@page import="Persistencia.DaoUsuarios"%>
<%@page import="Modelo.Usuarios"%>


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <title>Lista Producto Seco</title>

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

        <!--Barra de Navegacion -->
        <nav class="navbar  navbar-expand-md navbar-dark border-3 fixed-top border-bottom ">
            <div class="container-fluid ">
                <a class="navbar-brand  " href="#"></a>
                <img src="./Vistas/Imagenes/MI.jpg" alt="Logo" style="float: left; width: 90px;" />

                <button 
                    class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse  " id="navbarSupportedContent">  

                    <%--<ul class="navbar-nav ml-3 me-auto">  
                        <form class="navbar-nav ms-auto ml-auto" action="ControladorPs" method="post" class="custom-form" role="search">
                            <input class="form-control " type="search" name="txtbuscar" placeholder="Aux, Fecha, Lote, Ref" aria-label="Buscar">
                            <button  type="submit" name="accion" value="buscar" style="background:  rgb(212, 173, 17)" class="btn btn-warning bt-sm ml-1">Buscar</button>
                        </form>

                    </ul>--%>
                    <ul class="navbar-nav mx-auto">   
                        <li class="nav-item">
                            <a class="nav-link active my-menu-item"  aria-current="page" href="##">
                                <span 
                                    <b> REGISTRO PRODUCTO SECO</b>
                                </span>
                            </a>
                        </li>
                    </ul>
                    <ul class="navbar-nav mb-3 mb-lg-0 float-start">

                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="./index3.jsp">
                                <span   style="margin-left: 10px; border:none" class="btn btn-outline-light">
                                    <i class="bi bi-arrow-left-square-fill text-dark"></i><b> Inicio</span>
                            </a></b>
                        </li>

                        <li class="nav-item ">
                            <a class="nav-link active" aria-current="page" href="ControladorPs?accion=listar">
                                <span   style="margin-left: 10px; border:none" class="btn btn-outline-light">
                                    <i class="fas fa-list"></i> <b>Listar</b></span>
                            </a>
                        </li>
                        <%--<li class="nav-item ">
                            <a class="nav-link active" aria-current="page" href="ControladorPs?accion=add" >
                                <span   style="margin-left: 10px; border:none" class="btn btn-outline-light">
                                    <i class="fas fa-plus"></i></span>
                            </a>
                        </li>--%>
                    </ul>
                    <span onclick="location.reload()" class="btn btn-outline-light text-center"  style="font-size: 20px; color: #ffcd39; margin-left: 25px; border:none" title="Actualizar Tabla" >
                        <i class="bi bi-arrow-clockwise"></i>
                    </span>
                </div>
            </div>
        </nav>

        <!--Fin Barra de Navegacion -->

        <style>
            .campo-invalido {
                border: 1px solid red; /* Cambia el borde a rojo para resaltar el campo */
                background-color: #ffcccc; /* Cambia el fondo a un tono rojo claro */
            }

            /*   * Estilos para el elemento con el id 'th_' Lodos   */
            #th_ {
                background: #fff;            /* Establece el color de fondo del elemento a blanco */
                font-size: 12px;             /* Establece el tamaño de la fuente a 14 píxeles */
                font-weight: bold;           /* Establece el peso de la fuente a 'bold', haciendo que el texto sea negrita */

                font-family: 'Roboto', Arial Narrow;
                /* 
               * Aplica la fuente 'Raleway' al texto del elemento.
               * La fuente 'Raleway' es una fuente personalizada que se carga desde Google Fonts.
               * Si por alguna razón 'Raleway' no se puede cargar, se usa 'sans-serif' como una fuente de respaldo.
               * 'sans-serif' es una categoría de fuentes sin adornos en los extremos de los caracteres,
               * lo que las hace generalmente más legibles en pantallas digitales.
               */
            }
            #th_2 {
                background:  #ffe8a1;
                color:  #09f;
                font-family: 'Roboto', Arial Narrow;
                font-size: 14px;
                font-weight: bold;
            }
            #th_2_ {

                color:  #fff;
                font-family: 'Roboto', Arial Narrow;
                font-size: 13px;
                font-weight: bold;
            }



        </style>

        <br > 
        <div class="col-12">   
            <br >    
            <div class=" mt-5 ">
                <a href="ControladorPs?accion=add" 
                   class="btn btn-warning text-primary  mb-2 float-start"
                   title="Agregar Nuevo"> <!-- Agrega el atributo title -->
                    <i class="fas fa-plus"></i>
                </a>
            </div>


            <div class="table-container ml-3 md-3 table-responsive pagination-container" id="paginationContainer">
                <table id="miTabla2" class="table table-striped table-hover sticky-top">
                    <thead>
                        <tr>
                            <th>Select</th>
                            <th>ID</th>
                            <th>Fecha</th>
                            <th>Referencia</th>
                            <th id="th_" >  Lote   </th>
                            <th>Cantidad NC</th>
                            <th>Causas</th>
                                <%
                                    int numCamposHumedad = 12; // Definir el número de campos de humedad inicial a mostrar
                                    int numCamposPH = 5; // Definir el número de campos de pH inicial a mostrar

                                    for (int i = 1; i <= numCamposHumedad; i++) {
                                %>
                            <th class="miTH" id="Hum_<%= i%>">Hum_<%= i%></th>
                                <%
                                    }
                                %>
                            <th id="th_2_">   Hum-Prom </th>

                            <th>R.325</th>
                                <%
                                    for (int i = 1; i <= numCamposPH; i++) {
                                %>
                            <th class="miTH" id="pH_<%= i%>">pH_<%= i%></th>
                                <%
                                    }
                                %>

                            <th id="th_2_">   pH-Prom </th>

                            <th>Dv(50)</th>
                            <th>Dv(90)</th>
                            <th>Abs.A</th>
                            <th>Brigh</th>
                            <th>Wh</th>
                            <th>Auxiliar</th>
                            <th id="th_2"> # Consecutivo</th>                        
                            <th id="th_2">Referencia</th>                        
                            <th id="th_2">Cliente</th>    
                            <th>ID</th>
                            <th id="th_">Comentarios</th>
                            <th id="th_">Observación</th>
                            <th><b>Acciones</b></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% List<ControlSeco> Lista = (List<ControlSeco>) request.getAttribute("listaProducSeco");
                            for (ControlSeco terminadoseco : Lista) {%>

                        <tr class="negrita">
                            <td><input type="checkbox" name="selectControlcalidad" value="<%= terminadoseco%>" class="selectCheckbox" onclick="toggleRowColor(this)"></td>
                            <td><%= terminadoseco.getIdControlCalidad()%></td>
                            <td><%= terminadoseco.getFecha()%></td>
                            <td><strong><%= DaoProductos.obtenerNombreProducto(terminadoseco.getIdProductos())%></strong></td>
                            <td><%= terminadoseco.getLote()%></td>
                            <%--  <td contenteditable="true" onblur="updateCell(this, '<%= terminadoseco.getIdControlCalidad()%>', 'lote')"><strong><%= terminadoseco.getLote()%></strong></td> --%>
                            <td><%= terminadoseco.getCant_noconf()%></td>
                            <td><%= terminadoseco.getCausas()%></td>

                            <% for (int i = 1; i <= numCamposHumedad; i++) {%>  
                            <td id="Hum_<%= i%>"><%= terminadoseco.getHumedad(i) != null ? terminadoseco.getHumedad(i) : ""%></td>
                            <% }%>

                            <td><%= terminadoseco.getHumedad_promedio()%></td>
                            <td><%= terminadoseco.getRetenido325()%></td>
                            <% for (int i = 1; i <= numCamposPH; i++) {%>
                            <td id="pH_<%= i%>"><%= terminadoseco.getPH(i) != null ? terminadoseco.getPH(i) : ""%></td>
                            <% }%>
                            <td><%= terminadoseco.getpH_promedio()%></td>
                            <td><%= terminadoseco.getDv50()%></td>
                            <td><%= terminadoseco.getDv90()%></td>
                            <td><%= terminadoseco.getAbs_Aceite()%></td>
                            <td><%= terminadoseco.getBrigh()%></td>
                            <td><%= terminadoseco.getWhitness()%></td>
                            <td><%= DaoUsuarios.obtenerNombreUsuario(terminadoseco.getIdUsuarios())%></td>
                            <%--    <td>
                                <b style="font-family: Arial; font-size: 14px;">
                                    <%= String.format("%04d", terminadoseco.getIdConsecutivo())%>
                                </b>
                            </td>--%>

                            <td contenteditable="true" onblur="updateCell(this, '<%= terminadoseco.getIdControlCalidad()%>', 'idConsecutivo')">
                                <strong><%= String.format("%04d", terminadoseco.getIdConsecutivo())%></strong>
                            </td>


                            <td><strong><%= DaoProductoSeco.obtenerProductoFinal(terminadoseco.getIdControlCalidad())%></strong></td>
                            <td><strong><%= DaoProductoSeco.obtenerclienteFinal(terminadoseco.getIdControlCalidad())%></strong></td>
                            <td><%= terminadoseco.getIdControlCalidad()%></td>
                            <td contenteditable="true" onblur="updateCell(this, '<%= terminadoseco.getIdControlCalidad()%>', 'comentarios')">
                                <strong><%= terminadoseco.getComentarios()%></strong>
                            </td>

                            <td contenteditable="true" onblur="updateCell(this, '<%= terminadoseco.getIdControlCalidad()%>', 'observacion')">
                                <strong><%= terminadoseco.getObservacion()%></strong>
                            </td>

                            <td>
                                <div class="btn-group" role="group" aria-label="Acciones">
                                    <a href="ControladorPs?accion=editar_ps&id=<%= terminadoseco.getIdControlCalidad()%>"
                                       class="btn btn-sm ms-1">
                                        <i class="fas fa-pencil-alt mb-2" style="font-size: 20px; color: #09f"></i> <!-- Ícono de lápiz -->
                                    </a>

                                    <a href="ControladorPs?accion=pdf&id=<%= terminadoseco.getIdControlCalidad()%>"
                                       class="btn btn-sm ms-1 ">
                                        <i class="bi bi-file-pdf" style="font-size: 22px; color: red"></i> <!-- Ícono pdf más grande -->
                                    </a>
                                    <%--  <a href="ControladorPs?accion=eliminar2&id=<%= terminadoseco.getIdControlCalidad()%>"
                                       class="btn btn-sm ms-1" onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?')">
                                        <i class="fas fa-trash" style="font-size: 20px; color: #00ff00"></i> <!-- Ícono de papelera -->
                                    </a>--%>
                                    <!-- Sweet Alert 2-->
                                    <a href="#" class="btn  btn-sm  ms-1" onclick="eliminarLodos(<%= terminadoseco.getIdControlCalidad()%>)">
                                        <i  id="mipapelera"class="fas fa-trash"></i> <!-- Ícono de papelera -->
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




                <div class="form-group text-right  ml-1 mt-3 mb-2  mg-2">
                    <a href="ControladorProductoSeco?accion=listar" class="btn btn-success ml-2"
                       title="Actualizar Lista">
                        <!<!-- Icono Pagina Inicio -->
                        <i class="fas fa-list"></i> </a>

                    <!<!-- Icono Listar -->
                    <a href="index3.jsp" class="btn btn-warning"
                       title="Pagina Inicio">
                        <i class="bi bi-arrow-left-square-fill text-dark"></i> </a>
                </div>
            </div>



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

            <%--  <script src="./js/JS_PL.js" type="text/javascript"></script>  --%>
            <!-- Bootstrap-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Funsiones de Datable y Funsion para agregar Campos de Humedad  a lista -->
            <script src="./js/JS_PS.js" type="text/javascript"></script>


            <script>
                                        function updateCell(cell, id, column) {
                                            var newValue = cell.innerText;

                                            var xhr = new XMLHttpRequest();
                                            xhr.open("POST", "ControladorPs?accion=updatecell", true);
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

            <script>

                function eliminarLodos(id) {
                    swal({
                        title: "¿Estás seguro?",
                        text: "Una vez eliminado, no podrás recuperar este reporte.",
                        icon: "warning",
                        buttons: true,
                        dangerMode: true
                    }).then((willDelete) => {
                        if (willDelete) {
                            // Muestra el mensaje de éxito
                            Swal.fire({
                                position: "center", // Centra el mensaje
                                icon: "success",
                                title: "Reporte Eliminado con Éxito",
                                showConfirmButton: false,
                                timer: 1000,
                                customClass: {
                                    popup: 'swal2-popup-centered'
                                }
                            });

                            // Rediriges a la URL de eliminación después de 1.5 segundos (1500 milisegundos)
                            setTimeout(() => {
                                window.location.href = "ControladorPs?accion=eliminar2&id=" + id;
                            }, 1500);
                        } else {
                            swal("Operación cancelada.", {
                                icon: "error",
                                title: "Cancelado"
                            });
                        }
                    });
                }

            </script>


            <script>
                function toggleRowColor(checkbox) {
                    var row = checkbox.closest('tr');
                    if (checkbox.checked) {
                        row.classList.add('selected-row');
                    } else {
                        row.classList.remove('selected-row');
                    }
                }


            </script>

            <style>
                .selected-row {
                    background-color: #b6effb !important; /* Ensure this color stands out */
                }
            </style>


            <!-- Styles particular para Lista Seco-->
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

                /* Con la propiedad bottom y letf controlo l aubicacion de la info */
                .dataTables_paginate {
                    font-family: 'Roboto', sans-serif;
                    font-weight: 700;
                    bottom: -10%;
                    left:  100%;
                    margin-bottom: 5px; /* Ajusta según sea necesario */
                    color: red;
                }
                /* Move the buttons below the table */

                .dataTables_wrapper .dt-buttons {
                    position: absolute;
                    bottom: -50px;
                    left: 50%;
                    transform: translateX(-60%);
                    margin-bottom: 20px; /* Ajusta según sea necesario */
                }

                /* Estilos redondeados para los btn */

                .btn {
                    border-radius: 25px; /* Redondear los botones */
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



    </body>
</html>
