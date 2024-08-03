

<%@page import="Modelo.TipoProducto"%>
<%@page import="Modelo.TipoProducto"%>
<%@page import="Persistencia.DaoTipoProducto"%>
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Lista-Productos</title>

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
                    <ul class="navbar-nav mx-auto">   
                        <li class="nav-item">
                            <a class="nav-link active my-menu-item"  aria-current="page" href="##">
                                <span>
                                    REFERENCIAS 
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
                            <a class="nav-link active" aria-current="page" href="ControladorProductos?accion=listar">
                                <span   style="margin-left: 10px; border:none" class="btn btn-outline-light">
                                    <i class="fas fa-list"></i> <b>Listar</b></span>
                            </a>
                        </li>
                    </ul>
                    <span onclick="location.reload()" class="btn  btn-outline-light text-center" style="font-size: 20px; color: #ffcd39; margin-left: 25px; border:none">
                        <i class="bi bi-arrow-clockwise"></i>
                    </span>

                </div>
            </div>
        </nav>
        <br>
        <!--Barra de Navegacion -->

        <!-- Styles particular para Lista Seco-->
        <style>
            /* CSS personalizado para DataTables */
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
                bottom: 10%;
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

        <div class="col-12"> 
            <br>            
            <div class=" mt-5">
                <span  class="btn btn-primary text-warning ml-5 float-start ml-3 mb-2 " data-toggle="modal" data-target="#registroReferencia">
                    <i class="fas fa-plus"></i> 
                </span>

            </div>

            <div class=" table-container ml-3 md-3 table-responsive" >
                <table id="miTabla" class="table table-striped table-hover sticky-top">
                    <thead >
                        <tr>
                            <th>ID</th>
                            <th>REFERENCIA</th>                                                              
                            <th>TIPO</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Productos> listap = (List<Productos>) request.getAttribute("listaProductos");
                            for (Productos productos : listap) {%>
                        <tr>
                            <td><%= productos.getIdProductos()%></td>
                            <td><%= productos.getNombres_Productos()%></td>   
                            <td><%= DaoTipoProducto.obtenerNombreTipoProd(productos.getTipoProducto_idtipoProducto())%></td>                          

                            <td>
                                <div class="btn-group" role="group" aria-label="Acciones">
                                    <a href="ControladorProductos?accion=eliminar2&id=<%= productos.getIdProductos()%>"
                                       class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de Eliminar Producto?')">
                                        <i class="fas fa-trash"></i> <!-- Ícono de papelera -->
                                    </a>
                                    <a href="ControladorProductos?accion=editarProducto&id=<%= productos.getIdProductos()%>" class="btn btn-primary btn-sm">
                                        <i class="fas fa-pencil-alt"></i> <!-- Ícono de lápiz -->
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>


    

        <div class="form-group text-right  ml-1 mt-3 mb-2  mg-2">
            <a href="ControladorProductos?accion=listar" class="btn btn-success ml-2">
                <!-- Icono Pagina Inicio -->
                <i class="fas fa-list"></i> </a>

            <!-- Icono Listar -->
            <a href="index3.jsp" class="btn btn-warning">
                <i class="bi bi-arrow-left-square-fill text-dark"></i> </a>
        </div>
    </div>


    <!-- ***** Modal de Registro Productos****-->


    <div class="modal fade" id="registroReferencia" tabindex="-1" role="dialog" aria-labelledby="registroModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content" style="background-color: #F2F2F2;"> <!-- Cambia el color de fondo aquí -->
                <div class="modal-header">
                    <h5 class="modal-title text-primary  mx-auto" id="registroModalLabel">REGRISTRAR PRODUCTO</h5>
                    <!-- Botón de cerrar estático -->
                    <button type="button" class="close"  data-dismiss="modal" aria-label="Close" style="position: static;">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <!-- Formulario de Registro Productos -->
                    <form action="ControladorProductos" method="post">

                        <!-- Agrega los campos del formulario aquí -->

                        <div class="formulario__grupo">
                            <label for="variablesEspecificacion" class="formulario__label">                                    
                                <b>REFERENCIA</b></label>
                            <div class="formulario__grupo-input">
                                <input                                       
                                    type="text"
                                    class="formulario__input"
                                    id="referencia"   
                                    name="referencia" 
                                    placeholder="Ingrese Producto"
                                    autocomplete="off">                           
                            </div> 
                        </div> 

                        <div class="formulario__grupo">
                            <label class="formulario__label" for="tipoProducto">TIPO PRODUCTO</label>
                            <select
                                class="formulario__input" 
                                id="idtipo" 
                                name="idtipo"                                   
                                >
                                <option value="0">Seleccione Tipo</option>
                                <% List<TipoProducto> tipopro = DaoTipoProducto.listar();
                                    if (tipopro != null) {
                                        for (TipoProducto tipoproducto : tipopro) {
                                            if (tipoproducto != null) {%>
                                <option value="<%=tipoproducto.getIdtipoProducto()%>"><%=tipoproducto.getTipo()%></option>
                                <% }
                                        }
                                    }%>
                            </select>
                        </div>

                            <div class="formulario__grupo formulario__grupo-btn-enviar">
                            <button type="submit" name="accion" value="registrar" class="btn  btn-primary mt-4">
                                <i class="fas fa-save"></i> Guardar
                            </button>
                        </div>   
                            
                    </form>
                </div>
            </div>
        </div>
    </div>

    <style>
        .modal-dialog-centered {
            display: flex;
            align-items: center;
            min-height: calc(100% - 3.5rem);
        }
    </style>






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

    <script>

                                           $(document).ready(function () {
                                               $('#miTabla').DataTable({
                                                   "paging": true,
                                                   "pageLength": 7,
                                                   "language": {
                                                       "processing": "<span style='color: blue; font-size: 16px;'>Procesando...</span>",
                                                       "lengthMenu": "<span style='color: #09f; font-size: 18px;  position: absolute;  margin-left: -450px; '>Mostrar _MENU_ Registros </span>",
                                                       "zeroRecords": "No se Encontraron Resultados",
                                                       "emptyTable": "Ningún dato disponible en esta tabla",
                                                       "info": "<span style='color: #09f; font-size: 18px;'>Mostrando _START_ a _END_ de _TOTAL_ entradas</span>",
                                                       "infoEmpty": "<span style='color: #09f; font-size: 18px;'>Mostrando 0 a 0 de 0 entradas</span>",
                                                       "infoFiltered": "<span style='color: purple; font-size: 14px;'>(filtrado de un total de _MAX_ entradas)</span>",
                                                       "search": "<span style='color: #09f; font-size: 18px;'>Buscar:</span>",
                                                       "paginate": {
                                                           "first": "Primero",
                                                           "last": "Último",
                                                           "next": "Siguiente",
                                                           "previous": "Anterior"
                                                       },
                                                       "aria": {
                                                           "sortAscending": ": Activar para ordenar la columna ascendente",
                                                           "sortDescending": ": Activar para ordenar la columna descendente"
                                                       }
                                                   },
                                                   "scrollX": false
                                               });
                                           });

    </script>






</body>
</html>
