

<%@page import="Persistencia.DaoSeguimientos"%>
<%@page import="Modelo.Seguimientos"%>
<%@page import="java.util.Map"%>
<%@page import="Modelo.ControlSeco"%>
<%@page import="Persistencia.DaoEspecificaciones"%>
<%@page import="Modelo.Especificaciones"%>
<%@page import="Persistencia.DaoClientes"%>
<%@page import="Modelo.Clientes"%>
<%@page import="java.util.List"%>
<%@page import="Persistencia.DaoProductoSeco"%>

<%@page import="Modelo.Usuarios"%>
<%@page import="Modelo.Productos"%>
<%@page import="Persistencia.DaoProductos"%>


<%@page import="Persistencia.DaoUsuarios"%>


<%@page import="Modelo.Usuarios"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Calidad-Tdo-Lodo</title>

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">



        <link href="Vistas/Estilos_css/EstilosPL2.css" rel="stylesheet" type="text/css"/>



    </head>

    <body>

        <!--Barra de Navegacion -->
        <nav class="navbar  navbar-expand-md navbar-dark border-3 fixed-top border-bottom ">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"></a>
                <img src="./Vistas/Imagenes/MI.jpg"  alt="Logo" width="110px"/>
                <button 
                    class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse  " id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-3 mb-lg-0">   

                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="./index3.jsp">
                                <span  style="margin-left: 10px; border:none" class="btn btn-outline-light">
                                    <i class="bi bi-arrow-left-square-fill text-dark"></i><b> Inicio</b></span>
                            </a>

                        </li><li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="ControladorPL?accion=listar">
                                <span style="margin-left: 10px; border:none" class="btn btn-outline-light">
                                    <i <i class="fas fa-list"></i><b>  CANCELAR </b>
                                </span>
                            </a>

                        </li>

                    </ul>
                </div>
            </div>

        </nav>
        <main>
            <!-- Styles CSS Campo Invalido -->
            <style>
                .campo-invalido {
                    border: 1px solid red; /* Cambia el borde a rojo para resaltar el campo */

                    background-color: #ffcccc; /* Cambia el fondo a un tono rojo claro */
                }
            </style>


            <div class="container-fluid text-center" style="position: relative; top: -22px;">

                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <br>
                        <h4 class="text-primary elegant-font mt-5"><b>REGISTRAR PRODUCTO LODO</b></h4>

                    </div>
                </div>
            </div>

            <!-- Incio Formulario -->
            <form class="formulario" id="formulario"   autocomplete="off" onsubmit="return validarFormulario();" action="ControladorPL" method="post">

                <!-- Grupo: Fecha -->
                <div class="formulario__grupo" id="grupo__fecha">
                    <label class="formulario__label" for="fecha">Fecha</label>
                    <div class="formulario__grupo-input">
                        <input type="date" class="formulario__input" id="fecha" name="fecha" placeholder="%Solidos">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                </div>

                <!-- Grupo: Referencia -->
                <div class="formulario__grupo" id="grupo__producto">
                    <label class="formulario__label" for="producto"> Referencia</label>
                    <select   class="formulario__input"   id="producto" style="border: 2px solid #ffdf7e;" 
                              name="producto">
                        <option value="0">Seleccione Referencia</option>
                        <% for (Productos pr : DaoProductos.listarPL()) { %>
                        <% if (pr != null) {%>
                        <option value="<%= pr.getIdProductos()%>"><%= DaoProductos.obtenerNombreProducto(pr.getIdProductos())%></option>
                        <% } %>
                        <% }%>
                    </select>
                </div> 

                <!-- Grupo: Auxiliar -->
                <div class="formulario__grupo" id="grupo__Usuario">
                    <label  class="formulario__label" for="Usuarios"> Auxiliar</label>
                    <select
                        style="border: 2px solid #ffdf7e;"  
                        class="formulario__input" 
                        id="Usuarios"
                        name="idUsuarios"
                        >
                        <option value="0">Seleccione Aux</option>
                        <% for (Usuarios usuarios : DaoUsuarios.listar()) {
                                if (usuarios != null) {%>
                        <option  value="<%=usuarios.getIdUsuarios()%>"><%=usuarios.getNombres_apellido()%></option>
                        <%  }
                            }%>
                    </select>
                </div>


                <!-- Grupo: Seguimiento -->
                <div class="formulario__grupo" id="grupo__seguimiento">
                    <label class="formulario__label" for="idSeguimiento">Seguimiento</label>
                    <select 
                        style="border: 2px solid #ffdf7e;" 
                        class="formulario__input" 
                        id="idSeguimiento" 
                        name="txtSto" 
                        >
                        <option value="0">Seleccione Sto</option>
                        <% for (Seguimientos sto : DaoSeguimientos.listar()) {
                                if (sto != null) {%>
                        <option value="<%=sto.getIdSeguimientos()%>"><%=sto.getNumSeguimiento()%></option>
                        <% }
                            }%>
                    </select>
                </div>

                <!-- Grupo: Tanque -->
                <div class="formulario__grupo" id="grupo__tanque">
                    <label for="tanque" class="formulario__label">Tanque #</label>
                    <div class="formulario__grupo-input">
                        <input
                            autocomplete="on"
                            type="text"
                            class="formulario__input" 
                            name="tanque"
                            id="tanque"
                            placeholder="# Tanque">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>               
                </div>

                <!-- Grupo: Lote -->
                <div class="formulario__grupo" id="grupo__lote">
                    <label for="lote" class="formulario__label">Lote</label>
                    <div class="formulario__grupo-input">
                        <input 
                            type="text" 
                            class="formulario__input"
                            name="lote"
                            id="lote" 
                            placeholder="Lote">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>               
                </div>

                <!-- Grupo: Cant Kg -->
                <div class="formulario__grupo" id="grupo__Cantidadkg">
                    <label for="Cantidadkg" class="formulario__label">Cantidad_Kg</label>
                    <div class="formulario__grupo-input">
                        <input                      
                            type="text"
                            class="formulario__input"
                            name="Cantidadkg"
                            id="Cantidadkg"
                            placeholder="Cantidad kg">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>               
                </div>

                <!-- Grupo: Solidos -->
                <div class="formulario__grupo" id="grupo__solidos">
                    <label for="solidos" class="formulario__label">% Solidos</label>
                    <div class="formulario__grupo-input">
                        <input 
                            onkeyup="calcularHumedad(this);" 
                            type="text"
                            class="formulario__input" 
                            name="solidos" 
                            id="solidos"
                            placeholder="% Solidos">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error" id="error_solidos">Error! , Validar Dato Ingresado </p>
                </div>

                <!-- Grupo: Cant Humedad -->
                <div class="formulario__grupo" id="grupo__humedad">
                    <label for="humedad" class="formulario__label">Humedad</label>
                    <div class="formulario__grupo-input">
                        <input                      
                            type="text" 
                            class="formulario__input" 
                            name="humedad" 
                            id="humedad"
                            readonly="" 
                            placeholder="Humedad">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>               
                </div>

                <!-- Grupo: R325 -->
                <div class="formulario__grupo" id="grupo__r325">
                    <label for="r325" class="formulario__label">R325</label>
                    <div class="formulario__grupo-input">
                        <input 
                            type="text" 
                            class="formulario__input" 
                            name="r325"
                            id="r325" 
                            placeholder="% R325">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_r325">Error! , Validar Dato Ingresado</p>
                </div>

                <!-- Grupo: pH -->
                <div class="formulario__grupo" id="grupo__pH">
                    <label for="pH" class="formulario__label">pH</label>
                    <div class="formulario__grupo-input">
                        <input   
                            type="text" 
                            class="formulario__input" 
                            name="pH" 
                            id="pH" 
                            placeholder=" pH">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_pH">Error! , Validar Dato Ingresado</p>
                </div>

                <!-- Grupo: Brigh -->
                <div class="formulario__grupo" id="grupo__Brigh">
                    <label for="Brigh" class="formulario__label">Brigh-Pastilla</label>
                    <div class="formulario__grupo-input">
                        <input
                            type="text" 
                            class="formulario__input"
                            name="Brigh"
                            id="Brigh"
                            placeholder=" Brigh ">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div> 
                    <p class="formulario__input-error error" id="error_Brigh">Error! , Validar Dato Ingresado </p>              
                </div>

                <!-- Grupo: Wh -->
                <div class="formulario__grupo" id="grupo__Wh">
                    <label for="Wh" class="formulario__label">Wh-Pastilla</label>
                    <div class="formulario__grupo-input">
                        <input                     
                            type="text" 
                            class="formulario__input" 
                            name="Wh"
                            id="Wh"
                            placeholder=" Wh ">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div> 
                    <p class="formulario__input-error error" id="error_Wh">Error! , Validar Dato Ingresado</p>              
                </div>

                <!-- Grupo: Brigh Leneta -->
                <div class="formulario__grupo" id="grupo__Brigh_Leneta">
                    <label style="color:   #09f; font-weight: bold" for="Brigh_Leneta" class="formulario__label">Brigh-Leneta</label>
                    <div class="formulario__grupo-input">
                        <input              
                            style="background:  #9fcdff"
                            type="text"
                            class="formulario__input"
                            name="Brigh_Leneta"
                            id="Brigh_Leneta"
                            placeholder=" Brigh-Leneta ">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div> 
                    <p class="formulario__input-error error" id="error_Brigh_Leneta">Error! , Validar Dato Ingresado </p>              
                </div>

                <!-- Grupo: Wh Leneta -->
                <div class="formulario__grupo" id="grupo__Wh_Leneta">
                    <label style="color:   #09f; font-weight: bold" for="Wh_Leneta" class="formulario__label">Wh-Leneta</label>
                    <div class="formulario__grupo-input">
                        <input           
                            style="background:  #9fcdff"
                            type="text" 
                            class="formulario__input" 
                            name="Wh_Leneta" 
                            id="Wh_Leneta"
                            placeholder=" Wh-Leneta ">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div> 
                    <p class="formulario__input-error error" id="error_Wh_Leneta">Error! , Validar Dato Ingresado </p>              
                </div>

                <!-- Grupo: cP -->
                <div class="formulario__grupo" id="grupo__cP">
                    <label for="cP" class="formulario__label">cP</label>
                    <div class="formulario__grupo-input">
                        <input                   
                            type="text"
                            class="formulario__input"
                            name="cP" 
                            id="cP"
                            placeholder=" cP">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_cP">Error! , Validar Dato Ingresado</p>
                </div>

                <!-- Grupo: KU -->
                <div class="formulario__grupo" id="grupo__ku">
                    <label for="ku" class="formulario__label">Ku</label>
                    <div class="formulario__grupo-input">
                        <input                  
                            type="text"
                            class="formulario__input" 
                            name="ku" 
                            id="ku"
                            placeholder=" ku ">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_ku">Error! , Validar Dato Ingresado</p>
                </div>

                <!-- Grupo: Dv50 -->
                <div class="formulario__grupo" id="grupo__Dv50">
                    <label for="Dv50" class="formulario__label">Dv50</label>
                    <div class="formulario__grupo-input">
                        <input                           
                            type="text" 
                            class="formulario__input"
                            name="Dv50"
                            id="Dv50" 
                            placeholder=" Dv50">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div> 
                    <p class="formulario__input-error error" id="error_Dv50">Error! , Validar Dato Ingresado</p>              
                </div>

                <!-- Grupo: Dv90 -->
                <div class="formulario__grupo" id="grupo__Dv90">
                    <label for="Dv90" class="formulario__label">Dv90</label>
                    <div class="formulario__grupo-input">
                        <input                       
                            type="text"
                            class="formulario__input"
                            name="Dv90"
                            id="Dv90"
                            placeholder=" Dv90">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div> 
                    <p class="formulario__input-error error" id="error_Dv90">Error! , Validar Dato Ingresado </p>              
                </div>

                <!-- Grupo: AbsAceite -->
                <div class="formulario__grupo" id="grupo__AbsAceite">
                    <label for="AbsAceite" class="formulario__label">Abs_Aceite</label>
                    <div class="formulario__grupo-input">
                        <input  
                            type="text" 
                            class="formulario__input"
                            name="AbsAceite"
                            id="AbsAceite"
                            placeholder=" Absorcion Aceite">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div> 
                    <p class="formulario__input-error error" id="error_AbsAceite">El AbsAceite debe estar entre </p>              
                </div>

                <!-- Grupo: kgAgua -->
                <div class="formulario__grupo" id="grupo__kgAgua">
                    <label for="kgAgua" class="formulario__label">Kg_Agua</label>
                    <div class="formulario__grupo-input">
                        <input 
                            type="text"
                            class="formulario__input"
                            name="kgAgua"
                            id="kgAgua" 
                            placeholder="  kg Agua "
                            >
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div> 
                    <p class="formulario__input-error error" id="error_kgAgua">El kgAgua debe estar entre </p>              
                </div>

                <!-- Grupo: dispersante -->
                <div class="formulario__grupo" id="grupo__dispersante">
                    <label for="dispersante" class="formulario__label">Dispersante</label>
                    <div class="formulario__grupo-input">
                        <input
                            type="text" 
                            class="formulario__input" 
                            name="dispersante" 
                            id="dispersante"
                            placeholder="Kg Dispersante"
                            >
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div> 
                    <p class="formulario__input-error error" id="error_dispersante">El dispersante debe estar entre </p>              
                </div>

                <!-- Grupo: espesante -->
                <div class="formulario__grupo" id="grupo__espesante">
                    <label for="espesante" class="formulario__label">Espesante</label>
                    <div class="formulario__grupo-input">
                        <input
                            type="text" 
                            class="formulario__input" 
                            name="espesante" 
                            id="espesante"
                            placeholder="Kg Espesante">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div> 
                    <p class="formulario__input-error error" id="error_espesante">El espesante debe estar entre </p>              
                </div>

                <!-- Grupo: Biocida -->
                <div class="formulario__grupo" id="grupo__Biocidad">
                    <label for="Biocidad" class="formulario__label">Biocida (Lt)</label>
                    <div class="formulario__grupo-input">
                        <input 
                            type="text" 
                            class="formulario__input" 
                            name="Biocidad" 
                            id="Biocidad"
                            placeholder=" Lt Biocida">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div> 
                    <p class="formulario__input-error error" id="error_Biocidad">El Biocidad debe estar entre </p>              
                </div>

                <!-- Grupo: % Biocida -->
                <div class="formulario__grupo" id="grupo__dosisBiocidad">
                    <label for="dosisBiocidad" class="formulario__label">% Biocida</label>
                    <div class="formulario__grupo-input">
                        <input
                            type="text" 
                            class="formulario__input" 
                            name="dosisBiocidad" 
                            id="dosisBiocidad"
                            placeholder="%  de Biocida">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div> 
                    <p class="formulario__input-error error" id="error_dosisBiocidad">La  Dosis de Biocidad debe estar entre </p>              
                </div>

                <!-- Grupo: kg Sodio -->
                <div class="formulario__grupo" id="grupo__kgSodio">
                    <label for="kgSodio" class="formulario__label">Kg_Sodio</label>
                    <div class="formulario__grupo-input">
                        <input 
                            type="text" 
                            class="formulario__input"
                            name="kgSodio"
                            id="kgSodio"
                            placeholder=" Kg  Carbonato de Sodio"
                            >
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div> 
                    <p class="formulario__input-error error" id="error_kgSodio">El kgSodio debe estar entre </p>              
                </div>

                <!-- Grupo: comentarios -->
                <!-- Este eera el campo de cometarios y se dejo como contramuestra -->
                <div class="formulario__grupo" id="grupo__Contramuestra">
                    <label for="comentarios" class="formulario__label"># Contramuestra</label>
                    <div class="formulario__grupo-input">
                        <input
                            type="text" 
                            class="formulario__input"
                            name="comentarios"
                            id="comentarios" 
                            placeholder=" # Contramuestra">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div> 
                    <p class="formulario__input-error error" id="error_comentarios">El comentarios debe estar entre </p>              
                </div>

                <!-- Grupo: observacion -->
                <div class="formulario__grupo" id="grupo__observacion">
                    <label for="observacion" class="formulario__label">Observacion</label>
                    <div class="formulario__grupo-input">
                        <input
                            type="text" 
                            class="formulario__input"
                            name="observacion" 
                            id="observacion"
                            placeholder=" Observacion">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div> 
                    <p class="formulario__input-error error" id="error_observacion">El observacion debe estar entre </p>              
                </div>

                <!-- Grupo: CONSECUTIVO -->
                <div class="formulario__grupo" id="grupo__Consecutivo">
                    <label  style="color: #34ce57" for="Consecutivo" class="formulario__label"> # CONSECUTIVO</label>
                    <div class="formulario__grupo-input">
                        <input 
                            style="background:  #ffdf7e; font-weight: 700" 
                            type="text" 
                            class="formulario__input"
                            name="Consecutivo" 
                            id="Consecutivo"
                            placeholder="# Consecutivo">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>

                </div>

                <fieldset class="formulario__grupo formulario__grupo-btn-enviar">
                    <button
                        type="submit" 
                        name="accion" 
                        value="registrar3"  
                         title="Grabar un Nuevo Registro " 
                        class="formulario__btn2">
                        REGISTRAR
                    </button>   

                  <fieldset class="formulario__grupo-btn-enviar">

                        <a
                            href="ControladorPL?accion=listar"
                            class="btn btn-secondary"
                             title="Regresar a la Tabla Informacion" >
                            CANCELAR
                            <i class="bi bi-x-lg"></i>
                        </a>
                  </fieldset>

                    <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                </fieldset>     
                <!-- Grupo: Botones -->



            </form>



        </main>



        <script src="./js/ValidacionPL.js" type="text/javascript"></script>

        <!-- Alerta Sweet Alert  -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- For alert-style pop-up messages -->

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> <!-- For AJAX functionality -->

        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>






    </body>


</html>
