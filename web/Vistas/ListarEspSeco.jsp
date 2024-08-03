

<%@page import="Persistencia.DaoEspecificacionesSeco"%>
<%@page import="Persistencia.DaoEspecificaciones"%>
<%@page import="Modelo.EspecificacionesSeco"%>
<%@page import="Modelo.EspecificacionesSeco"%>
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
        <title>Lista-Especificacion-Seco</title>

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
                    font-family: 'Roboto', sans-serif;
                    font-weight: 700;
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
                                    ESPECIFICACIONES SECO
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
                            <a class="nav-link active" aria-current="page" href="ControladorEspSeco?accion=listar">
                                <span   style="margin-left: 10px; border:none" class="btn btn-outline-light">
                                    <i class="fas fa-list"></i> <b>Listar</b></span>
                            </a>
                        </li>
                    </ul>
                    <span onclick="location.reload()" class="btn  btn-outline-light  " style="font-size: 20px; color: #ffcd39; margin-left: 25px; border:none">
                        <i class="bi bi-arrow-clockwise"></i>
                    </span>

                </div>
            </div>
        </nav>

        <!--Barra de Navegacion -->

        <style>
            .campo-invalido {
                border: 1px solid red; /* Cambia el borde a rojo para resaltar el campo */
                background-color: #ffcccc; /* Cambia el fondo a un tono rojo claro */
            }
        </style>

        <div class="col-12"> 
            <br> 
            <br> 

            <div class=" mt-5">

                <a href="ControladorEspSeco?accion=add" 
                   class=" btn btn-warning text-primary ml-3 mb-2 float-start">           
                    <i class="fas fa-plus"></i>
                </a>
            </div>

            <div class=" table-container ml-3 md-3 table-responsive" >
                <table id="miTabla" class="table table-striped table-hover sticky-top">
                    <thead >
                        <tr>
                            <th>ID</th>
                              <th style="color:  #ffcd39">
                                <b>REFERENCIA</b></th>                 
                            <th style="color: #ffcd39">
                                <b>CLIENTE</b></th>                                   
                            <th>Caract # 1</th> 
                            <th> Rango </th> 
                            <th>Caract # 2</th> 
                            <th>Rango</th> 
                            <th>Caract # 3</th> 
                            <th>Rango</th> 
                            <th>Caract # 4</th> 
                            <th>Rango</th> 
                            <th>Caract # 5</th> 
                            <th>Rango</th> 
                            <th>Caract # 6</th> 
                            <th>Rango</th> 
                            <th>Caract # 7</th> 
                            <th>Rango</th> 
                            <th>Caract # 8</th> 
                            <th>Rango</th> 
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<EspecificacionesSeco> Lista = (List<EspecificacionesSeco>) request.getAttribute("listaEspcif");
                            for (EspecificacionesSeco especificaciones : Lista) {%>  

                    <td><%= especificaciones.getIdespecificaciones()%></td>
                    <td><%= DaoProductos.obtenerNombreProducto(especificaciones.getIdProductos())%></td>                    
                    <td><%= DaoEspecificacionesSeco.obtenerNombreclientes(especificaciones.getIdclientes())%></td>                       
                    <td><%= especificaciones.getVariableEsp1()%></td>
                    <td><%= especificaciones.getRango1()%></td>
                    <td><%= especificaciones.getVariableEsp2()%></td>
                    <td><%= especificaciones.getRango2()%></td>
                    <td><%= especificaciones.getVariableEsp3()%></td>
                    <td><%= especificaciones.getRango3()%></td>
                    <td><%= especificaciones.getVariableEsp4()%></td>
                    <td><%= especificaciones.getRango4()%></td>
                    <td><%= especificaciones.getVariableEsp5()%></td>
                    <td><%= especificaciones.getRango5()%></td>
                    <td><%= especificaciones.getVariableEsp6()%></td>
                    <td><%= especificaciones.getRango6()%></td>
                    <td><%= especificaciones.getVariableEsp7()%></td>
                    <td><%= especificaciones.getRango7()%></td>
                    <td><%= especificaciones.getVariableEsp8()%></td>
                    <td><%= especificaciones.getRango8()%></td>

                    <td>
                        <div class="btn-group" role="group" aria-label="Acciones">

                            <a href="ControladorEspSeco?accion=eliminar&id=<%= especificaciones.getIdespecificaciones()%>"
                               class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?')">
                                <i class="fas fa-trash"></i> <!-- Ícono de papelera -->

                                <!--Boton Eliminar Alert-->
                                <!--input type="hidden" class="idp" value="<--%= clientes.getIdclientes()%>">
                                <a href="#" class="btn btnDelete btn-danger btn-sm" data-id="<--%= clientes.getIdclientes()%>">
                                    <i class="fas fa-trash"></i> 
                                </a-->

                                <%-- <a href="#" class="btn btn-danger btn-sm" onclick="eliminarCliente(<%= especificaciones.getIdespecificaciones()%>)">
                                    <i class="fas fa-trash"></i> <!-- Ícono de papelera -->
                                </a--%>

                                <a href="ControladorEspSeco?accion=editarEspecif&id=<%= especificaciones.getIdespecificaciones()%>" 
                                   class="btn btn-primary btn-sm">
                                    <i class="fas fa-pencil-alt"></i> <!-- Ícono de lápiz -->
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
            </diV>
            
        </div>

        <h1>${mensaje}</h1>


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
    <!-- DataTables Spanish Language -->
    <script src="https://cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json"></script>

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

    <script src="./js/JS_ESPECIFICACIONES.js" type="text/javascript"></script>






</body>
</html>
