
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
<html>

    <head>
        <meta charset="UTF-8">

        <title>Calidad-Tdo-Seco-</title>

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

                    <ul class="navbar-nav mb-3 mb-lg-0 float-start ">   
                        <li class="nav-item ">
                            <a class="nav-link active" aria-current="page" href="./index3.jsp">
                                <span  style="margin-left: 10px; border:none" class="btn btn-outline-light">
                                    <i class="bi bi-arrow-left-square-fill text-dark"></i><b> Inicio</span>
                            </a></b>
                        </li>


                    </ul>

                    <ul class="navbar-nav mx-auto text-center" >   
                        <li class="nav-item" >
                            <a class="nav-link active my-menu-item"  aria-current="page" href="##">
                                <span  style="margin-right:  350px; border:none;" >
                                    REGISTRO TERMINADO SECO
                                </span>
                            </a>
                        </li>
                    </ul>

                    <ul class="navbar-nav mb-3 mb-lg-0 float-start ">   

                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="ControladorPs?accion=listar">
                                <span style="margin-left:   50px; border:none" class="btn btn-outline-light">
                                    <i class="fas fa-times dan"></i><b>
                                        CANCELAR
                                </span>
                            </a></b>
                        </li>

                    </ul>
                </div>
            </div>

        </nav>




        <!--Barra de Navegacion -->

        <main>
            <!--Estilos CSS-->
            <style>
                .campo-invalido {
                    border: 1px solid red; /* Cambia el borde a rojo para resaltar el campo */
                    background-color: #ffcccc; /* Cambia el fondo a un tono rojo claro */
                }
                .form-container {
                    margin: 5rem 0;
                }
                hr{
                    border: 2px solid #9fcdff;

                }

                /* Estilo para la línea */
                .linea {
                    border: 1px solid #000; /* Ancho y color de la línea */
                    width: 350px; /* Ancho de la línea */
                    height: 0; /* Altura de la línea (0 para que sea horizontal) */
                }


            </style>

            <div class="container-fluid text-center" style="position: relative; top: -22px;">

                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <br>
                        <h4 class="text-primary elegant-font mt-5"><b>REGISTRO</b></h4>
                    </div>
                </div>
            </div>


            <!-- Incio Formulario -->
            <form action="ControladorPs"  onsubmit="return validarFormularioS();" autocomplete="off" method="post" class="formulario" id="formulario" >


                <!-- Grupo: Fecha -->
                <div class="formulario__grupo" id="grupo__fecha">
                    <label class="formulario__label" for="fecha">Fecha</label>
                    <input  type="date" class="formulario__input" id="fecha" name="fecha"
                            placeholder="Ingrese fecha">
                </div>
                <!-- Grupo: Auxiliar -->
                <div class="formulario__grupo" id="grupo__User">   
                    <label class="formulario__label" for="idUsuarios"> Auxiliar</label>
                    <select  class="formulario__input" id="idUsuarios" style="border: 2px solid #ffdf7e;"  
                             name="idUsuarios">
                        <option value="0">Seleccione Aux</option>
                        <%
                            for (Usuarios usuarios : DaoUsuarios.listar()) {
                                if (usuarios != null) {
                        %>
                        <option  value="<%=usuarios.getIdUsuarios()%>"><%=usuarios.getNombres_apellido()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>

                <!-- Grupo: Referencia -->
                <div class="formulario__grupo" id="grupo__User">   
                    <label class="formulario__label" for="producto"> Referencia</label>
                    <select 
                        class="formulario__input" 
                        id="producto"
                        style="border: 2px solid #ffdf7e;" 
                        name="idProductos">
                        <option value="0">Seleccione Referencia</option>
                        <% for (Productos pr : DaoProductos.listarPS()) { %>
                        <% if (pr != null) {%>
                        <option value="<%= pr.getIdProductos()%>"><%= DaoProductos.obtenerNombreProducto(pr.getIdProductos())%></option>
                        <% } %>
                        <% }%>
                    </select>
                </div>

                <!-- Grupo: Cantidad NC -->
                <div class="formulario__grupo" id="grupo__cantNC">
                    <label for="cant_noconf" class="formulario__label">Cant-N.C</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="cant_noconf" 
                               id="cant_noconf" placeholder="Ingrese Cant">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>               
                </div>
                <!-- Grupo: Causas-->
                <div class="formulario__grupo" id="grupo__cantNC">
                    <label for="causas" class="formulario__label">Causas</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="causas" 
                               id="causas" placeholder="Ingrese Cant">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>               
                </div>


                <!-- Grupo: Lote -->
                <div class="formulario__grupo" id="grupo__lote">
                    <label for="lote" class="formulario__label">Lote</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="lote" id="lote" placeholder="% lote">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>               
                </div>

                <!--   onchange="calcularPromedioHum()"     onkeyup="calcularPromedioHumedad2();"-->


                 
                  <!-- Grupo: Campos Humedad-->
                <div class="formulario__grupo"  id="campos-humedad">
                    <!-- Aquí se agregarán dinámicamente los campos de humedad -->
                </div>
               

                <!-- Grupo: nuevoscampos -->
                <div class="formulario__grupo" id="grupo__nuevocampos">  
                    <!-- Boton de humedad -->
                    <button class="btn btn-sm btn-primary" type="button" onclick="agregarCampoHumedad()">
                        <i class="fas fa-plus"></i>
                    </button>
                </div>
                
                
                <!-- Grupo: Humedad promedio -->
                <div class="formulario__grupo" id="grupo__humedadPromedio">
                    <label   class="formulario__label"  for="sol_promedio" style="color: #1e7e34"><b>Hum-Promedio</b></label>
                    <div class="formulario__grupo-input">
                        <input  
                            onkeyup="calcularPromedioHumedad(this);" 
                            style="background:  #9fcdff"
                            class="formulario__input"
                            name="sol_promedio"
                            id="sol_promedio"
                            placeholder="%Solidos"  
                            readonly="">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error" id="error_humedadPromedio">Error! , Validar Dato Ingresado </p>
                </div>

                <!-- Titulo 1 --> <!-- Elemento que muestra la línea -->


                <div class="linea">
                    <p>Agregar Humeadad !</p>
                </div>

                <!-- Grupo: Campos pH-->
                <div class="formulario__grupo" id="campos-ph">
                    <!-- Aquí se agregarán dinámicamente los campos de pH -->
                </div>

                <!-- Grupo: nuevoscampos -->
                <div class="formulario__grupo" id="grupo__nuevocampos">  
                    <!-- Botón de pH -->
                    <button class="btn btn-sm btn-primary" type="button" onclick="agregarCampopH(this)">
                        <i class="fas fa-plus"></i>
                    </button>
                </div>

                <!-- Grupo: pH_promedio -->
                <div class="formulario__grupo" id="grupo__phpromedio">
                    <label class="formulario__label" for="pH_promedio" style="color: #1e7e34"><b>pH-Promedio</b></label>
                    <div class="formulario__grupo-input">
                        <input style="border: 2px solid #ffdf7e; background: #80bdff" 
                               type="text" 
                               class="formulario__input"
                               id="pH_promedio"
                               name="pH_promedio"
                               placeholder="Calculo Promedio"
                               readonly="" >
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error" id="error_pHPromedio">Error! , Validar Dato Ingresado </p>
                </div>



                <!-- Elemento que muestra la línea -->
                <div class="linea">
                    <p>Agregar pH !</p>
                </div>



                <!-- Grupo: Br -->
                <div class="formulario__grupo" id="grupo__Br">
                    <label for="BR" class="formulario__label">Brigh</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="Brigh" id="BR" placeholder= BR">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_Brigh">Error! , Validar Dato Ingresado</p>
                </div>


                <!-- Grupo: Wh -->
                <div class="formulario__grupo" id="grupo__Wh">
                    <label for="Wh" class="formulario__label">Whitness</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="Whitness" id="Wh" placeholder= Wh">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_Whitness">Error! , Validar Dato Ingresado</p>
                </div>
                <!-- Grupo: R325 -->
                <div class="formulario__grupo" id="grupo__r325">
                    <label for="retenido325" class="formulario__label">%R325</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="retenido325" id="retenido325" placeholder="% retenido325">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_retenido325">Error! , Validar Dato Ingresado</p>
                </div>
                <!-- Grupo: Dv50 -->
                <div class="formulario__grupo" id="grupo__Dv50">
                    <label for="Dv50" class="formulario__label">Dv(50)</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="Dv50" id="Dv50" placeholder= Dv50">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_Dv50">Error! , Validar Dato Ingresado</p>
                </div>

                <!-- Grupo: Dv90 -->
                <div class="formulario__grupo" id="grupo__Dv50">
                    <label for="dtp1" class="formulario__label">Dv(90)</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="Dv90" id="dtp1" placeholder= Dv90">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_Dv90">Error! , Validar Dato Ingresado</p>
                </div>

                <!-- Grupo: Abs_aceite -->
                <div class="formulario__grupo" id="grupo__Abs_aceite">  
                    <label  class="formulario__label" for="AA">Abs.Aceite</label>                 
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="abs_Aceite" id="AA" placeholder="% AA">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_AA">Error! , Validar Dato Ingresado</p>
                </div>


                <!-- Grupo: Comentarios -->
                <div class="formulario__grupo" id="grupo__comentarios">
                    <label for="Comentarios" class="formulario__label">Comentarios</label>
                    <div class="formulario__grupo-input">
                        <input 
                            type="text" 
                            class="formulario__input" 
                            name="comentarios"
                            id="Comentarios" 
                            placeholder="Ingrese Comentarios">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                </div>
                
                <!-- Grupo: Observacion -->
                <div class="formulario__grupo" id="grupo__comentarios">
                    <label for="observacion" class="formulario__label">Observacion</label>
                    <div class="formulario__grupo-input">
                        <input 
                            type="text"
                            class="formulario__input"
                            name="observacion"
                            id="observacion"
                            placeholder="Ingrese Comentarios">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                </div>

                <!-- Grupo: CONSECUTIVO -->
                <div class="formulario__grupo" id="grupo__Consecutivo">
                    <label  style="color: #34ce57" for="idConsecutivo" class="formulario__label"> # CONSECUTIVO</label>
                    <div class="formulario__grupo-input">
                        <input 
                            style="background:  #ffdf7e; font-weight: 700" 
                            type="text" 
                            class="formulario__input" 
                            name="idConsecutivo"
                            id="idConsecutivo" 
                            placeholder="# Consecutivo">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>

                </div>



                <!-- Fila de botones -->

                <div class="formulario__grupo formulario__grupo-btn-enviar">
                    <button  class="formulario__btn" type="submit" name="accion" value="registrar3" >
                        <i class="fas fa-save "></i> AGREGAR
                    </button>
                    <button class="formulario__btn_cancelar" id="cancelarBtn">
                        <i class="fas fa-times dan"></i> CANCELAR
                    </button>
                </div> 

            </form>

        </main>
        <!-- Fila de botones -->

        <h1>${mensaje}</h1>  

        <script src="./js/Funsion_Campos_Hum.js" type="text/javascript"></script>
        <script src="./js/JS_Validacion_PS.js" type="text/javascript"></script>

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
