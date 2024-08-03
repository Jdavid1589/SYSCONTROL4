

<%@page import="Modelo.EspecificacionesSeco"%>
<%@page import="Persistencia.DaoEspecificacionesSeco"%>
<%@page import="Modelo.Especificaciones"%>
<%@page import="Persistencia.DaoConsecutivo"%>
<%@page import="Modelo.Usuarios"%>
<%@page import="Modelo.Clientes"%>
<%@page import="Modelo.Productos"%>
<%@page import="Persistencia.DaoEspecificaciones"%>
<%@page import="Persistencia.DaoUsuarios"%>
<%@page import="Persistencia.DaoClientes"%>
<%@page import="Persistencia.DaoProductos"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Consecutivo"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Consecutivo</title>


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
                <a class="navbar-brand" href="#"></a>
                <img src="./Vistas/Imagenes/MI.jpg" alt="Logo" style="float: left; width: 90px;" />
                <button 
                    class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">

                    <ul class="navbar-nav ms-auto" >   
                        <li class="nav-item" >
                            <a class="nav-link active my-menu-item"  aria-current="page" href="##">
                                <span >
                                    LISTA CONSECUTIVO
                                </span>
                            </a>
                        </li>
                    </ul>
                    <ul class="navbar-nav mb-3 mb-lg-0 float-start ms-auto">   
                        <li class="nav-item ">
                            <a class="nav-link active my-menu-item" aria-current="page" href="./index3.jsp"><b>
                                    <span  style="margin-left: 10px; border:none; font-size: 16px" class="btn btn-outline-light">
                                        <i class="bi bi-arrow-left-square-fill text-dark"></i> <b> INICIO </b>
                                    </span>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link active my-menu-item" aria-current="page" href="ControladorConsecutivo?accion=Listar2"><b>
                                    <span  style="margin-left: 10px; border:none; font-size: 16px" class="btn btn-outline-light">
                                        <i class="fas fa-list"></i> <b>LISTAR </b>
                                    </span>
                            </a>
                        </li>
                    </ul>

                    <span onclick="location.reload()" class="btn  btn-outline-light  " style="font-size: 20px; color: #ffcd39; margin-left: 25px; border:none">
                        <i class="bi bi-arrow-clockwise"></i>
                    </span>

                </div>
            </div>
        </nav>

        <!-- ESTILOS CSS -->  
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
        <style>
            .selected-row {
                background-color: #b6effb !important; /* Ensure this color stands out */
            }
        </style>
        <!-- Estilos Tabla  -->
        <style>
            .th__Ref{
                font-size: 10px;

            }

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


        <br>       

        <div  style="margin-top:50px; margin-bottom: ">
            <br>
            <span  class="btn btn-primary text-warning ml-5 float-start " data-toggle="modal" data-target="#registroCosecutivo">
                <i class="fas fa-plus"></i> 
            </span>
        </div>

        <!-- Inicio Tabla Listar -->  
        <div class="col-sm-12 mb-4 sticky-top" style="margin-top: 60px">
            <div class="table-container ml-3 md-3 table-responsive pagination-container" id="paginationContainer">             
                <table id="miTabla" class="table table-striped table-hover sticky-top">              

                    <thead>
                        <tr>
                            <th>Select</th>
                            <th>Consecutivo</th>
                            <th id="th_"># Remision</th>
                            <th>Referencia-Cliente</th>
                            <th>Cliente Final</th>
                            <th id="th_">Lote</th>
                            <th>Fecha</th>
                            <th>Fecha Prod</th>                                                  
                            <th id="th_">Cant Material</th>                          
                            <th>Auxiliar</th>                                                                         
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Consecutivo> Lista = (List<Consecutivo>) request.getAttribute("listaConsecutivo");

                            for (Consecutivo consecutivo : Lista) {
                                int idConsecutivo = consecutivo.getIdconsecutivo();
                        %>
                        <tr>
                            <td><input type="checkbox" name="selectConsecutivo" value="<%= idConsecutivo%>" class="selectCheckbox" onclick="toggleRowColor(this)"></td>
                            <td><%= String.format("%04d", consecutivo.getIdconsecutivo())%></td>
                            <td contenteditable="true" onblur="updateCell(this, '<%= idConsecutivo%>', 'nroRemision')">
                                <strong><%= consecutivo.getNroRemision()%></strong>
                            </td>
                            <td><%= DaoProductos.obtreferenciacliente(consecutivo.getIdEspecificaciones())%></td> 
                            <td contenteditable="true" onblur="updateCell(this, '<%= idConsecutivo%>', 'cliente_NN')">
                                <strong><%= consecutivo.getCliente_NN()%></strong>
                            </td>
                            <td contenteditable="true" onblur="updateCell(this, '<%= idConsecutivo%>', 'lote')">
                                <strong><%= consecutivo.getLote()%></strong>
                            </td>
                            <td><%= consecutivo.getFechaCertificado()%></td>
                            <td><%= consecutivo.getFechaProduccion()%></td>
                            <td contenteditable="true" onblur="updateCell(this, '<%= idConsecutivo%>', 'cantidadMaterial')">
                                <strong><%= consecutivo.getCantidadMaterial()%></strong>
                            </td>
                            <td><%= DaoUsuarios.obtenerNombreUsuario(consecutivo.getIdUsuarios())%></td>  
                            <td>
                                <div class="btn-group" role="group" aria-label="Acciones">
                                    <a href="ControladorConsecutivo?accion=editarConsecutivo2&id=<%= consecutivo.getIdconsecutivo()%>" class="btn btn-sm ms-1">
                                        <i class="fas fa-pencil-alt" style="font-size: 20px; color: #09f"></i> <!-- Ícono de lápiz -->
                                    </a> 
                                </div>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
            <%--   <button type="button" class="btn btn-primary mt-3" onclick="printSelected()">Print Selected</button>--%>






            <div class="dataTable_bottom">
                <div class="dataTables_info"></div>
                <div class="dataTables_paginate"></div>
            </div>

        </div>




        <!-- ***** Modal de Registro Consecutivo****-->


        <div class="modal fade" id="registroCosecutivo" tabindex="-1" role="dialog" aria-labelledby="registroModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document"> <!-- Cambia el tamaño del modal aquí -->

                <div class="modal-content" style="background-color: #F2F2F2;"> <!-- Cambia el color de fondo aquí -->
                    <div class="modal-header">
                        <h5 class="modal-title text-primary  mx-auto" id="registroModalLabel">REGRISTRAR CONSECUTIVO</h5>
                        <!-- Botón de cerrar estático -->
                        <button type="button" class="close"  data-dismiss="modal" aria-label="Close" style="position: static;">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <!-- Formulario de Registro Productos -->
                        <form id="miform2"  action="ControladorConsecutivo"  autocomplete="off" method="POST" onsubmit="return validarFormulario()"  class="custom-form">         
                            <div class="row">
                                <div class="col-md-6 ">

                                    <div class="formulario__grupo" id="grupo__tanque">
                                        <label class="formulario__label" for="idespecificaciones"> Referencia-Cliente</label>
                                        <select class="formulario__input" 
                                                style="border: 2px solid #ffdf7e;"  
                                                id="idespecificaciones"  
                                                value="${Consec.getIdEspecificaciones()}" 
                                                name="idespecificaciones"   >
                                            <option value="0" >Seleccione Referencia</option>
                                            <%for (EspecificacionesSeco especificaciones : DaoEspecificacionesSeco.listarPS_PL()) {
                                                    if (especificaciones != null) {
                                            %> <option  value="<%=especificaciones.getIdespecificaciones()%>"><%=DaoEspecificacionesSeco.obtReferenciaCliente(especificaciones.getIdespecificaciones())%></option>
                                            <% }
                                                } %>
                                        </select>
                                    </div>                            
                                    <!-- Grupo: Remision -->
                                    <div class="formulario__grupo" id="grupo__clienteFinal">
                                        <label class="formulario__label" for="cliente_NN"  class="text-left">Cliente Final</label>
                                        <input type="text" 
                                               class="formulario__input"  
                                               value="${Consec.getCliente_NN()}" 
                                               id="cliente_NN" 
                                               name="cliente_NN" 
                                               placeholder="Ingrese Cliente ">
                                    </div>
                                    <!-- Grupo: Remision -->
                                    <div class="formulario__grupo" id="grupo__tanque">
                                        <label class="formulario__label" for="nroRemision"  class="text-left"># Remision</label>
                                        <input type="text" 
                                               class="formulario__input"  
                                               value="${Consec.getNroRemision()}" 
                                               id="nroRemision" 
                                               name="nroRemision" 
                                               placeholder="Ingrese # ">
                                    </div>
                                    <!-- Grupo: Lote --> 
                                    <div class="formulario__grupo" id="grupo__tanque">
                                        <label class="formulario__label" for="lote">Lote</label>
                                        <input type="text"
                                               class="formulario__input" 
                                               id="lote" 
                                               value="${Consec.getLote()}"
                                               name="lote" 
                                               placeholder="Ingrese Lote">
                                    </div>

                                    <!-- Etiquetas Flotantes -->
                                    <%--  <div class="form-floating">                             
                                         <input type="text" class="form-control" id="lote" placeholder="lote">
                                         <label for="lote">Lote</label>
                                     </div> --%>

                                </div>

                                <div class="col-md-6">

                                    <!-- Grupo: Fecha Registro --> 
                                    <div class="formulario__grupo" id="grupo__tanque">
                                        <label  class="formulario__label" for="fechaCertificado">Fecha Registro</label>
                                        <input type="date"
                                               class="formulario__input" 
                                               id="fechaCertificado"
                                               value="${Consec.getFechaCertificado()}"
                                               name="fechaCertificado" 
                                               placeholder="Ingrese Fecha">
                                    </div>
                                    <!-- Grupo: Fecha Prod --> 
                                    <div class="formulario__grupo" id="grupo__tanque">
                                        <label class="formulario__label" for="fechaProduccion">Fecha Produccion</label>
                                        <input type="date" 
                                               class="formulario__input"  
                                               id="fechaProduccion" 
                                               value="${Consec.getFechaProduccion()}" 
                                               name="fechaProduccion" 
                                               placeholder="Ingrese Fecha">
                                    </div>

                                    <!-- Grupo: Auxiliar -->
                                    <div class="formulario__grupo" id="grupo__tanque">
                                        <label class="formulario__label" for="idUsuarios"> Auxiliar</label>
                                        <select class="formulario__input" id="idUsuarios" style="border: 2px solid #ffdf7e;" 
                                                value="${Consec.getIdUsuarios()}" name="idUsuarios">
                                            <option value="0">Seleccione Aux</option>
                                            <% for (Usuarios usuarios : DaoUsuarios.listar()) {
                                                    if (usuarios != null) {%>
                                            <option  value="<%=usuarios.getIdUsuarios()%>"><%=usuarios.getNombres_apellido()%></option>
                                            <%   }
                                                }%>
                                        </select>
                                    </div>

                                    <!-- Campo de entrada para abrir modal -->
                                    <div class="formulario__grupo" id="grupo__tanque">
                                        <label class="formulario__label" for="cantidadMaterial">Cant Material</label>
                                        <div class="input-group">
                                            <input type="text" class="formulario__input"  id="cantidadMaterial" 
                                                   value="${Consec.getCantidadMaterial()}" name="cantidadMaterial"  placeholder="Ingrese Cant">
                                            <div class="input-group-append">
                                                <button
                                                    class="btn btn-sm" 
                                                    type="button"
                                                    onclick="abrirCalculadora()" >
                                                    <i class="fas fa-calculator"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <!-- Grupo: Botones -->
                            <fieldset class="formulario__grupo-btn-enviar">
                                <button type="submit" name="accion" value="RegistrarConsecutivo" class="btn btn-success">
                                    Registrar
                                    <i class="fas fa-save" style="color: #000;"></i>
                                </button>
                                <button type="submit" name="accion" value="actualizar"  class="btn btn-warning">
                                    Actualizar
                                    <i class="bi bi-arrow-repeat"></i>
                                </button>
                            </fieldset>

                            <!-- Grupo: Botones -->
                            <fieldset class="formulario__grupo-btn-enviar">
                                <a href="ControladorConsecutivo?accion=Listar3" class="btn btn-secondary">
                                    Cancelar
                                    <i class="bi bi-x-lg"></i>
                                </a>
                            </fieldset>

                        </form>
                    </div>
                </div>
            </div>
                                              <!-- Modal Calculadora-->
        <div class="modal fade" id="calculadoraModal" tabindex="-1" role="dialog" aria-labelledby="calculadoraModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="calculadoraModalLabel">Calculadora</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <!-- Agrega estos botones al cuerpo del modal -->
                    <div class="modal-body">
                        <label for="numero1">Cantidad Material:</label>
                        <input type="text" id="numero1" placeholder="Ingrese cantidad Material en kg" class="formulario__input" />

                        <label for="numero2">Divisor:</label>
                        <input type="text" placeholder="Ingrese Peso Saco (25 Kg)." id="numero2" class="formulario__input" />
                        <!--label for="numero2">Numeros(Separados por comas):</label>
                        <input type="text" placeholder="Numeros" id="numeros" class="form-control" /-->

                        <div class="mt-3">
                            <button type="button" class="btn btn-primary" onclick="calcular('sumar')">Sumar</button>
                            <button type="button" class="btn btn-primary" onclick="calcular('restar')">Restar</button>
                            <button type="button" class="btn btn-primary" onclick="calcular('multiplicar')">Multiplicar</button>
                            <button type="button" class="btn btn-warning" onclick="calcular('dividir')"><b>Dividir</b></button>
                        </div>
                    </div>

                    <!--div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div-->
                </div>
            </div>
        </div>
        </div>
      



        <!-- Jquery-3.5.1 sirve para ejecutar funsion dezplazamiento dentro de la tabla -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                crossorigin="anonymous"
        ></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" 
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
                integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
                integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                crossorigin="anonymous"
        ></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>  

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- For alert-style pop-up messages -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> <!-- For AJAX functionality -->
        <script src="./js/Funsiones2.js" type="text/javascript"></script>
        <script src="./js/Funsiones_Varias.js" type="text/javascript"></script>




        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>


        <!-- JS Funsiones Validar y DataTable -->
        <script src="./js/JS_Consecutivo.js" type="text/javascript"></script>


        <!-- Funsion para actualizar DESDE LA MISMA TABLA-->

        <script>
                                function updateCell(cell, id, column) {
                                    var newValue = cell.innerText;

                                    var xhr = new XMLHttpRequest();
                                    xhr.open("POST", "ControladorConsecutivo?accion=updatecell", true);
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
            function toggleRowColor(checkbox) {
                var row = checkbox.closest('tr');
                if (checkbox.checked) {
                    row.classList.add('selected-row');
                } else {
                    row.classList.remove('selected-row');
                }
            }


        </script>

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
                        {orderable: false, targets: [0, 2, 3, 4, 5, 6, 7, 8, 9, 10]},
                        {searchable: false, targets: [4, 5, 6, 7, 8, 9, 10]}
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

    </body>
</html>

