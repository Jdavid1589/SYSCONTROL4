

<%@page import="Modelo.VariablesPL"%>
<%@page import="Modelo.ReportePdfLodo"%>
<%@page import="Modelo.Variable"%>
<%@page import="Modelo.ReportePdfSeco"%>
<%@page import="java.util.List"%>
<%@page import="Persistencia.DaoClientes"%>
<%@page import="Persistencia.DaoDocumento"%>

<%@page import="Modelo.Clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PDF LODOS</title>

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
        <h1 style="text-align: center; color: #00ff00">${mensaje}</h1>

        <%--     <script>
            // Obtenemos el mensaje desde el servidor y lo asignamos a una variable en JavaScript
            var mensaje = "${mensaje}";

            // Mostramos el mensaje utilizando un alerta
            alert(mensaje);
        </script>--%>




        <!--Barra de Navegacion -->
        <nav class="navbar  navbar-expand-md navbar-dark border-3 fixed-top border-bottom ">
            <div class="container-fluid">
                <ul class="navbar-nav mb-3 mb-lg-0">
                    <img src="./Vistas/Imagenes/MI.jpg" alt="Logo" style="float: left; width: 90px;" />
                    <li class="nav-item">
                        <a class="nav-link active my-menu-item" aria-current="page" href="./index3.jsp">
                            <b>
                                <span style="margin-left: 10px; border:none; font-size: 16px" class="btn btn-outline-light">
                                    <i class="bi bi-arrow-left-square-fill text-dark"></i> <b>Inicio</b>
                                </span>
                            </b>
                        </a>
                    </li>
                    <li class="nav-item">
                        <%--   <a class="nav-link active" aria-current="page" href="ControladorClientes?accion=add">
                            <span  style="margin-left: 10px; border:none" class=" btn btn-outline-light ">
                                <i class="bi bi-plus-circle"></i> <b>Añadir</b> </span>
                        </a>--%>
                    </li>
                </ul>
                <div class="ms-auto">
                    <ul class="navbar-nav mb-3 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="ControladorPL?accion=listar">
                                <span style="margin-left: 10px; border:none; font-size: 16px" class="btn btn-outline-light">
                                    <i class="bi bi-arrow-left-square-fill text-dark"></i> <b>Lista Producto Lodo</b>
                                </span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--Barra de Navegacion -->

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



        </style>

        <div class="col-sm-12 mb-4 mt-3 sticky-top">
            <div class="container-fluid text-center" style="position: relative; top: -52px; ">

                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <br>
                        <h4 class="text-primary elegant-font mt-5 " style="font-weight: bold; font-size: 25px;">CERTIFICADOS GENERADOS - LODO !</h4>

                    </div>
                </div>
            </div>

            <div class=" table-container ml-3  table-responsive" >
                <table id="miTabla" class="table table-striped table-hover sticky-top">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Producto</th>                       
                            <th>Fecha </th>
                            <th>Cliente</th>
                            <th  id="th_"># Certificado</th>
                            <th>Num Remision  </th>
                            <th>Cant Kg</th>
                            <th>Lote</th>
                            <th>Solidos</th>
                            <th>Humedad</th>                           
                            <th>Densidad g/l</th>                           
                            <th>Densidad kg/gal</th>                           
                            <th>Visc cP</th>                           
                            <th>Visc Ku</th>                           
                            <th>UFC</th>                           
                            <th>T Est Microb</th>                           
                            <th>pH</th>                           
                            <th>% R325</th>                           
                            <th>AA</th>                           
                            <th>Br</th>                           
                            <th>Wh</th>                        
                            <th id="th_" > Brigh_Leneta </th>     
                            <th id="th_" > Wh_Leneta </th>     
                            <th>Dv50</th>                           
                            <th>Auxiliar</th>                           
                                <%--  <th id="th_" > Variable </th>     
                                <th>Variable</th>                           
                                <th>Variable</th>                           
                                <th>Variable</th>                           
                                <th>Variable</th>                           
                                <th>Variable</th>                           
                                <th>Variable</th>                           
                                <th>Variable</th>                           
                                <th>Variable</th>                           
                                <th>Variable</th>                           
                                <th>Variable</th>      
                                <th>Variable</th>                           
                                <th>Variable</th>      

                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>     
                            <th>Variable</th>                           
                            <th>Variable</th>     

                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>                           
                            <th>Variable</th>     --%>                      

                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>



                        <%
                            List<ReportePdfLodo> reportes = (List<ReportePdfLodo>) request.getAttribute("listaPdfLodo");
                            for (ReportePdfLodo reporte : reportes) {%>

                        <tr>

                            <td><%= reporte.getIdCertificadoLodo()%></td>
                            <td><%= reporte.getProducto()%></td>
                            <td><%= reporte.getFechaCertificado()%></td>                      
                            <td><%= reporte.getCliente()%></td>
                            <td><%= reporte.getNumCertificado()%></td>
                            <td><%= reporte.getNumRemision()%></td>
                            <td><%= reporte.getCantidadKg()%></td>
                            <td><%= reporte.getLote()%></td>
                            <td><%= reporte.getSolidos()%></td>
                            <td><%= reporte.getHumedad()%></td>
                            <td><%= reporte.getDensidadg()%></td>
                            <td><%= reporte.getDensidadkggal()%></td>
                            <td><%= reporte.getViscosidadCp()%></td>
                            <td><%= reporte.getViscosidadKu()%></td>
                            <td><%= reporte.getUfc()%></td>
                            <td><%= reporte.getUfcTiempo()%></td>
                            <td><%= reporte.getpH()%></td>
                            <td><%= reporte.getRetenido325()%></td>
                            <td><%= reporte.getAA()%></td>
                            <td><%= reporte.getBr()%></td>
                            <td><%= reporte.getWh()%></td>
                            <td><%= reporte.getBr_Leneta()%></td>
                            <td><%= reporte.getWh_Leneta()%></td>
                            <td><%= reporte.getDv50()%></td>
                            <td><%= reporte.getAuxiliar()%></td>

                            <!-- Celdas para las variables y sus rangos -->
                            <%--        <%
                                List<VariablesPL> variables = reporte.getVariablesPL(); // Obtener la lista de variables de pdfseco
                                for (VariablesPL variable : variables) {
                            %>
                            <td><%= variable.getTipo()%></td> <!-- Columna para el tipo de la variable -->
                            <td><%= variable.getRango()%></td> <!-- Columna para el rango de la variable -->
                            <td><%= variable.getMetodo()%></td> 
                            <%
                                }
                            %>--%>

                            <!-- Celda para las acciones -->
                            <td>
                                <div class="btn-group" role="group" aria-label="Acciones">
                                    <!-- Botones para las acciones -->
                                    <a href="ControladorReporteSeco?accion=eliminar&id=<%= reporte.getIdCertificadoLodo()%>"
                                       class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?')">
                                        <i class="fas fa-trash"></i> <!-- Ícono de papelera -->
                                    </a>
                                    <%--  <a href="#" class="btn btn-primary btn-sm">
                                        <i class="fas fa-pencil-alt"></i> <!-- Ícono de lápiz -->
                                    </a>--%>
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


            <!-- Styles particular para Lista Lodos-->
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

                    bottom: -15%;
                    left:  100%;
                    margin-bottom: 5px; /* Ajusta según sea necesario */
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

            <!-- Script Funsion  -->




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

            <script src="./js/JS_PDF_LODO.js" type="text/javascript"></script>


    </body>
</html>

