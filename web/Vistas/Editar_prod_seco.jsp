

<%@page import="java.util.List"%>
<%@page import="Modelo.ControlSeco"%>
<%@page import="Persistencia.DaoClientes"%>
<%@page import="Modelo.Clientes"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.Document"%>



<%@page import="Modelo.Usuarios"%>
<%@page import="Modelo.Productos"%>
<%@page import="Persistencia.DaoProductos"%>
<%@page import="Persistencia.DaoProductoSeco"%>
<%@page import="Persistencia.DaoSeguimientos"%>
<%@page import="Persistencia.DaoUsuarios"%>

<%@page import="Modelo.Seguimientos"%>
<%@page import="Modelo.Usuarios"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">


        <link href="Vistas/Estilos_css/EstilosPL2.css" rel="stylesheet" type="text/css"/>

        <title>Editar_PS</title>
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


                    <ul class="navbar-nav mx-auto text-center" >   
                        <li class="nav-item" >
                            <a class="nav-link active my-menu-item"  aria-current="page" href="##">
                                <span >
                                    EDITAR TERMINADO SECO
                                </span>
                            </a>
                        </li>
                    </ul>

                    <ul class="navbar-nav mb-3 mb-lg-0 float-start ">   
                        <li class="nav-item ">
                            <a class="nav-link active" aria-current="page" href="./index3.jsp">
                                <span  style="margin-left: 10px; border:none" class="btn btn-outline-light">
                                    <i class="bi bi-arrow-left-square-fill text-dark"></i><b> Inicio</span>
                            </a></b>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="ControladorPs?accion=listar">
                                <span style="margin-left: 10px; border:none" class="btn btn-outline-light">
                                    <i <i class="fas fa-list"></i><b>
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
            <!--Estilos CSS -->
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
                        <h4 class="text-primary elegant-font mt-5"><b> </b></h4>
                    </div>
                </div>
            </div>

            <!--Forma de recibir la informacion que debo listar para editar-->
            <%
                int id = Integer.parseInt((String) request.getAttribute("idEditar_ps"));
                ControlSeco controlSeco = DaoProductoSeco.listarAtributos2(id);
            %>

            <!-- Incio Formulario -->
            <form  class="formulario" id="formulario" onsubmit="return validarFormularioEditarS()" action="ControladorPs" method="POST" >

                <!-- Grupo: ID -->            
                <div class="formulario__grupo" id="grupo__id">   
                    <label class="formulario__label"   for="idControlCalidad">ID Registro</label>
                    <input type="text" 
                           class="formulario__input"
                           readonly="" 
                           id="idControlCalidad" 
                           value="<%=controlSeco.getIdControlCalidad()%>" name="idControlCalidad">
                </div>                       

                <!-- Grupo: Fecha -->
                <div class="formulario__grupo" id="grupo__fecha">
                    <label  class="formulario__label"  for="fecha"> Fecha </label>
                    <input type="date" class="formulario__input" 
                           id="fecha" value="<%=controlSeco.getFecha()%>" name="fecha" placeholder="Ingrese Fecha">
                </div>


               

              <!-- Grupo: Referencia -->
                <div class="formulario__grupo" id="grupo__producto">
                    <label class="formulario__label" for="producto">Referencia</label>
                    <select 
                        class="formulario__input"
                        style="border: 2px solid #ffdf7e;"
                        id="producto" 
                        name= "idProductos"
                        onchange="updateProduct()">
                        <option value="0">Seleccione Referencia</option>
                        <%
                            List<Productos> productos = DaoProductos.listarPS();
                            int selectedProductId = controlSeco.getIdProductos();

                            for (Productos pr : productos) {
                                if (pr != null) {
                                    int productoId = pr.getIdProductos();
                                    boolean isSelected = productoId == selectedProductId;
                        %>
                        <option 
                            value="<%= productoId%>" 
                            <%= isSelected ? "selected" : ""%>>
                            <%= DaoProductos.obtenerNombreProducto(productoId)%>
                        </option>
                        <%
                                }
                            }
                        %>
                    </select>                     
                    <input type="hidden" id="idProductos" name="idProductos" value="">
                </div>




                <!-- Grupo: Auxiliar -->
                <div class="formulario__grupo" id="grupo__Usuario">
                    <label class="formulario__label" for="Usuarios">Auxiliar</label>
                    <select
                        class="formulario__input" 
                        style="border: 2px solid #ffdf7e;"  
                        id="Usuarios" 
                        name="idUsuarios">
                        <option value="0">Seleccione Aux</option>
                        <% for (Usuarios usuarios : DaoUsuarios.listar()) { %>
                        <% if (usuarios != null) {%>
                        <%-- Comprueba si el seguimiento coincide con el valor recibido del formulario para marcarlo como seleccionado --%>
                        <option
                            value="<%= usuarios.getIdUsuarios()%>" 
                                <% if (usuarios.getIdUsuarios() == controlSeco.getIdUsuarios()) { %> selected <% }%>>
                            <%= usuarios.getNombres_apellido()%>
                        </option>
                        <% } %>
                        <% }%>
                    </select>
                </div>


                <!-- Grupo: No COnforme -->
                <div class="formulario__grupo" id="grupo__NC">
                    <label class="formulario__label" for="cant_noconf">Cant-N.C</label>
                    <div class="formulario__grupo-input">
                        <input  class="formulario__input" type="text" 
                                id="cant_noconf" 
                                value="<%=controlSeco.getCant_noconf()%>" 
                                name="cant_noconf" 
                                placeholder="Ingrese Lote">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div> 
                </div> 

                <!-- Grupo: Causas -->
                <div class="formulario__grupo" id="grupo__causas">
                    <label class="formulario__label" for="causas"> Causas</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input"  id="causas" value="<%=controlSeco.getCausas()%>" 
                               name="causas" placeholder="Ingrese Lote">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div> 
                </div> 

                <!-- Grupo: Auxiliar -->
                <div class="formulario__grupo" id="grupo__user">
                    <label class="formulario__label" for="lote">Lotes</label>
                    <div class="formulario__grupo-input">
                        <input type="text" 
                               class="formulario__input"
                               id="lote" 
                               value="<%=controlSeco.getLote()%>" 
                               name="lote" 
                               placeholder="Ingrese Lote">
                    </div>
                </div>

                <%
                    // Inicializamos la variable numCamposHumedad
                    int numCamposHumedad = 0;

                    // Iterar sobre los campos de humedad hasta que no haya más
                    for (int i = 1; i <= 80; i++) { // Suponiendo un límite máximo de 12 campos
                        try {
                            String humedad = String.valueOf(controlSeco.getHumedad(i));
                            if (humedad != null && !humedad.isEmpty()) {
                                numCamposHumedad++;
                            } else {
                                break;
                            }
                        } catch (Exception e) {
                            break;
                        }
                    }

                    // Iterar sobre los campos de humedad existentes
                    for (int i = 1; i <= numCamposHumedad; i++) {
                        String humedad = String.valueOf(controlSeco.getHumedad(i));
                        if (humedad != null && !humedad.isEmpty()) {
                            double valorHumedad = Double.parseDouble(humedad);
                            if (valorHumedad != 0.0) {
                %>
                <!-- Grupo: Hum -->
                <div class="formulario__grupo" id="grupo__Hum">
                    <label class="formulario__label" for="Humedad_<%= i%>">% Hum <%= i%> </label>
                    <input type="text" class="formulario__input campo-humedad" id="Humedad_<%= i%>" value="<%= humedad%>" name="humedad_<%= i%>" placeholder="Ingrese Dato">
                </div>
                <%
                            }
                        }
                    }
                %>

                <!-- *********** Campos Dinamicos de Humedad *************-->


                <!-- Grupo: nuevos campos -->                               
                <div class="formulario__grupo" id="grupo__nuevocampos">
                    <!-- Boton de humedad -->
                    <button class="btn btn-sm btn-primary" type="button" onclick="agregarCampoHumedadEditar()">
                        <i class="fas fa-plus"></i>
                    </button>
                </div>
                <!-- Grupo: Campos Humedad -->
                <div class="formulario__grupo" id="campos-humedad">
                    <!-- Aquí se agregarán dinámicamente los campos de humedad -->
                </div>

                <!-- Grupo: Hum Promedio -->
                <div class="formulario__grupo" id="grupo__humPromedio">
                    <label class="formulario__label" style="color: #1e7e34"><b>Hum-Promedio</b></label>
                    <div class="formulario__grupo-input">
                        <input style="border: 2px solid #ffdf7e; background: #80bdff"
                               onkeyup="calcularPromedioHumedadEditar(this);"
                               type="text" 
                               class="formulario__input"
                               id="Humedad_Promedio"
                               value="<%= controlSeco.getHumedad_promedio()%>"
                               name="sol_promedio"
                               placeholder="Ingrese Dato" 
                               readonly="">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_Dv50">Error! , Validar Dato Ingresado</p>
                </div>


                <!-- Titulo 1 --> <!-- Elemento que muestra la línea -->


                <div class="linea">
                    <p>Agregar Humeadad !</p>
                </div>


                <%
                    // Inicializamos la variable numCampospH
                    int numCampospH = 0;

                    // Iterar sobre los campos de pH hasta que no haya más
                    for (int i = 1; i <= 30; i++) { // Suponiendo un límite máximo de 12 campos
                        try {
                            String pH = String.valueOf(controlSeco.getPH(i));
                            if (pH != null && !pH.isEmpty()) {
                                numCampospH++;
                            } else {
                                break;
                            }
                        } catch (Exception e) {
                            break;
                        }
                    }

                    // Iterar sobre los campos de pH existentes
                    for (int i = 1; i <= numCampospH; i++) {
                        String pH = String.valueOf(controlSeco.getPH(i));
                        if (pH != null && !pH.isEmpty()) {
                            double valorpH = Double.parseDouble(pH);
                            if (valorpH != 0.0) {
                %>
                <!-- Grupo: pH -->
                <div class="formulario__grupo" id="grupo__pH">
                    <label class="formulario__label" for="pH_<%= i%>">% pH <%= i%> </label>
                    <input type="text" class="formulario__input campo-ph" id="pH_<%= i%>" value="<%= pH%>" name="pH_<%= i%>" placeholder="Ingrese Dato">
                </div>
                <%
                            }
                        }
                    }
                %>

                <!-- Grupo: nuevos campos -->
                <div class="formulario__grupo" id="grupo__nuevocampos">
                    <!-- Botón de pH -->
                    <button class="btn btn-sm btn-primary" type="button" onclick="agregarCampoph3()">
                        <i class="fas fa-plus"></i>
                    </button>
                </div>
                <!-- Grupo: Campos pH -->
                <div class="formulario__grupo" id="campos-ph">
                    <!-- Aquí se agregarán dinámicamente los campos de pH -->
                </div>

                <!-- Grupo: pH Promedio -->
                <div class="formulario__grupo" id="grupo__phpromedio">
                    <label class="formulario__label" style="color: #1e7e34"><b>pH Promedio</b></label>
                    <div class="formulario__grupo-input">
                        <input style="border: 2px solid #ffdf7e; background: #80bdff" 
                               type="text" 
                               class="formulario__input"
                               id="pH_promedio"
                               value="<%= controlSeco.getpH_promedio()%>"
                               name="pH_promedio" 
                               placeholder="Ingrese Dato" 
                               onkeyup="calcularPromedioph2();" 
                               readonly="">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_Dv90">Error! , Validar Dato Ingresado</p>
                </div>


                <!-- Elemento que muestra la línea -->
                <div class="linea">
                    <p>Agregar pH !</p>
                </div>

                <!-- Grupo: Br -->
                <div class="formulario__grupo" id="grupo__user">
                    <label class="formulario__label" for="BR"> Br </label>
                    <div class="formulario__grupo-input">
                        <input type="text" 
                               class="formulario__input" 
                               id="BR"
                               value="<%=controlSeco.getBrigh()%>" 
                               name="Brigh"
                               placeholder="Ingrese Dato">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_Dv90">Error! , Validar Dato Ingresado</p>
                </div>

                <!-- Grupo: Wh -->
                <div class="formulario__grupo" id="grupo__Whitness">
                    <label class="formulario__label" for="Whitness"> Wh </label>
                    <div class="formulario__grupo-input">
                        <input type="text" 
                               class="formulario__input"
                               id="Whitness"
                               value="<%=controlSeco.getWhitness()%>"
                               name="Whitness" 
                               placeholder="Ingrese Dato">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_Whitness">Error! , Validar Dato Ingresado</p>
                </div>


                <!-- Grupo: R325 -->
                <div class="formulario__grupo" id="grupo__user">
                    <label class="formulario__label" for="retenido325">% R325</label>
                    <div class="formulario__grupo-input">
                        <input type="text" 
                               class="formulario__input"
                               id="retenido325" 
                               value="<%=controlSeco.getRetenido325()%>" 
                               name="retenido325" 
                               placeholder="Ingrese Dato">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_retenido325">Error! , Validar Dato Ingresado</p>
                </div>  

                <!-- Grupo: Dv50 -->
                <div class="formulario__grupo" id="grupo__user">
                    <label class="formulario__label" for="Dv50"> Dv(50)</label>
                    <div class="formulario__grupo-input">
                        <input type="text"
                               class="formulario__input"
                               id="Dv50" 
                               value="<%=controlSeco.getDv50()%>"
                               name="Dv50" 
                               placeholder="Ingrese Dato">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_Dv50">Error! , Validar Dato Ingresado</p>
                </div>

                <!-- Grupo: Dv90 -->
                <div class="formulario__grupo" id="grupo__user">
                    <label class="formulario__label" for="dv90">Dv(90)</label>
                    <div class="formulario__grupo-input">
                        <input type="text" 
                               class="formulario__input"
                               id="dv90" 
                               value="<%=controlSeco.getDv90()%>" 
                               name="Dv90"
                               placeholder="Ingrese Dato">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_Dv90">Error! , Validar Dato Ingresado</p>
                </div>

                <!-- Grupo: Abs_aceite -->
                <div class="formulario__grupo" id="grupo__user">
                    <label class="formulario__label" for="AA"> Abs.Aceite</label>
                    <div class="formulario__grupo-input">
                        <input type="text"
                               class="formulario__input"
                               id="AA" 
                               value="<%=controlSeco.getAbs_Aceite()%>"
                               name="abs_Aceite"
                               placeholder="Ingrese Dato">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error error" id="error_AA">Error! , Validar Dato Ingresado</p>
                </div>





                <!-- Grupo: Observacion -->
                <div class="formulario__grupo" id="grupo__user">
                    <label class="formulario__label" for="obs">Observacion</label>
                    <div class="formulario__grupo-input">
                        <input type="text"
                               class="formulario__input"
                               id="obs" 
                               value="<%=controlSeco.getObservacion()%>"
                               name="observacion" 
                               placeholder="Ingrese Dato">
                    </div>
                </div>

                <!-- Grupo: Comentario -->
                <div class="formulario__grupo" id="grupo__user">
                    <label class="formulario__label" for="comentarios"> Comentario </label>
                    <div class="formulario__grupo-input">
                        <input type="text" 
                               class="formulario__input"
                               id="comentarios" 
                               value="<%=controlSeco.getComentarios()%>"
                               name="comentarios"
                               placeholder="Ingrese Dato">
                    </div>
                </div>




                <!-- Grupo: Consecutivo -->
                <div class="formulario__grupo" id="grupo__user">
                    <label class="formulario__label" style="color: #1ed12d; font-family: sans-serif; font-weight: bold" for="idConsecutivo">ID Consecutivo</label>
                    <input type="text" 
                           class="formulario__input"
                           id="idConsecutivo" 
                           style="background:  #ffdf7e; font-weight: bold"  value="<%= String.format("%04d", controlSeco.getIdConsecutivo())%>" 
                           name="idConsecutivo"
                           placeholder="Ingrese Dato">
                </div>

                <!-- Fila de botones -->

                <div class="formulario__grupo formulario__grupo-btn-enviar">
                    <input type="hidden" name="txtid_ps" value="<%=controlSeco.getIdControlCalidad()%>">

                    <button  class="formulario__btn" type="submit" name="accion" value="registrarEdicion">
                        <i class="fas fa-sync"></i> ACTUALIZAR
                    </button>
                    <button class="formulario__btn_cancelar" id="cancelarBtn">
                        <i class="fas fa-times dan"></i> CANCELAR
                    </button>


                </div>
            </form>

        </main>

        <h1>${mensaje}</h1>



        <script src="./js/JS_EditarPS.js" type="text/javascript"></script>
        <script src="./js/FunsionCondicionalPS.js" type="text/javascript"></script>





        <!-- SweetAlert -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <!-- Bootstrap y otros scripts necesarios -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>

            <!-- Funsiona para actulaizar Producto  -->    
<script>

                                   function updateProduct() {
                                       var select = document.getElementById("producto");
                                       var selectedIndex = select.selectedIndex;

                                       if (selectedIndex >= 0) {
                                           var productName = select.options[selectedIndex].text;
                                           document.getElementById("idProductos").value = productName;
                                           productoSeleccionado = productName.trim(); // Actualiza el producto seleccionado
                                           //  console.log(productName);
                                           // validateRanges(select.value); // Llama a la validación de rangos
                                       }
                                   }

                                   document.addEventListener('DOMContentLoaded', function () {
                                       var selectedProductId = '<%= controlSeco.getIdProductos()%>'; // Obtiene el valor del ID del producto seleccionado
                                       var select = document.getElementById("producto");

                                       if (select) {
                                           for (var i = 0; i < select.options.length; i++) {
                                               if (select.options[i].value === selectedProductId) {
                                                   select.selectedIndex = i;
                                                   break;
                                               }
                                           }
                                          // console.log("Producto seleccionado ID:", selectedProductId);
                                           updateProduct(); // Llama a la función para inicializar el campo oculto y validar los rangos
                                       } else {
                                           console.error("El elemento select no está disponible en el DOM.");
                                       }
                                   });

        </script>




    </body>
</html>
