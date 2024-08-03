
<%@page import="Persistencia.DaoEspecificacionesSeco"%>
<%@page import="Modelo.EspecificacionesSeco"%>
<%@page import="Persistencia.DaoConsecutivo"%>
<%@page import="Modelo.Consecutivo"%>
<%@page import="Persistencia.DaoEspecificaciones"%>
<%@page import="Modelo.Especificaciones"%>
<%@page import="Modelo.ControlSeco"%>
<%@page import="Persistencia.DaoClientes"%>
<%@page import="Modelo.Clientes"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.Document"%>

<%@page import="java.util.List"%>
<%@page import="Modelo.Usuarios"%>
<%@page import="Modelo.Productos"%>
<%@page import="Persistencia.DaoProductos"%>
<%@page import="Persistencia.DaoProductoSeco"%>

<%@page import="Persistencia.DaoUsuarios"%>


<%@page import="Modelo.Usuarios"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

        <!-- Etilos CSS -->  
        <link href="Vistas/Estilos_css/EstilosPL2.css" rel="stylesheet" type="text/css"/>


        <title>Certifcado-PS</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt((String) request.getAttribute("idpdf"));
            ControlSeco controlSeco = DaoProductoSeco.listarpdf(id);
            List<Consecutivo> listaConsecutivos = DaoConsecutivo.listarConsPDF(controlSeco.getIdControlCalidad());
            List<EspecificacionesSeco> listaEsp = DaoEspecificacionesSeco.listarEspPDF(controlSeco.getIdControlCalidad());
        %>

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


                    <ul class="navbar-nav mx-auto text-center" >   
                        <li class="nav-item" >
                            <a class="nav-link active my-menu-item"  aria-current="page" href="##">
                                <span >
                                    INFORMACIÓN  CERTIFICADO SECO   
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
                                    <i class="fas fa-list"></i> <b>Cancelar</b></span>
                            </a>
                        </li>
                    </ul>


                </div>
            </div>
        </nav>
        <!--Style CSS -->
        <style>
            .custom-checkbox {
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                width: 20px;
                height: 20px;
                border: 2px solid #00008B; /* Color del borde */
                border-radius: 5px;
                outline: none;
                cursor: pointer;
                position: relative;
                transform: scale(1.3); /* Para agrandar el checkbox */
                margin-left: 20px ;
                margin-top: 5px;

            }

            .custom-checkbox:checked {
                background-color: #34ce57; /* Color cuando está marcado */
                border: none; /* Remover el borde cuando está marcado */

            }

            .custom-checkbox:checked::after {
                content: '\2713'; /* Código Unicode para una marca de verificación */
                color: white; /* Color del check */
                font-size: 16px;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }

            .formulario__label3 {
                margin-right: 35px; /* Espacio entre el label y el checkbox */
                color: #00008B;
                margin-left:  5px;
                margin-top: 10px
            }


            .text-default {
                color: #000;
            }



        </style>
        <!--Style CSS -->
        <style>
            #h4_{
                color: rgb(66, 196, 66);
                font-family: Tahoma;
                text-align: left;
                margin-top: 5px;
                font-weight: bold;
                font-size: 22px;
                border-radius: 10px;

            }
            #h4_2{
                color: rgb(66, 196, 66);
                font-family: Tahoma;
                text-align: left;
                margin-top: 5px;
                font-weight: bold;
                font-size: 22px;
                border-radius: 10px;

                #psolidos {
                    color: #bb2d3b; /* Color del texto */
                    font-size: 14px; /* Tamaño de la fuente */
                    font-weight: bold; /* Grosor de la fuente */
                    margin-top: 10px; /* Espacio superior */
                }
            }

        </style>

        <!--Barra de Navegacion -->

        <%--  readonly=""   sirve para bloquear   --%>

        <main>

            <br>
            <br>   

            <%--  Formulario   --%>

            <form  class="formulario" id="formulario" action="ControladorReporteSeco" method="POST" class="custom-form">

                <div class="formulario__grupo" >      
                    <h4  id="h4_" class="text-primary elegant-font">CONSECUTIVO</h4> 
                </div>    

                <%-- ********** Consecutivo **************** --%>

                <% for (Consecutivo consecutivo : listaConsecutivos) {%>

                <div class="formulario__grupo" id="grupo__numRemision">
                    <label style="display: none;"  class="formulario__label"  for="remision"> Num Remision</label>
                    <input readonly="" class="formulario__input" type="hidden" readonly="" type="text" id="remision" value="<%=consecutivo.getNroRemision()%>"
                           name="noremision" placeholder="Ingrese Dato">
                </div>
                <div class="formulario__grupo" id="grupo__fp">
                    <label  class="formulario__label" for="fp">Fecha Producción</label>
                    <input readonly="" class="formulario__input" type="date" 
                           id="fp" value="<%=consecutivo.getFechaProduccion()%>" 
                           name="fechaProduccion" placeholder="Ingrese Dato">
                </div>

                <div class="formulario__grupo" id="grupo__fc">
                    <label  class="formulario__label"  for="fc">Fecha Certificado</label>
                    <input readonly="" class="formulario__input" type="date" 
                           id="fc" value="<%=consecutivo.getFechaCertificado()%>"
                           name="fechaCertificado" placeholder="Ingrese Dato">
                </div>

                <div class="formulario__grupo" id="grupo__lote">
                    <label  class="formulario__label"  for="lote"> Lote</label>
                    <input readonly="" type="text" class="formulario__input" id="lote" 
                           value="<%=consecutivo.getLote()%>" name="lote"
                           placeholder="Ingrese Dato">
                </div>
                <div class="formulario__grupo" id="grupo__consecutivo">
                    <label  class="formulario__label"  for="consecutivo"> Num Consecutivo </label>
                    <input readonly=""  type="text" class="formulario__input" id="consecutivo"
                           value="<%=consecutivo.getIdconsecutivo()%>"
                           name="numCertificado" placeholder="Ingrese Dato">
                </div>

                <!-- Grupo: Cantidad Sacos -->
                <div class="formulario__grupo" id="grupo__FechaP">
                    <label  class="formulario__label"  for="CantidadSacos"> Cant Sacos </label>
                    <input readonly="" type="text" class="formulario__input" id="CantidadSacos" value="<%=consecutivo.getCantidadMaterial()%>"
                           name="CantidadSacos" placeholder="Ingrese Dato">
                </div>

                <!-- Grupo: Referencia -->
                <div class="formulario__grupo" id="grupo__referencia">
                    <label  class="formulario__label"  for="IdProductos">Referencia</label>
                    <input  readonly="" type="text" id="IdProductos" style="font-weight: bold; color: #09f; " name="productos" class="formulario__input"
                            value="<%= DaoProductoSeco.obtenerProductoFinal(controlSeco.getIdControlCalidad())%>">
                </div>

                <!-- Grupo: Referencia -->
                <div class="formulario__grupo" id="grupo__cliente">
                    <label class="formulario__label" for="idclientes">Cliente</label>
                    <select class="formulario__input" 
                            style="border: 3px solid #ffdf7e; background: #F2F2F2; color:#000;font-weight: bold " 
                            id="idclientes" 
                            name="idclientes" 
                            onchange="updateCliente()" 
                            >
                        <option value="0">Seleccione Cliente</option>
                        <% for (Clientes clientes : DaoClientes.listar()) {
                                if (clientes != null) {%>
                        <option value="<%= clientes.getIdclientes()%>"><%= clientes.getRazon_Social()%></option>
                        <%  }
                            }%>
                    </select>
                    <input type="hidden" id="cliente" name="cliente" value="">
                    <p style=" font-weight: bold;   color: #bb2d3b; margin-top: 5px;" class="psolidos"> Seleccione el Cliente ! </p>
                </div>

                <%--   <div class="formulario__grupo" id="grupo__user">
        <label  class="formulario__label"   for="Auxiliar">Usuario</label>
        <input class="formulario__input" readonly="" type="text" id="Auxiliar" name="Auxiliar" class="form-control" 
               value="<%= DaoProductoSeco.obtenerUserFinal(controlSeco.getIdControlCalidad())%>">
    </div>--%>

                <!-- Grupo: Auxiliar -->
                <div class="formulario__grupo" id="grupo__User">   
                    <label class="formulario__label" for="idUsuarios"> Auxiliar</label>
                    <select  class="formulario__input"                           
                             style="border: 3px solid #ffdf7e; background: #F2F2F2; color:#000;font-weight: bold " 
                             id="idusuario" 
                             name="idusuario"
                             onchange="updateUser()" 
                             >
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
                    <input type="hidden" id="Auxiliar" name="Auxiliar" value="<%=controlSeco.getIdUsuarios()%>">
                    <p style=" font-weight: bold;   color: #005cbf; margin-top: 5px;" class="psolidos"> Seleccione Auxiliar Responsable! </p>
                </div>





                <% }%>


                <div class="formulario__grupo" id="grupo__FechaC">      
                    <h4  id="h4_2" class="text-primary elegant-font">TERMINADO</h4> 
                </div>  
                <div class="formulario__grupo" id="grupo__FechaC">      

                </div>

                <div class="formulario__grupo" id="grupo__FechaP">
                    <label    class="formulario__label"  for="humedad">% Humedad</label>
                    <input
                        readonly=""
                        class="formulario__input" type="text"  
                        id="humedad"                  
                        value="<%= Math.round(controlSeco.getHumedad_promedio() * 10) / 10.0%>" 
                        name="humedad"  >                             
                </div>

                <div class="formulario__grupo" id="grupo__FechaP">
                    <label    class="formulario__label"  class="formulario__label"  for="pH"> pH </label>
                    <input 
                        readonly=""
                        type="text" 
                        class="formulario__input"
                        id="pH"
                        value="<%= Math.round(controlSeco.getpH_promedio() * 10) / 10.0%>" 
                        name="pH" 
                        placeholder="Ingrese ">
                </div>

                <div class="formulario__grupo" id="grupo__r325">
                    <label   class="formulario__label"  for="retenido325"> % Ret 325 </label>
                    <input readonly="" type="text" class="formulario__input"
                           id="retenido325" value="<%=controlSeco.getRetenido325()%>" 
                           name="retenido325" 
                           placeholder="Ingrese ">
                </div>
                <div class="formulario__grupo" id="grupo__aa">
                    <label   class="formulario__label"  for="AA"> % AA </label>
                    <input 
                        readonly=""
                        type="text" 
                        class="formulario__input"
                        id="AA" 
                        value="<%= Math.round(controlSeco.getAbs_Aceite() * 10) / 10.0%>" 
                        name="AA" 
                        placeholder="Ingrese ">
                </div>


                <!-- Titulo 1 -->
                <!--   <h6 style="background: #ffdf7e; font-size: 11px">Color</h6> -->

                <div class="formulario__grupo" id="grupo__FechaP">
                    <label  class="formulario__label"  for="Br"> Br </label>
                    <input 
                        readonly=""
                        type="text" 
                        class="formulario__input"
                        id="Br" 
                        value="<%= Math.round(controlSeco.getBrigh() * 10) / 10.0%>" 
                        name="Br" 
                        placeholder="Ingrese Dato">
                </div>
                <div class="formulario__grupo" id="grupo__Wh">
                    <label   readonly="" class="formulario__label"  for="Wh"> Wh </label>
                    <input
                        type="text"
                        class="formulario__input" 
                        id="Wh" 
                        value="<%= Math.round(controlSeco.getWhitness() * 10) / 10.0%>" 
                        name="Wh" placeholder="Ingrese Dato">
                </div>

                <!-- Titulo 2 -->
                <!--   <h6 style="background: #ffdf7e; font-size: 11px">Tamaño Particula</h6>-->

                <div class="formulario__grupo" id="grupo__Dv50">
                    <label  class="formulario__label"   for="Dv50"> Dv(50)</label>
                    <input
                        readonly=""
                        type="text"
                        class="formulario__input" 
                        id="Dv50" 
                        value="<%= Math.round(controlSeco.getDv50() * 10) / 10.0%>" 
                        name="Dv50" 
                        placeholder="Ingrese Dato">
                </div>


                <div class="formulario__grupo" id="grupo__FechaP">
                    <label   class="formulario__label"  for="idConsecutivo">ID Consecutivo</label>
                    <input readonly="" type="text" class="formulario__input" id="idConsecutivo" readonly="" value="<%=controlSeco.getIdConsecutivo()%>"  name="idConsecutivo" placeholder="Ingrese Dato">
                </div>               

        </main>
        <main>

            <div class="formulario__grupo" style="margin-top:  -40px"> 
                <input class="form-check-input btn-success custom-checkbox" type="checkbox" id="invalidCheck" required>
                <label class="formulario__label3"  id="labelconfirmar" class="form-check-label mb-4" for="invalidCheck">
                    <b>CONFIRMAR</b>       
                </label>
                <p style="font-weight: bold; color: #005cbf; margin-top: 5px; text-align: center; margin-top: 20px" class="psolidos">
                    Verifique ! , <span style="font-weight: bold; text-decoration: underline; color: #c69500">Cliente Seleccionado</span> y Confirme si esta "Seguro"
                </p>


            </div>

            <hr style="border:1px solid #000">

            <div class="formulario__grupo formulario__grupo-btn-enviar">
                <button type="submit" name="accion" value="registrar" class="btn btn-danger ">
                    <i class="bi bi-file-earmark-pdf-fill "></i> GENERAR PDF
                </button>
                <div class="formulario__grupo formulario__grupo-btn-enviar">
                    <a class="nav-link active" aria-current="page" href="ControladorPs?accion=listar">
                        <span style="margin-left: 10px; border:none" class="btn btn-secondary">
                            <i <i class="fas fa-list"></i><b> Cancelar </span></a></b>

                </div> 

            </div> 


            <%-- ********** Especificaciones **************** --%>

            <br>
            <br>
            <p  style=" font-size: 14px; padding:15px;" class="text-primary text-center elegant-font">
                <b>ESPECIFICACIONES</b>
            </p>

            <!-- Titulo 2 -->
            <p style=" font-size: 14px; padding: 5px;">En este espacio se carga la información de Especificaciones.</p>

            <% for (EspecificacionesSeco especificaciones : listaEsp) {%>

            <!-- Variables no Visibles -->

            <footer>

                <div class="form-group text-left">
                    <label style="display: none;" for="variableEsp1" class="text-left"><b style="color: #28a745;">Variable # 1</b></label>
                    <input  type="hidden"    type="text" class="formulario__input" id="variableEsp1" name="variableEsp1" value="<%=especificaciones.getVariableEsp1()%>"   
                            placeholder="Ingrese Variable">
                </div> 
                <div class="form-group text-left">
                    <label style="display: none;" for="rango1" class="text-left">Rango # 1</label>
                    <input type="hidden"  type="text" class="formulario__input" id="rango1" name="rango1" value="<%=especificaciones.getRango1()%>"
                           placeholder="Ingrese Rango">
                </div>                           

                <div class="form-group text-left">
                    <label style="display: none;" for="variableEsp2" class="text-left"><b style="color: #28a745;">Variable # 2</b></label>
                    <input  type="hidden" type="text" class="formulario__input" id="variableEsp2" name="variableEsp2" value="<%=especificaciones.getVariableEsp2()%>" 
                            placeholder="Ingrese Variable">
                </div> 
                <div class="form-group text-left">
                    <label style="display: none;" for="rango2" class="text-left">Rango # 2</label>
                    <input  type="hidden" type="text" class="formulario__input" id="rango2" name="rango2" value="<%=especificaciones.getRango2()%>"
                            placeholder="Ingrese Rango">
                </div> 

                <div class="form-group text-left">
                    <label style="display: none;" for="variableEsp3" class="text-left"><b style="color: #28a745;">Variable # 3</b></label>
                    <input  type="hidden" type="text" class="formulario__input" id="variableEsp3" name="variableEsp3" value="<%=especificaciones.getVariableEsp3()%>"
                            placeholder="Ingrese Variable">
                </div> 
                <div class="form-group text-left">
                    <label style="display: none;" for="rango3" class="text-left">Rango # 3</label>
                    <input  type="hidden" type="text" class="formulario__input" id="rango3" name="rango3" value="<%=especificaciones.getRango3()%>"
                            placeholder="Ingrese Rango">
                </div> 


                <div class="form-group text-left">
                    <label style="display: none;" for="variableEsp4" class="text-left"><b style="color: #28a745;">Variable # 4</b></label>
                    <input  type="hidden"  type="text" 
                            class="formulario__input" 
                            id="variableEsp4" 
                            name="variableEsp4"
                            value="<%=especificaciones.getVariableEsp4()%>"
                            placeholder="Ingrese Variable">
                </div> 

                <%-- *************  Inicio Columna 2  **********---%>  

                <div class="form-group text-left">
                    <label style="display: none;" for="rango4" class="text-left">Rango # 4</label>
                    <input   type="hidden"  type="text"
                             class="formulario__input"
                             id="rango4"
                             name="rango4" 
                             value="<%=especificaciones.getRango4()%>"
                             placeholder="Ingrese Rango">
                </div> 


                <div class="form-group text-left">
                    <label  style="display: none;" for="variableEsp5" class="text-left"><b style="color: #28a745;">Variable # 5</b></label>
                    <input  type="hidden" type="text" 
                            class="formulario__input" 
                            id="variableEsp5" 
                            name="variableEsp5" 
                            value="<%=especificaciones.getVariableEsp5()%>"
                            placeholder="Ingrese Variable">
                </div> 
                <div class="form-group text-left">
                    <label style="display: none;"  for="rango5" class="text-left">Rango # 5</label>
                    <input  type="hidden"  type="text" 
                            class="formulario__input" 
                            id="rango5"
                            name="rango5"
                            value="<%=especificaciones.getRango5()%>"
                            placeholder="Ingrese Rango">
                </div> 

                <div class="form-group text-left">
                    <label style="display: none;" for="variableEsp6" class="text-left"><b style="color: #28a745;">Variable # 6</b></label>
                    <input  type="hidden" type="text"
                            class="formulario__input"
                            id="variableEsp6"
                            name="variableEsp6"
                            value="<%=especificaciones.getVariableEsp6()%>"
                            placeholder="Ingrese Variable">
                </div> 
                <div class="form-group text-left">
                    <label style="display: none;"  for="rango6" class="text-left">Rango # 6</label>
                    <input  type="hidden"   type="text" 
                            class="formulario__input"
                            id="rango6" 
                            name="rango6"
                            value="<%=especificaciones.getRango6()%>"
                            placeholder="Ingrese Rango">
                </div> 

                <div class="form-group text-left">
                    <label style="display: none;" for="variableEsp7" class="text-left"><b style="color: #28a745;">Variable # 7</b></label>
                    <input  type="hidden"  type="text" 
                            class="formulario__input" 
                            id="variableEsp7" 
                            name="variableEsp7"
                            value="<%=especificaciones.getVariableEsp7()%>"
                            placeholder="Ingrese Variable">
                </div> 
                <div class="form-group text-left">
                    <label  style="display: none;" for="rango7" class="text-left">Rango # 7</label>
                    <input  type="hidden" type="text"
                            class="formulario__input"
                            id="rango7" 
                            name="rango7" 
                            value="<%=especificaciones.getRango7()%>"
                            placeholder="Ingrese Rango">
                </div> 

                <div class="form-group text-left">
                    <label style="display: none;" for="variableEsp8" class="text-left"><b style="color: #28a745;">Variable # 8</b></label>
                    <input  type="hidden"  type="text" 
                            class="formulario__input"
                            id="variableEsp8" 
                            name="variableEsp8" 
                            value="<%=especificaciones.getVariableEsp8()%>"
                            placeholder="Ingrese Variable">
                </div> 
                <div class="form-group text-left">
                    <label style="display: none;" for="rango8" class="text-left">Rango # 8</label>
                    <input  type="hidden" type="text" 
                            class="formulario__input" 
                            id="rango8" 
                            name="rango8" 
                            value="<%=especificaciones.getRango8()%>"  
                            placeholder="Ingrese Rango">
                </div> 
            </footer>

        </div>
    </div>
    <% }%>

</form>

</main>

<h1>${mensaje}</h1>




<!--Funsion Validacion  -->
<script src="./js/JS_ValidarCertificadoSeco.js" type="text/javascript"></script>

<!--Estilos CSS  -->
<style>
    .campo-invalido {
        border: 1px solid red; /* Cambia el borde a rojo para resaltar el campo */
        background-color: #ffcccc; /* Cambia el fondo a un tono rojo claro */

    }
</style>

<%--Funsion para capturar el nombre del cliente y enviarlo como String  --%>
<script>
                                 function updateCliente() {
                                     var select = document.getElementById("idclientes");
                                     var clienteNombre = select.options[select.selectedIndex].text;
                                     document.getElementById("cliente").value = clienteNombre;
                                 }

                                 function updateUser() {
                                     var select = document.getElementById("idusuario");
                                     var UserNombre = select.options[select.selectedIndex].text;
                                     document.getElementById("Auxiliar").value = UserNombre;
                                 }

                                 // Inicializa el campo oculto cuando se carga la página
                                 document.addEventListener('DOMContentLoaded', function () {
                                     updateUser();
                                 });

</script>
<script>


</script>

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
