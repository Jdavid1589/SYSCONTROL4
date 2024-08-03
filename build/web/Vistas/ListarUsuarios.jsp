
<%@page import="Modelo.Perfil"%>
<%@page import="java.util.List"%>
<%@page import="Persistencia.DaoPerfil"%>
<%@page import="Persistencia.DaoDocumento"%>
<%@page import="Persistencia.DaoUsuarios"%>
<%@page import="Modelo.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Usuarios</title>
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


                    <ul class="navbar-nav ml-3 me-auto">  
                        <form class="navbar-nav ms-auto ml-auto" role="search">
                            <input class="formulario__input " type="search" name="txtbuscar" placeholder="Buscar Auxiliar, CC" aria-label="Buscar">
                            <button  type="submit" name="accion" value="buscar" class="btn btn-warning ml-1">Buscar</button>
                        </form>

                    </ul>
                    <ul class="navbar-nav mx-auto">   
                        <li class="nav-item">
                            <a class="nav-link active my-menu-item"  aria-current="page" href="##">
                                <span>
                                    USUARIOS
                                </span>
                            </a>
                        </li>
                    </ul>

                    <ul class="navbar-nav mb-3 mb-lg-0 float-start ">   

                        <li class="nav-item ">
                            <a class="nav-link active"  aria-current="page" href="./index3.jsp"><b>
                                    <span  style="margin-left: 10px; border:none" class="btn btn-outline-light">
                                        <i class="bi bi-arrow-left-square-fill text-dark"></i> <b> Inicio </b>
                                    </span>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link active"  aria-current="page" href="ControladorUsuarios?accion=listar""><b>
                                    <span  style="margin-left: 10px; border:none" class="btn btn-outline-light">
                                        <i class="bi bi-arrow-left-square-fill text-dark"></i> <b> Listar </b>
                                    </span>
                            </a>
                        </li>                  

                    </ul>


                </div>
            </div>
        </nav>
        <!--Barra de Navegacion -->

        <div class="row " style=" padding: 15px 0; ">                   

            <div class="card col-sm-4 mb-4  mt-5 sticky-top">
                <main>


                    <h4>FORMULARIO DE REGISTRO</h4> 

                    <form id="miform"  action="ControladorUsuarios" method="POST" autocomplete="off" onsubmit="return validarFormulario();" class="custom-form">

                        <div class="row">
                            <div class="col-md-6 ">

                                <!-- Grupo: Nombres -->
                                <div class="formulario__grupo" id="grupo__Nombres">
                                    <label class="formulario__label " for="nombres" >Nombres</label>
                                    <input type="text" class="formulario__input" 
                                           value="${User.getNombres_apellido()}"  
                                           id="nombres" 
                                           name="nombres_apellido"
                                           placeholder="Ingrese Nombres">
                                </div>                           

                                <!-- Grupo: Telefono -->
                                <div class="formulario__grupo" id="grupo__telefono">
                                    <label class="formulario__label" for="telefono"># Teléfono</label>
                                    <input type="text" class="formulario__input"
                                           value="${User.getNumero_Telefono()}" 
                                           id="telefono" 
                                           name="numeroTelefono"
                                           placeholder="Ingrese Telefono">
                                </div>

                                <!-- Grupo: Correo -->
                                <div class="formulario__grupo" id="grupo__telefono">
                                    <label class="formulario__label" for="correo">Correo</label>
                                    <input type="email" class="formulario__input" 
                                           id="correo" 
                                           value="${User.getCorreo()}" 
                                           name="correo" 
                                           placeholder="Ingrese Correo">
                                </div>

                            </div>
                            <div class="col-md-6">        

                                <!-- Grupo: User -->
                                <div class="formulario__grupo" id="grupo__telefono">
                                    <label class="formulario__label" for="usuario">Usuario</label>
                                    <input type="text" class="formulario__input"
                                           id="usuario" 
                                           value="${User.getUsuario()}" 
                                           name="usuario"
                                           placeholder="Ingrese Usuario">
                                </div>

                                <!-- Grupo: Clave -->
                                <div class="formulario__grupo" id="grupo__telefono">
                                    <label class="formulario__label" for="clave">Clave</label>
                                    <input type="password" class="formulario__input" 
                                           id="clave" 
                                           value="${User.getClave()}" 
                                           name="clave"
                                           placeholder="Ingrese Clave">
                                </div>



                                <!-- Nuevo Select datalist-->

                                <!-- Grupo: Perfil -->
                                <div class="formulario__grupo" id="grupo__telefono">
                                    <label class="formulario__label" for="tipoPerfil">Perfil</label>
                                    <input list="perfiles" class="formulario__input" id="tipoPerfil" name="perfil_nombre">
                                    <datalist id="perfiles">
                                        <option value="0">Seleccione perfil</option>
                                        <% List<Perfil> perfiles = DaoPerfil.listar();
                                            if (perfiles != null) {
                                                for (Perfil perfil : perfiles) {
                                                    if (perfil != null) {%>
                                        <option value="<%=perfil.getTipo_Perfil()%>" data-id="<%=perfil.getIdperfil()%>"><%=perfil.getTipo_Perfil()%></option>
                                        <% }
                                                }
                                            }%>
                                    </datalist>
                                    <!-- Campo oculto para almacenar el ID del perfil -->
                                    <input type="hidden" id="perfil_idperfil" name="perfil_idperfil">
                                </div>

                                <script>
                                    // Obtener el valor del data-id cuando se seleccione una opción
                                    document.getElementById('tipoPerfil').addEventListener('input', function () {
                                        var selectedOption = document.querySelector('#perfiles option[value="' + this.value + '"]');
                                        if (selectedOption) {
                                            // Establecer el valor del data-id en el campo oculto
                                            document.getElementById('perfil_idperfil').value = selectedOption.getAttribute('data-id');
                                        }
                                    });
                                </script>

                            </div>
                        </div>




                        <!-- Grupo: Botones -->
                        <fieldset class="formulario__grupo-btn-enviar">
                            <button      type="submit" name="accion" value="registrar" class="btn btn-success">
                                Registrar
                                <i class="fas fa-save" style="color: #000;"></i>
                            </button>
                            <button   type="submit" name="accion" value="actualizar" class="btn btn-warning">
                                Actualizar
                                <i class="bi bi-arrow-repeat"></i>
                            </button>
                            <a href="ControladorUsuarios?accion=listar" class="btn btn-secondary">
                                Cancelar
                                <i class="bi bi-x-lg"></i>
                            </a>
                        </fieldset>    


                    </form>
                </main>

            </div>   

            <div class="col-sm-8 mb-4 mt-5  ">
                <h4>LISTA USUARIOS</h4> 
                 <div class="table-container ml-3 md-3 table-responsive pagination-container" id="paginationContainer">
                    <table id="miTabla" class="table table-striped table-hover sticky-top">
                        <thead >
                            <tr>
                                <th>ID</th>
                                <th>Nombres</th>                       
                                <th>Teléfono</th>
                                <th>Correo</th>
                                <th>Usuario</th>
                                <th>Clave</th>
                                <th>Perfil</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Usuarios> Lista = (List<Usuarios>) request.getAttribute("listaUsuarios");
                                for (Usuarios usuarios : Lista) {%>
                            <tr>
                                <td><%= usuarios.getIdUsuarios()%></td>
                                <td><%= usuarios.getNombres_apellido()%></td>                           
                                <td><%= usuarios.getNumero_Telefono()%></td>
                                <td><%= usuarios.getCorreo()%></td>
                                <td><%= usuarios.getUsuario()%></td>
                                <td><%= usuarios.getClave()%></td>
                                <td><%= DaoPerfil.obtenerNombrePerfil(usuarios.getPerfil_idperfil())%></td>


                                <td>
                                    <div class="btn-group" role="group" aria-label="Acciones">

                                        <%--  <a href="ControladorUsuarios?accion=eliminar&id=<%= usuarios.getIdUsuarios()%>"
                                           class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?')">
                                            <i class="fas fa-trash"></i> <!-- Ícono de papelera -->
                                        </a>--%>

                                        <!--Boton Eliminar Alert-->                                    
                                        <a href="#" class="btn btn-danger btn-sm" onclick="eliminarUsuario(<%= usuarios.getIdUsuarios()%>)">
                                            <i class="fas fa-trash"></i> <!-- Ícono de papelera -->
                                        </a>


                                        <a href="ControladorUsuarios?accion=editarUsu&id=<%= usuarios.getIdUsuarios()%>" class="btn btn-primary btn-sm">
                                            <i class="fas fa-pencil-alt"></i> <!-- Ícono de lápiz -->
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
                <div class="dataTable_bottom">
                    <div class="dataTables_info"></div>
                    <div class="dataTables_paginate"></div>
                </div>
            </div>
        </div>   

        <h1>${mensaje}</h1>
    </div>


    <!-- Jquery-3.5.1 sirve para ejecutar funsion dezplazamiento dentro de la tabla -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"
    ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"
    ></script>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script><%--lo de las alertas--%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Alerta Sweet Alert  -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- For alert-style pop-up messages -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> <!-- For AJAX functionality -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> <!-- For AJAX functionality -->
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


    <script src="./js/JS.User.js" type="text/javascript"></script>


    <style>

        /* Estilos redondeados para los btn */

        .btn {
            border-radius: 20px; /* Redondear los botones */
        }

        tbody tr {
            position: sticky;
            top: 0;
            font-family: 'Roboto', sans-serif;
            font-weight: bold;
            color: #ffffff; /* Cambia esto al color de texto deseado */
            border-right: 2px solid #99ff99;
            color: #09f;
            text-align-last:  center;

        }


    </style>

</body>
</html>

