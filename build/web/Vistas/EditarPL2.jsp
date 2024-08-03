
<%@page import="java.util.List"%>
<%@page import="Persistencia.DaoProductoLodo"%>
<%@page import="Modelo.ControlLodo"%>
<%@page import="Modelo.Productos"%>
<%@page import="Persistencia.DaoProductos"%>
<%@page import="Modelo.Seguimientos"%>
<%@page import="Persistencia.DaoSeguimientos"%>
<%@page import="Persistencia.DaoUsuarios"%>
<%@page import="Modelo.Usuarios"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Editar-Lodos </title>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">



    <link href="Vistas/Estilos_css/EstilosPL2.css" rel="stylesheet" type="text/css"/>

</head>

<body>
    <%
        int id = Integer.parseInt((String) request.getAttribute("idEditarPL"));
        ControlLodo controlLodo = DaoProductoLodo.listarAtributos2(id);
    %>

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
                                <i class="bi bi-arrow-left-square-fill text-dark"></i><b> Inicio</b>
                            </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="ControladorPL?accion=listar">
                            <span style="margin-left: 10px; border:none" class="btn btn-outline-light">
                                <i <i class="fas fa-list"></i><b> CANCELAR </b>
                            </span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Fin Barra navbar -->

    <!-- Inicio Contenido Principal -->
    <main>
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
                    <h4 class="text-primary elegant-font mt-5"><b>EDITAR PRODUCTO LODO</b></h4>                  
                </div>
            </div>
        </div>

        <!-- Grupo: ID -->
        <div  class="formulario__grupo" id="grupo__fecha">
            <label for="idControlCalidad">ID Registro</label>
            <input type="text" class="formulario__input col-md-3" readonly="" id="idControlCalidad" 
                   value="<%=controlLodo.getIdControlCalidad()%>" name="idCt">
        </div>

        <!-- Incio Formulario -->
        <form class="formulario" id="formulario" onsubmit="return validarFormularioEditarPL();" action="ControladorPL" method="post">


            <!-- Grupo: Fecha -->
            <div class="formulario__grupo" id="grupo__fecha">
                <label class="formulario__label" for="fecha">Fecha</label>
                <div class="formulario__grupo-input">
                    <input 
                        type="date" 
                        class="formulario__input"
                        id="fecha"
                        value="<%=controlLodo.getFecha()%>" 
                           name="fecha"
                           placeholder="%Solidos">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div>
            </div>

            <!-- Grupo: Referencia -->
            <div class="formulario__grupo" id="grupo__producto">
                <label class="formulario__label" for="idproducto">Referencia</label>
                <select 
                    class="formulario__input"
                    style="border: 2px solid #ffdf7e;"
                    id="idproducto" 
                    name= "producto"
                    onchange="updateProduct()">
                    <option value="0">Seleccione Referencia</option>
                    <%
                        List<Productos> productos = DaoProductos.listarPL();
                        int selectedProductId = controlLodo.getIdProductos();

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
                <input type="hidden" id="producto" name="producto" value="">
            </div>






            <div class="formulario__grupo" id="grupo__seguimiento">
                <label class="formulario__label" for="idSeguimiento">Seguimiento</label>
                <select class="formulario__input" style="border: 2px solid #ffdf7e;" id="idSeguimiento" name="txtSto">
                    <option value="0">Seleccione Seguimiento</option>
                    <% for (Seguimientos sto : DaoSeguimientos.listar()) { %>
                    <% if (sto != null) {%>
                    <%-- Comprueba si el seguimiento coincide con el valor recibido del formulario para marcarlo como seleccionado --%>
                    <option value="<%= sto.getIdSeguimientos()%>"
                            <% if (sto.getIdSeguimientos() == controlLodo.getIdSeguimiento()) { %> selected <% }%>>
                        <%= sto.getNumSeguimiento()%>
                    </option>
                    <% } %>
                    <% } %>
                </select>
            </div>

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
                    <option value="<%= usuarios.getIdUsuarios()%>" 
                            <% if (usuarios.getIdUsuarios() == controlLodo.getIdUsuarios()) { %> selected <% }%>>
                        <%= usuarios.getNombres_apellido()%>
                    </option>
                    <% } %>
                    <% }%>
                </select>
            </div>



            <!-- Grupo: Tanque -->
            <div class="formulario__grupo" id="grupo__tanque">
                <label for="tanque" class="formulario__label">Tanque #</label>
                <div class="formulario__grupo-input">
                    <input type="text" class="formulario__input"  value="<%=controlLodo.getNumeroTanque()%>"
                           name="tanque" id="tanque" placeholder="% tanque">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div>               
            </div>

            <!-- Grupo: Lote -->
            <div class="formulario__grupo" id="grupo__lote">
                <label for="lote" class="formulario__label">Lote</label>
                <div class="formulario__grupo-input">
                    <input 
                        autocomplete="off"
                        type="text" class="formulario__input" name="lote"  value="<%=controlLodo.getLote()%>" id="lote" placeholder="% lote">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div>               
            </div>

            <!-- Grupo: Cant Kg -->
            <div class="formulario__grupo" id="grupo__Cantidadkg">
                <label for="Cantidadkg" class="formulario__label">Cantidad_Kg</label>
                <div class="formulario__grupo-input">
                    <input 
                        autocomplete="off"
                        type="text" class="formulario__input" name="Cantidadkg" id="Cantidadkg"  value="<%=controlLodo.getCantiKgLodo()%>" placeholder="% Cantidadkg">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div>               
            </div>
            <!-- Grupo: Solidos -->
            <div class="formulario__grupo" id="grupo__solidos">
                <label for="solidos" class="formulario__label">% Solidos</label>
                <div class="formulario__grupo-input">
                    <input 
                        autocomplete="off"
                        onkeyup="calcularHumedad(this);" 
                        type="text"
                        class="formulario__input" 
                        name="solidos"
                        value="<%=controlLodo.getSolidos()%>"
                        id="solidos"
                        placeholder="%Solidos">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div>
                <p class="formulario__input-error" id="error_solidos">!Error, Validar % Solidos Ingresados </p>
            </div>

            <!-- Grupo: Cant Humedad -->
            <div class="formulario__grupo" id="grupo__humedad">
                <label for="humedad" class="formulario__label">Humedad</label>
                <div class="formulario__grupo-input">
                    <input 
                        autocomplete="off"
                        type="text" class="formulario__input"  value="<%=controlLodo.getHumedad()%>" name="humedad" id="humedad" readonly="" placeholder="% humedad">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div>               
            </div>


            <!-- Grupo: pH -->
            <div class="formulario__grupo" id="grupo__pH">
                <label for="pH" class="formulario__label">pH</label>
                <div class="formulario__grupo-input">
                    <input 
                        autocomplete="off"
                        type="text" 
                        class="formulario__input" 
                        name="pH" 
                        value="<%=controlLodo.getpH()%>" 
                        id="pH" 
                        placeholder="% pH">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div>
                <p class="formulario__input-error error" id="error_pH">Error! , Validar Dato Ingresado</p>
            </div>
            <!-- Grupo: R325 -->
            <div class="formulario__grupo" id="grupo__r325">
                <label for="r325" class="formulario__label">R325</label>
                <div class="formulario__grupo-input">
                    <input 
                        autocomplete="off"
                       type="text" 
                        class="formulario__input" 
                        name="r325" id="r325" 
                        value="<%=controlLodo.getRetenido325()%>" 
                        placeholder="% r325">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div>
                <p class="formulario__input-error error" id="error_r325">Error! , Validar Dato Ingresado</p>
            </div>
            <!-- Grupo: Brigh -->
            <div class="formulario__grupo" id="grupo__Brigh">
                <label for="Brigh" class="formulario__label">Brigh-Pastilla</label>
                <div class="formulario__grupo-input">
                    <input
                        autocomplete="off"
                        type="text" class="formulario__input" name="Brigh"  value="<%=controlLodo.getBrigh()%>" id="Brigh" placeholder="% Brigh">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div> 
                <p class="formulario__input-error error" id="error_Brigh">Error! , Validar Dato Ingresado</p>              
            </div>

            <!-- Grupo: Wh -->
            <div class="formulario__grupo" id="grupo__Wh">
                <label for="Wh" class="formulario__label">Wh-Pastilla</label>
                <div class="formulario__grupo-input">
                    <input
                        autocomplete="off"
                        type="text" class="formulario__input" name="Wh"  value="<%=controlLodo.getWhitness()%>" id="Wh" placeholder="% Wh">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div> 
                <p class="formulario__input-error error" id="error_Wh">Error! , Validar Dato Ingresado </p>              
            </div>
            <!-- Grupo: Brigh Lenta-->
            <div class="formulario__grupo" id="grupo__BrighLeneta">
                <label style="color:   #09f; font-weight: bold" for="Brigh_Leneta" class="formulario__label">Brigh-Leneta</label>
                <div class="formulario__grupo-input">
                    <input  style="background:  #9fcdff"  type="text" class="formulario__input" name="Brigh_Leneta"  value="<%=controlLodo.getBrigh_Leneta()%>" id="Brigh_Leneta" placeholder=" Brigh Leneta">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div> 
                <p class="formulario__input-error error" id="error_Brigh">Error! , Validar Dato Ingresado</p>              
            </div>
            <!-- Grupo: Wh Leneta -->
            <div class="formulario__grupo" id="grupo__Wh">
                <label  style="color:   #09f; font-weight: bold" for="Wh_Leneta" class="formulario__label">Wh-Leneta</label>
                <div class="formulario__grupo-input">
                    <input  style="background:  #9fcdff" type="text" class="formulario__input" name="Wh_Leneta"  value="<%=controlLodo.getWhitness_Leneta()%>" id="Wh_Leneta" placeholder="% Wh">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div> 
                <p class="formulario__input-error error" id="error_Wh">Error! , Validar Dato Ingresado </p>              
            </div>

            <!-- Grupo: KU -->
            <div class="formulario__grupo" id="grupo__ku">
                <label for="ku" class="formulario__label">Ku</label>
                <div class="formulario__grupo-input">
                    <input type="text" class="formulario__input" name="ku" id="ku"  value="<%=controlLodo.getViscosidadKu()%>" placeholder="% ku">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div>
                <p class="formulario__input-error error" id="error_ku">Error! , Validar Dato Ingresado</p>
            </div>
            <!-- Grupo: cP -->
            <div class="formulario__grupo" id="grupo__cP">
                <label for="cP" class="formulario__label">cP</label>
                <div class="formulario__grupo-input">
                    <input type="number" class="formulario__input" name="cP"  value="<%=controlLodo.getViscosidadCp()%>" id="cP" placeholder="% cP">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div>
                <p class="formulario__input-error error" id="error_cP">Error! , Validar Dato Ingresado</p>
            </div>
            <!-- Grupo: Dv50 -->
            <div class="formulario__grupo" id="grupo__Dv50">
                <label for="Dv50" class="formulario__label">Dv50</label>
                <div class="formulario__grupo-input">
                    <input type="text" class="formulario__input" name="Dv50" id="Dv50"  value="<%=controlLodo.getDv50()%>" placeholder="% Dv50">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div> 
                <p class="formulario__input-error error" id="error_Dv50">Error! , Validar Dato Ingresado </p>              
            </div>

            <!-- Grupo: Dv90 -->
            <div class="formulario__grupo" id="grupo__Dv90">
                <label for="Dv90" class="formulario__label">Dv90</label>
                <div class="formulario__grupo-input">
                    <input type="text" class="formulario__input" name="Dv90" id="Dv90"  value="<%=controlLodo.getDv90()%>" placeholder="% Dv90">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div> 
                <p class="formulario__input-error error" id="error_Dv90">Error! , Validar Dato Ingresado </p>              
            </div>


            <!-- Grupo: AbsAceite -->
            <div class="formulario__grupo" id="grupo__AbsAceite">
                <label for="AbsAceite" class="formulario__label">Abs_Aceite</label>
                <div class="formulario__grupo-input">
                    <input type="text" class="formulario__input" name="AbsAceite"  value="<%=controlLodo.getAbs_Aceite()%>" id="AbsAceite" placeholder="% AbsAceite">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div> 
                <p class="formulario__input-error error" id="error_AbsAceite">Error! , Validar Dato Ingresado</p>              
            </div>

            <!-- Grupo: kgAgua -->
            <div class="formulario__grupo" id="grupo__kgAgua">
                <label for="kgAgua" class="formulario__label">Kg_Agua</label>
                <div class="formulario__grupo-input">
                    <input type="text" class="formulario__input" name="kgAgua"  value="<%=controlLodo.getLtAgua()%>" id="kgAgua" placeholder="% kgAgua">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div> 
                <p class="formulario__input-error error" id="error_kgAgua">Error! , Validar Dato Ingresado </p>              
            </div>
            <!-- Grupo: dispersante -->
            <div class="formulario__grupo" id="grupo__dispersante">
                <label for="dispersante" class="formulario__label">Dispersante</label>
                <div class="formulario__grupo-input">
                    <input type="text" class="formulario__input" name="dispersante"  value="<%=controlLodo.getDispersante()%>" id="dispersante" placeholder="% dispersante">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div> 
                <p class="formulario__input-error error" id="error_dispersante">Error! , Validar Dato Ingresado </p>              
            </div>
            <!-- Grupo: espesante -->
            <div class="formulario__grupo" id="grupo__espesante">
                <label for="espesante" class="formulario__label">Espesante</label>
                <div class="formulario__grupo-input">
                    <input type="text" class="formulario__input" name="espesante"  value="<%=controlLodo.getLtNatrosol()%>" id="espesante" placeholder="% espesante">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div> 
                <p class="formulario__input-error error" id="error_espesante">Error! , Validar Dato Ingresado </p>              
            </div>
            <!-- Grupo: Biocidad -->
            <div class="formulario__grupo" id="grupo__Biocidad">
                <label for="Biocidad" class="formulario__label">Biocidad (Lt)</label>
                <div class="formulario__grupo-input">
                    <input type="text" class="formulario__input" name="Biocidad"  value="<%=controlLodo.getLtBiocidad()%>" id="Biocidad" placeholder="% Biocidad">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div> 
                <p class="formulario__input-error error" id="error_Biocidad">Error! , Validar Dato Ingresado </p>              
            </div>
            <!-- Grupo: %Biocidad -->
            <div class="formulario__grupo" id="grupo__dosisBiocidad">
                <label for="dosisBiocidad" class="formulario__label">%Biocidad</label>
                <div class="formulario__grupo-input">
                    <input type="text" class="formulario__input" name="dosisBiocidad"  value="<%=controlLodo.getBiocidadPorcentaje()%>" id="dosisBiocidad" placeholder="% dosisBiocidad">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div> 
                <p class="formulario__input-error error" id="error_dosisBiocidad">Error! , Validar Dato Ingresado</p>              
            </div>
            <!-- Grupo: kgSodio -->
            <div class="formulario__grupo" id="grupo__kgSodio">
                <label for="kgSodio" class="formulario__label">Kg_Sodio</label>
                <div class="formulario__grupo-input">
                    <input type="text" class="formulario__input" name="kgSodio"  value="<%=controlLodo.getKgCarbonatoSosio()%>" id="kgSodio" placeholder=" Kg Sodio">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div> 
                <p class="formulario__input-error error" id="error_kgSodio">Error! , Validar Dato Ingresado </p>              
            </div>
            <!-- Grupo: comentarios -->
            <div class="formulario__grupo" id="grupo__comentarios">
                <label for="comentarios" class="formulario__label">Contramuestra</label>
                <div class="formulario__grupo-input">
                    <input type="text" class="formulario__input" name="comentarios"  value="<%=controlLodo.getComentarios()%>" id="comentarios" placeholder=" Contramuestra">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div> 
                <p class="formulario__input-error error" id="error_comentarios">Error! , Validar Dato Ingresado </p>              
            </div>
            <!-- Grupo: observacion -->
            <div class="formulario__grupo" id="grupo__observacion">
                <label for="observacion" class="formulario__label">Observacion</label>
                <div class="formulario__grupo-input">
                    <input type="text" class="formulario__input"  value="<%=controlLodo.getObservacion()%>" name="observacion" id="observacion" placeholder="Observación">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div> 
                <p class="formulario__input-error error" id="error_observacion">Error! , Validar Dato Ingresado</p>              
            </div>

            <!-- Grupo: CONSECUTIVO -->
            <div class="formulario__grupo" id="grupo__Consecutivo">
                <label  style="color: #34ce57" for="Consecutivo" class="formulario__label"> # CONSECUTIVO</label>
                <div class="formulario__grupo-input">
                    <input  style="background:  #ffdf7e"  type="text"  value="<%=controlLodo.getIdConsecutivo()%>" class="formulario__input" name="Consecutivo" id="Consecutivo" placeholder="% Consecutivo">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div>
                <p class="formulario__input-error error" id="error_Consecutivo">Error! , Validar Dato Ingresado</p>
            </div>

            <!-- Grupo: Botones -->
            <div class="formulario__grupo formulario__grupo-btn-enviar">
                <input type="hidden" name="txtid_pl" value="<%=controlLodo.getIdControlCalidad()%>">
                <button type="submit" name="accion" value="registrarEdicion2"  class="formulario__btn" title="Boton  si se Desea solo Mofificar el  Registro">                
                    EDITAR
                </button>
                <button  tit type="submit" name="accion" value="registrar3" title="Boton si se Desea Grabar un Nuevo Registro "  
                         class="formulario__btn2">                 
                    GRABAR
                </button>
                <button class="formulario__btn_cancelar" id="cancelarBtn" title="Boton para Regresar a la Tabla de Datos">
                    <i class="fas fa-times dan"></i> CANCELAR
                </button>
                <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
            </div>  

        </form>
    </main>


    <script src="./js/JS.EditarPL.js" type="text/javascript"></script>

    <!-- Alerta Sweet Alert  -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- For alert-style pop-up messages -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> <!-- For AJAX functionality -->

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <script>

                            function updateProduct() {
                                var select = document.getElementById("idproducto");
                                var selectedIndex = select.selectedIndex;

                                if (selectedIndex >= 0) {
                                    var productName = select.options[selectedIndex].text;
                                    document.getElementById("producto").value = productName;
                                    productoSeleccionado = productName.trim(); // Actualiza el producto seleccionado
                                    //  console.log(productName);
                                    // validateRanges(select.value); // Llama a la validación de rangos
                                }
                            }

                            document.addEventListener('DOMContentLoaded', function () {
                                var selectedProductId = '<%= controlLodo.getIdProductos()%>'; // Obtiene el valor del ID del producto seleccionado
                                var select = document.getElementById("idproducto");

                                if (select) {
                                    for (var i = 0; i < select.options.length; i++) {
                                        if (select.options[i].value === selectedProductId) {
                                            select.selectedIndex = i;
                                            break;
                                        }
                                    }
                                    console.log("Producto seleccionado ID:", selectedProductId);
                                    updateProduct(); // Llama a la función para inicializar el campo oculto y validar los rangos
                                } else {
                                    console.error("El elemento select no está disponible en el DOM.");
                                }
                            });




    </script>



</body>
</html>