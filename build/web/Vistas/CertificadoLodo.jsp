
<%@page import="Persistencia.DaoEspecificacionesLodos"%>
<%@page import="Modelo.EspecificacionesLodos"%>
<%@page import="Persistencia.DaoProductoLodo"%>
<%@page import="Modelo.ControlLodo"%>
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

        <title>Certificado_PL</title>

    </head>
    <body onload="inicializarCalculo()">
        <%
            int id = Integer.parseInt((String) request.getAttribute("idpdf"));
            ControlLodo controlLodo = DaoProductoLodo.listarpdf(id);
            List<Consecutivo> listaConsecutivos = DaoConsecutivo.listarConsPDF(controlLodo.getIdControlCalidad());
            List<EspecificacionesLodos> listaEsp = DaoEspecificacionesLodos.listarEspPDF(controlLodo.getIdControlCalidad());
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
                                    Datos Certificado de Calidad
                                </span>
                            </a>
                        </li>
                    </ul>
                    <ul class="navbar-nav mb-3 mb-lg-0 float-start ">   
                        <li class="nav-item ">
                            <a class="nav-link active" aria-current="page" href="./index3.jsp">
                                <span  style="margin-left: 10px; border:none" class="btn btn-outline-light">
                                    <i class="bi bi-arrow-left-square-fill text-dark"></i><b> Inicio</span> </a></b>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="ControladorPL?accion=listar">
                                <span style="margin-left: 10px; border:none" class="btn btn-outline-light">
                                    <i <i class="fas fa-list"></i><b> Cancelar </span></a></b>
                        </li>

                    </ul>


                </div>
            </div>
        </nav>


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
                margin-top: 10px;
                padding: 5 px 5px;
            }


            .text-default {
                color: #000;
            }



        </style>
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
                margin-top: 20px;
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


        <main>
            <!--Barra de Navegacion -->
            <%--  readonly=""   sirve para bloquear   --%>
            <br>
            <br>

            <%--  Formulario   --%>
            <form class="formulario" id="formulario"  action="ControladorReporteLodo" method="POST" class="custom-form">         
                <div class="formulario__grupo" id="grupo__FechaC">      
                    <h4  id="h4_" class="text-primary elegant-font">CONSECUTIVO</h4> 
                </div>
                <div class="formulario__grupo" id="grupo__FechaC">      

                </div>
                <%-- ********** Consecutivo **************** --%>
                <% for (Consecutivo consecutivo : listaConsecutivos) {%>


                <div class="formulario__grupo" id="grupo__FechaC">
                    <label class="formulario__label" for="pH">Fecha Certificado</label>
                    <input readonly=""  type="date" class="formulario__input"
                           id="fp" value="<%=consecutivo.getFechaCertificado()%>"
                           name="fechaCertificado" placeholder="Ingrese Dato">
                </div>

                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label" for="lote"> Lote</label>
                    <input readonly="" type="text" class="formulario__input" id="lote" 
                           value="<%=consecutivo.getLote()%>" name="lote"
                           placeholder="Ingrese Dato">
                </div>
                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label" for="br"> Num Consecutivo </label>
                    <input  readonly="" type="text" class="formulario__input" id="br"
                            value="<%=consecutivo.getIdconsecutivo()%>"
                            name="numCertificado" placeholder="Ingrese Dato">
                </div>
                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label" for="numRemision"> Num Remision</label>
                    <input 
                        readonly=""
                        type="text"
                        class="formulario__input"
                        id="numRemision" 
                        value="<%=consecutivo.getNroRemision()%>"
                        name="numRemision" 
                        placeholder="Ingrese Dato">
                </div>

                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label" for="CantidadKg"> Cant Kg </label>
                    <input 
                        readonly="" 
                        type="text"
                        class="formulario__input"
                        id="CantidadKg" 
                        value="<%=consecutivo.getCantidadMaterial()%>"
                        name="CantidadKg" 
                        placeholder="Ingrese Dato">
                </div>

                <!-- Metodo Java para optener el nombre de la referencia y quitarle el punto al final  -->                        
                <%--    <%
                    String producto = DaoProductoSeco.obtenerProductoFinal(controlLodo.getIdControlCalidad());
                    if (producto != null && producto.endsWith(".")) {
                        producto = producto.substring(0, producto.length() - 1);
                    }
                %>
                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label" for="productos">Referencia</label>
                    <input  
                        style="font-weight: bold; color: #09f;"
                        readonly="" 
                        type="text" 
                        id="productos" 
                        name="productos"
                        class="formulario__input" 
                        value="<%= producto%>">
                </div>
                --%>


                <!-- Metodo Java para optener el nombre de la referencia y quitarle el punto al final  -->   
                <%
                    String producto = DaoProductoSeco.obtenerProductoFinal(controlLodo.getIdControlCalidad());
                    String sufijo = " CN";
                    if (producto != null && producto.endsWith(sufijo)) {
                        producto = producto.substring(0, producto.length() - sufijo.length());
                    }
                %>
                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label" for="productos">Referencia</label>
                    <input  
                        readonly="" 
                        type="text" 
                        id="productos" 
                        name="productos"
                        class="formulario__input" 
                        value="<%= producto%>">
                </div>



                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label" for="cliente">Cliente</label>
                    <input 
                        style="font-weight: bold; color: #09f;"
                        readonly=""
                        type="text" 
                        id="cliente"
                        name="cliente"
                        class="formulario__input" 
                        value="<%= DaoProductoSeco.obtenerclienteFinal(controlLodo.getIdControlCalidad())%>">
                </div>

                <!-- Grupo: Auxiliar -->
                <%--
    <div class="formulario__grupo" id="grupo__solidos">
        <label  class="formulario__label" for="Auxiliar">Usuario</label>
        <input 
            readonly="" 
            type="text" 
            id="Auxiliar"
            name="Auxiliar"
            class="form-control" 
            value="<%= DaoProductoSeco.obtenerUserFinal(controlLodo.getIdControlCalidad())%>">
    </div>
                --%>

                <!-- Grupo: Auxiliar -->
                <div class="formulario__grupo" id="grupo__User">   
                    <label class="formulario__label" for="idUsuarios"> Auxiliar</label>
                    <select class="formulario__input"                           
                            style="border: 2px solid #ffdf7e; color: #000; font-weight: bold" 
                            id="idusuario" 
                            name="idusuario"
                            onchange="updateUser()" 
                            >
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
                    <input type="hidden" id="Auxiliar" name="Auxiliar" value="<%= controlLodo.getIdUsuarios()%>">
                    <p style=" font-weight: bold; color: #005cbf; margin-top: 5px;" class="psolidos">Seleccione Auxiliar Responsable!</p>
                </div>


                <% }%>

                <div class="formulario__grupo" id="grupo__FechaC">      
                    <h4  id="h4_" class="text-primary elegant-font">TERMINADO</h4> 
                </div>
                <div class="formulario__grupo" id="grupo__FechaC">      

                </div>

                <!-- Grupo: Fecha -->
                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label" for="Solidos">% Solidos</label>
                    <input  
                         readonly="" 
                        style="  font-weight: bold;  background:  #F2F2F2;" 
                        type="text" 
                        class="formulario__input" 
                        id="Solidos" 
                        value="<%= Math.round(controlLodo.getSolidos() * 10) / 10.0%>" 
                        name="Solidos" 
                        onkeyup="calcularDensidades(this);" 
                        onblur="validarSolidos(this);">
               
                </div>

                <!-- Grupo: Humedad -->
                <div class="formulario__grupo" id="grupo__solidos">
                    <label  style="display: none;" class="formulario__label"  for="humedad">% Humedad</label>
                    <input 
                        type="hidden" 
                        type="text" class="formulario__input" 
                        readonly="" id="humedad"
                        value="<%=controlLodo.getHumedad()%>" 
                        name="humedad"  >                             
                </div>

                <!-- Grupo: Densidad g/l -->
                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label"  for="densidadg">Densidad g/L</label>
                    <input
                        style="font-weight: bold; color: #09f;background: #fcf8e3;"
                        type="text" 
                        class="formulario__input" 
                        id="densidadg" 
                        readonly="" 
                        name="densidadg">
                </div>

                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label"  for="densidadkggal">Densidad Kg/gal</label>
                    <input 
                        style="font-weight: bold; color: #09f;background: #fcf8e3;"
                        type="text"
                        class="formulario__input" 
                        id="densidadkggal" 
                        readonly=""   
                        name="densidadkggal"  >                             
                </div>
                
                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label"  for="ufc">UFC</label>
                    <input readonly=""  type="text" class="formulario__input" id="ufc" 
                           name="ufc" value="<100" >                             
                </div>
                
                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label"  for="ufcTiempo">Tiempo Estabilidad</label>
                    <input readonly="" type="text" class="formulario__input" id="ufcTiempo" 
                           name="ufcTiempo" value="30" >                             
                </div>

                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label"  for="retenido325"> % Ret 325 </label>
                    <input readonly="" type="text" class="formulario__input" 
                           id="retenido325" value="<%=controlLodo.getRetenido325()%>" 
                           name="retenido325" 
                           placeholder="Ingrese ">
                </div>
                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label"  for="pH"> pH </label>
                    <input 
                        readonly=""
                        type="text" 
                        class="formulario__input" 
                        id="pH" 
                        value="<%= Math.round(controlLodo.getpH() * 10) / 10.0%>" 
                        name="pH" 
                        placeholder="Ingrese ">
                </div>
                <!-- Comentario sobre como redodendear
                En este caso, controlLodo.getpH() * 10 multiplica el valor por 10,
                Math.round redondea el resultado al entero más cercano,
                y luego se divide por 10 para obtener el valor redondeado 
                a un decimal. De esta forma, 6.92 se convierte en 6.9 y 6.96 se convierte en 7.0.
                -->

                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label"  for="viscosidadCp"> Visicosidad cP </label>
                    <input 
                        readonly="" 
                        type="text" 
                        class="formulario__input" 
                        id="viscosidadCp"
                        value="<%= Math.round(controlLodo.getViscosidadCp())%>" 
                        name="viscosidadCp" 
                        placeholder="Ingrese ">
                </div>

                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label"  for="viscosidadKu"> Visicosidad Ku </label>
                    <input readonly="" type="text" class="formulario__input" 
                           id="viscosidadKu" value="<%=controlLodo.getViscosidadKu()%>" 
                           name="viscosidadKu" 
                           placeholder="Ingrese ">
                </div>

                <!-- Titulo 1 -->
                <!--    <p style="background: #ffdf7e; font-size: 14px; padding: 5px;">Color</p> -->

                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label" for="Br"> Br </label>
                    <input 
                        readonly=""
                        type="text" class="formulario__input"
                        id="Br" 
                        value="<%= Math.round(controlLodo.getBrigh() * 10) / 10.0%>" 
                        name="Br"
                        placeholder="Ingrese Dato">
                </div>
                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label" for="Wh"> Wh </label>
                    <input 
                        readonly=""
                        type="text" 
                        class="formulario__input" 
                        id="Wh" 
                        value="<%= Math.round(controlLodo.getWhitness() * 10) / 10.0%>" 
                        name="Wh" 
                        placeholder="Ingrese Dato">
                </div>

                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label" for="Br"> Br-Leneta </label>
                    <input 
                        readonly="" 
                        type="text" 
                        class="formulario__input"
                        id="Brigh_Leneta" 
                        value="<%= Math.round(controlLodo.getBrigh_Leneta() * 10) / 10.0%>" 
                        name="Br_Leneta"
                        placeholder="Ingrese Dato">
                </div>
                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label" for="Wh"> Wh-Leneta </label>
                    <input 
                        readonly="" 
                        type="text" 
                        class="formulario__input" 
                        id="Wh_Leneta" 
                        value="<%= Math.round(controlLodo.getWhitness_Leneta() * 10) / 10.0%>" 
                        name="Wh_Leneta"
                        placeholder="Ingrese Dato">
                </div>

                <!-- Titulo 2 -->
                <!--   <h6 style="background: #ffdf7e; font-size: 11px">Tamaño Particula</h6> -->

                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label" for="Dv50"> Dv(50)</label>
                    <input 
                        readonly="" 
                        type="text"
                        class="formulario__input" id="Dv50" 
                        value="<%= Math.round(controlLodo.getDv50() * 10) / 10.0%>" 
                        name="Dv50" 
                        placeholder="Ingrese Dato">
                </div>
                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label" for="Dv90"> Dv(90)</label>
                    <input 
                        readonly=""
                        type="text" 
                        class="formulario__input"
                        id="Dv90" 
                        value="<%= Math.round(controlLodo.getDv90() * 10) / 10.0%>" 
                        name="Dv90"
                        placeholder="Ingrese Dato">
                </div>
                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label" for="AA"> % AA </label>
                    <input
                        readonly=""
                        type="text" 
                        class="formulario__input" 
                        id="AA"
                        value="<%= Math.round(controlLodo.getAbs_Aceite() * 10) / 10.0%>" 
                        name="AA" 
                        placeholder="Ingrese ">
                </div>

                <div class="formulario__grupo" id="grupo__solidos">
                    <label class="formulario__label" for="idConsecutivo">ID Consecutivo</label>
                    <input type="text" class="formulario__input" id="idConsecutivo" readonly="" value="<%=controlLodo.getIdConsecutivo()%>"
                           placeholder="Ingrese Dato">
                </div>                         

        </main>
        <main>

            <div class="formulario__grupo"> 
                <input class="form-check-input btn-success custom-checkbox" type="checkbox" id="invalidCheck" required>
                <label class="formulario__label3"  id="labelconfirmar" class="form-check-label mb-4" for="invalidCheck">
                    <b>CONFIRMAR</b>                  
                </label>

            </div>
            <div class="formulario__grupo formulario__grupo-btn-enviar">
                <button type="submit" name="accion" value="registrar" class="btn btn-danger ">
                    <i class="bi bi-file-earmark-pdf-fill "></i> GENERAR PDF
                </button>
                <div class="formulario__grupo formulario__grupo-btn-enviar">
                    <a class="nav-link active" aria-current="page" href="ControladorPL?accion=listar">
                        <span style="margin-left: 10px; border:none" class="btn btn-secondary">
                            <i <i class="fas fa-list"></i><b> Cancelar </span></a></b>

                </div> 
            </div> 



            <br>

            <%-- ********** Especificaciones **************** --%>

            <p  style=" font-size: 14px; padding:5px;" class="text-primary text-center elegant-font">
                <b>ESPECIFICACIONES</b></p>


            <!-- Titulo 2 -->
            <p style=" font-size: 14px; padding: 5px;">En este espacio se carga la información de Especificaciones.</p>

            <% for (EspecificacionesLodos especificaciones : listaEsp) {%>

            <div class="form-group text-left">
                <label style="display: none;" for="variableEsp1" class="text-left"><b style="color: #28a745;">Variable # 1</b></label>
                <input type="hidden" type="text" class="formulario__input" id="variableEsp1" name="variableEsp1" value="<%=especificaciones.getVariableEsp1()%>"   
                       placeholder="Ingrese Variable">
            </div> 
            <div class="form-group text-left">
                <label style="display: none;" for="rango1" class="text-left">Rango # 1</label>
                <input type="hidden" type="text" class="formulario__input" id="rango1" name="rango1" value="<%=especificaciones.getRango1()%>"
                       placeholder="Ingrese Rango">
            </div>   

            <div class="form-group text-left">
                <label style="display: none;" for="metodo1" class="text-left">Metodo # 1 </label>
                <input type="hidden" type="text" class="formulario__input" id="metodo1" name="metodo1" value="<%=especificaciones.getMetodo1()%>"
                       placeholder="Ingrese Rango">
            </div>        

            <div class="form-group text-left">
                <label style="display: none;" for="variableEsp2" class="text-left"><b style="color: #28a745;">Variable # 2</b></label>
                <input  type="hidden" type="text" class="formulario__input" id="variableEsp2" name="variableEsp2" value="<%=especificaciones.getVariableEsp2()%>" 
                        placeholder="Ingrese Variable">
            </div> 
            <div class="form-group text-left">
                <label style="display: none;" for="rango2" class="text-left">Rango # 2</label>
                <input type="hidden" type="text" class="formulario__input" id="rango2" name="rango2" value="<%=especificaciones.getRango2()%>"
                       placeholder="Ingrese Rango">
            </div> 
            <div class="form-group text-left">
                <label style="display: none;" for="metodo2" class="text-left">Metodo # 2 </label>
                <input type="hidden" type="text" class="formulario__input" id="metodo2" name="metodo2" value="<%=especificaciones.getMetodo2()%>"
                       placeholder="Ingrese Rango">
            </div>    

            <div class="form-group text-left">
                <label style="display: none;" for="variableEsp3" class="text-left"><b style="color: #28a745;">Variable # 3</b></label>
                <input type="hidden" type="text" class="formulario__input" id="variableEsp3" name="variableEsp3" value="<%=especificaciones.getVariableEsp3()%>"
                       placeholder="Ingrese Variable">
            </div> 
            <div class="form-group text-left">
                <label style="display: none;" for="rango3" class="text-left">Rango # 3</label>
                <input type="hidden" type="text" class="formulario__input" id="rango3" name="rango3" value="<%=especificaciones.getRango3()%>"
                       placeholder="Ingrese Rango">
            </div> 
            <div class="form-group text-left">
                <label  style="display: none;" for="metodo3" class="text-left">Metodo # 3 </label>
                <input type="hidden" type="text" class="formulario__input" id="metodo3" name="metodo3" value="<%=especificaciones.getMetodo3()%>"
                       placeholder="Ingrese Rango">
            </div>       

            <div class="form-group text-left">
                <label style="display: none;" for="variableEsp4" class="text-left"><b style="color: #28a745;">Variable # 4</b></label>
                <input type="hidden" type="text" class="formulario__input" id="variableEsp4" name="variableEsp4" value="<%=especificaciones.getVariableEsp4()%>"
                       placeholder="Ingrese Variable">
            </div> 

            <div class="form-group text-left">
                <label style="display: none;" for="rango4" class="text-left">Rango # 4</label>
                <input type="hidden" type="text" class="formulario__input" id="rango4" name="rango4" value="<%=especificaciones.getRango4()%>"
                       placeholder="Ingrese Rango">
            </div> 
            <div class="form-group text-left">
                <label style="display: none;" for="metodo4" class="text-left">Metodo # 4 </label>
                <input type="hidden" type="text" class="formulario__input" id="metodo4" name="metodo4" value="<%=especificaciones.getMetodo4()%>"
                       placeholder="Ingrese Rango">
            </div>       

            <div class="form-group text-left">
                <label  style="display: none;" for="variableEsp5" class="text-left"><b style="color: #28a745;">Variable # 5</b></label>
                <input type="hidden" type="text" class="formulario__input" id="variableEsp5" name="variableEsp5" value="<%=especificaciones.getVariableEsp5()%>"
                       placeholder="Ingrese Variable">
            </div> 
            <div class="form-group text-left">
                <label style="display: none;" for="rango5" class="text-left">Rango # 5</label>
                <input type="hidden" type="text" class="formulario__input" id="rango5" name="rango5" value="<%=especificaciones.getRango5()%>"
                       placeholder="Ingrese Rango">
            </div> 

            <div class="form-group text-left">
                <label style="display: none;" for="metodo5" class="text-left">Metodo # 5 </label>
                <input type="hidden" type="text" class="formulario__input" id="metodo5" name="metodo5" value="<%=especificaciones.getMetodo5()%>"
                       placeholder="Ingrese Rango">
            </div>      
            <div class="form-group text-left">
                <label style="display: none;" for="variableEsp6" class="text-left"><b style="color: #28a745;">Variable # 6</b></label>
                <input type="hidden" type="text" class="formulario__input" id="variableEsp6" name="variableEsp6" value="<%=especificaciones.getVariableEsp6()%>"
                       placeholder="Ingrese Variable">
            </div> 
            <div class="form-group text-left">
                <label style="display: none;" for="rango6" class="text-left">Rango # 6</label>
                <input type="hidden" type="text" class="formulario__input" id="rango6" name="rango6" value="<%=especificaciones.getRango6()%>"
                       placeholder="Ingrese Rango">
            </div> 

            <div class="form-group text-left">
                <label style="display: none;" for="metodo6" class="text-left">Metodo # 6 </label>
                <input type="hidden" type="text" class="formulario__input" id="metodo6" name="metodo6" value="<%=especificaciones.getMetodo6()%>"
                       placeholder="Ingrese Rango">
            </div>     

            <%-- *************  Inicio Columna 2  **********---%>  

            <div class="form-group text-left">
                <label style="display: none;" for="variableEsp7" class="text-left"><b style="color: #28a745;">Variable # 7</b></label>
                <input  type="hidden"  type="text" class="formulario__input" id="variableEsp7" name="variableEsp7" value="<%=especificaciones.getVariableEsp7()%>"
                        placeholder="Ingrese Variable">
            </div> 
            <div class="form-group text-left">
                <label style="display: none;" for="rango7" class="text-left">Rango # 7</label>
                <input type="hidden" type="text" class="formulario__input" id="rango7" name="rango7" value="<%=especificaciones.getRango7()%>"
                       placeholder="Ingrese Rango">
            </div> 
            <div class="form-group text-left">
                <label style="display: none;"  for="metodo7" class="text-left">Metodo # 7 </label>
                <input type="hidden"  type="text" class="formulario__input" id="metodo7" name="metodo7" value="<%=especificaciones.getMetodo7()%>"
                       placeholder="Ingrese Rango">
            </div>   

            <div class="form-group text-left">
                <label style="display: none;" for="variableEsp8" class="text-left"><b style="color: #28a745;">Variable # 8</b></label>
                <input type="hidden" type="hidden" type="text" class="formulario__input" id="variableEsp8" name="variableEsp8" value="<%=especificaciones.getVariableEsp8()%>"
                       placeholder="Ingrese Variable">
            </div> 
            <div class="form-group text-left">
                <label style="display: none;" for="rango8" class="text-left">Rango # 8</label>
                <input type="hidden" type="text" class="formulario__input" id="rango8" name="rango8" value="<%=especificaciones.getRango8()%>"  
                       placeholder="Ingrese Rango">
            </div> 

            <div class="form-group text-left">
                <label style="display: none;" for="metodo8" class="text-left">Metodo # 8 </label>
                <input type="hidden" type="text" class="formulario__input" id="metodo8" name="metodo8" value="<%=especificaciones.getMetodo8()%>"
                       placeholder="Ingrese Rango">
            </div>   
            <div class="form-group text-left">
                <label style="display: none;" for="variableEsp9" class="text-left"><b style="color: #28a745;">Variable # 9</b></label>
                <input type="hidden" type="text" class="formulario__input" id="variableEsp9" name="variableEsp9" value="<%=especificaciones.getVariableEsp9()%>"
                       placeholder="Ingrese Variable">
            </div> 
            <div class="form-group text-left">
                <label style="display: none;" for="rango9" class="text-left">Rango # 9</label>
                <input type="hidden" type="text" class="formulario__input" id="rango9" name="rango9" value="<%=especificaciones.getRango9()%>"  
                       placeholder="Ingrese Rango">
            </div> 
            <div class="form-group text-left">
                <label  style="display: none;" for="metodo9" class="text-left">Metodo # 9 </label>
                <input type="hidden"< type="text" class="formulario__input" id="metodo9" name="metodo9" value="<%=especificaciones.getMetodo9()%>"
                       placeholder="Ingrese Rango">
            </div>   

            <div class="form-group text-left">
                <label style="display: none;" for="variableEsp10" class="text-left"><b style="color: #28a745;">Variable # 10</b></label>
                <input type="hidden" type="text" class="formulario__input" id="variableEsp10" name="variableEsp10" value="<%=especificaciones.getVariableEsp10()%>"
                       placeholder="Ingrese Variable">
            </div> 
            <div class="form-group text-left">
                <label style="display: none;" for="rango10" class="text-left">Rango # 10</label>
                <input type="hidden" type="text" class="formulario__input" id="rango10" name="rango10" value="<%=especificaciones.getRango10()%>"  
                       placeholder="Ingrese Rango">
            </div> 

            <div class="form-group text-left">
                <label style="display: none;" for="metodo10" class="text-left">Metodo # 10 </label>
                <input type="hidden" type="text" class="formulario__input" id="metodo10" name="metodo10" value="<%=especificaciones.getMetodo10()%>"
                       placeholder="Ingrese Rango">
            </div>   
            <div class="form-group text-left">
                <label style="display: none;" for="variableEsp11" class="text-left"><b style="color: #28a745;">Variable # 11</b></label>
                <input type="hidden"  type="text" class="formulario__input" id="variableEsp11" name="variableEsp11" value="<%=especificaciones.getVariableEsp11()%>"
                       placeholder="Ingrese Variable">
            </div> 
            <div class="form-group text-left">
                <label style="display: none;" for="rango11" class="text-left">Rango # 11</label>
                <input type="hidden" type="text" class="formulario__input" id="rango11" name="rango11" value="<%=especificaciones.getRango11()%>"  
                       placeholder="Ingrese Rango">
            </div> 
            <div class="form-group text-left">
                <label style="display: none;" for="metodo11" class="text-left">Metodo # 11 </label>
                <input type="hidden"  type="text" class="formulario__input" id="metodo11" name="metodo11" value="<%=especificaciones.getMetodo11()%>"
                       placeholder="Ingrese Rango">
            </div>       

            <!-- Variables Nuevas para L1117 -->

            <div class="form-group text-left">
                <label style="display: none;"  for="variableEsp12" class="text-left"><b style="color: #28a745;">Variable # 12</b></label>
                <input type="hidden" type="text" class="formulario__input" id="variableEsp12" name="variableEsp12" value="<%=especificaciones.getVariableEsp12()%>"
                       placeholder="Ingrese Variable">
            </div> 

            <div class="form-group text-left">
                <label style="display: none;"  for="rango12" class="text-left">Rango # 12</label>
                <input type="hidden" type="text" class="formulario__input" id="rango12" name="rango12" value="<%=especificaciones.getRango12()%>"  
                       placeholder="Ingrese Rango">
            </div> 

            <div class="form-group text-left">
                <label style="display: none;"  for="metodo12" class="text-left">Metodo # 12 </label>
                <input type="hidden"  type="text" class="formulario__input" id="metodo12" name="metodo12" value="<%=especificaciones.getMetodo12()%>"
                       placeholder="Ingrese Rango">
            </div>      

            <div class="form-group text-left">
                <label  style="display: none;"  for="variableEsp13" class="text-left"><b style="color: #28a745;">Variable # 13</b></label>
                <input type="hidden"  type="text" class="formulario__input" id="variableEsp13" name="variableEsp13" value="<%=especificaciones.getVariableEsp13()%>"
                       placeholder="Ingrese Variable">
            </div> 

            <div class="form-group text-left">
                <label style="display: none;" for="rango13" class="text-left">Rango # 13</label>
                <input type="hidden" type="text" class="formulario__input" id="rango12" name="rango13" value="<%=especificaciones.getRango13()%>"  
                       placeholder="Ingrese Rango">
            </div> 

            <div class="form-group text-left">
                <label style="display: none;"  for="metodo13" class="text-left">Metodo # 13 </label>
                <input  type="hidden" type="text" class="formulario__input" id="metodo13" name="metodo13" value="<%=especificaciones.getMetodo13()%>"
                        placeholder="Ingrese Rango">
            </div>       


            <% }%>



        </form>

    </main>

    <h1>${mensaje}</h1>



    <%--Final  --%>


    <!-- Función para capturar el nombre del cliente y enviarlo como String -->
    <script>
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





    <%--FUNSION PARA VALIDAR CALCULO DE DENSIDAD SEGUN PRODUCTO  --%>
    <script>
        function calcularDensidades(solidosInput) {
            var valor = solidosInput.value;
            var densidadgInput = document.getElementById("densidadg");
            var densidadkggalInput = document.getElementById("densidadkggal");
            var producto = document.getElementById("productos").value;

            // Verificar si el valor ingresado es un número decimal válido
            var solidosDouble = parseFloat(valor);

            if (!isNaN(solidosDouble)) {
                var densidadgDouble;
                var densidadkggalDouble;

                switch (producto) {
                    case 'CAOMIN L055':
                        densidadgDouble = (162.5 / (162.5 - solidosDouble));
                        densidadkggalDouble = (densidadgDouble * 3.785);
                        break;
                    case 'OPTIMIN L1117':
                        densidadgDouble = (161.35 / (161.35 - solidosDouble));
                        densidadkggalDouble = (densidadgDouble * 3.785);
                        break;
                    case 'OPTIMIN EXTEND MAX V5':
                        densidadgDouble = (161.35 / (161.35 - solidosDouble));
                        densidadkggalDouble = (densidadgDouble * 3.785);
                        break;
                    case 'OPTIMIN EXTEND MAX':
                        densidadgDouble = (161.35 / (161.35 - solidosDouble));
                        densidadkggalDouble = (densidadgDouble * 3.785);
                        break;
                    default:
                        // Default calculation or handle unknown product
                        densidadgDouble = (161.35 / (161.35 - solidosDouble));
                        densidadkggalDouble = (densidadgDouble * 3.785);
                        break;
                }

                densidadgInput.value = densidadgDouble.toFixed(3); // Limitar a 3 decimales y asignar a Densidad g/L
                densidadkggalInput.value = densidadkggalDouble.toFixed(2); // Limitar a 2 decimales y asignar a Densidad kg/gal
            } else {
                densidadgInput.value = ''; // Limpiar el campo de "Densidad g/L" si Solidos no es un número válido
                densidadkggalInput.value = ''; // Limpiar el campo de "Densidad kg/gal" si Solidos no es un número válido
            }
        }

        function inicializarCalculo() {
            var solidosInput = document.getElementById("Solidos");
            calcularDensidades(solidosInput);
        }
    </script>

    <!--Funsion Validacion para ceritificado  -->
    <script>

        const productSpecs = {
            "OPTIMIN EXTEND MAX": {
                solidos: /\b(?:52(\.\d+)?|53(\.[0-9]{1,2})?)\b/, // Rango 52-54
                pH: /\b(?:6\.9(\d{1,2})?|7(\.[0-9]{1,2})?|8\.0\d?|8\.1\d?)\b/, // Rango 6.9-8.1
                ku: /\b(?:6[4-9](\.\d+)?|7\d(\.\d+)?|8[0-5](\.\d+)?|86(?:\.0|(?=$)))\b/, //Rango 75-86 
                r325: /\b0\.(0[1-9]|10)\b/, //Rango Max 0.10        
                Wh: /\b(?:78(\.\d+)?|79(\.\d+)?|80(\.\d+)?|81(\.\d+)?|82(\.\d+)?|83(\.\d+)?|84(\.0))\b/  //Rango 78-84
            },
            "OPTIMIN EXTEND MAX V5": {
                solidos: /\b(?:52(\.\d+)?|53(\.[0-9]{1,2})?)\b/, //Rango 52-54
                pH: /\b(?:6\.9(\d{1,2})?|7(\.[0-9]{1,2})?|8\.[0-6](\d{1,2})?|8\.70(\.0{1,2})?)\b/, //Rango 6,9-8,7
                ku: /\b(?:60(\.\d+)?|6[0-9](\.\d+)?|70\.0)\b/, //Rango 60-70
                Brigh: /\b(?:89(\.\d+)?|9[0-2](\.\d+)?|93\.0)\b/, //Rango 89-93
                Wh: /\b(?:85(\.\d+)?|8[6-9](\.\d+)?|90\.0)\b/ //Rango 85-90
            },
            "CAOMIN L055": {
                solidos: /\b(?:50(\.\d+)?|51(\.[0-9]{1,2})?)\b/, // Rango = 50-52
                pH: /\b(?:6(\.\d{1,2})?|7(\.\d{1,2})?|8(\.0))\b/, // Rango = 6.0-8.0
                r325: /\b0\.(0[1-9]|[1-3][0-9]|[1-3][0-9]{2}|40)\b/, // Rango = 0.40 Max
                ku: /^(?:7[5-9](?:\.\d{1,2})?|8[0-9](?:\.\d{1,2})?|90(?:\.\d{1,2})?|91(?:\.\d{1,2})?|92(?:\.\d{1,2})?|93(?:\.\d{1,2})?|94(?:\.\d{1,2})?|95(?:\.0{0,2})?)$/, // Rango = 75-95
                cP: /^(?:100(?:\.\d{1,2})?|[1-7]\d{2}(?:\.\d{1,2})?|800(?:\.0{0,2})?)$/, // Rango = MAx 800
                Brigh: /^(?:7[8-9](?:\.\d{1,2})?|8[0-3](?:\.\d{1,2})?|84(?:\.0{0,2})?)$/, // Rango = 78-84
                Wh: /\b(?:61(\.\d+)?|6[2-9](\.\d+)?|70(\.0))\b/, // Rango = 61-70
                Dv50: /\b(?:8(\.\d+)?|9(\.\d+)?|10(\.\d+)?|11(\.\d+)?|12(\.0))\b/ // Rango = 8-12
            },
            "OPTIMIN L1117": {
                solidos: /\b(?:52(\.\d+)?|53(\.[0-9]{1,2})?)\b/,
                pH: /\b(?:6(?:\.0{1,2}|(?:\.[0-9]{1,2})?)|7(?:\.0{1,2}|(?:\.[0-9]{1,2})?)|8\.0{1,2})\b/, //Rango 6  - 8.0
                r325: /\b0\.(0[1-9]|[1-4][0-9]|50)\b/,
                ku: /\b(?:5[7-9](\.\d+)?|6[0-9](\.\d+)?|70(?:\.0{1,2})?)\b/, //Rango 57-70.0
                //  cP: /\b(?:300(\.\d+)?|3\d{2}(\.\d+)?|4\d{2}(\.\d+)?|5\d{2}(\.\d+)?|600(\.0+)?)\b/,
                Brigh: /\b(?:78(\.\d+)?|79(\.\d+)?|80(\.\d+)?|81(\.\d+)?|82(\.\d+)?|83(\.\d+)?|84(\.0))\b/, //Rango 78-84
                Wh: /^(?:6[5-9](?:\.\d{1,2})?|70(?:\.\d{1,2})?|71(?:\.0{1,2})?)$/, //Rango 65-71
                Brigh_Leneta: /\b(?:78(\.\d+)?|79(\.\d+)?|80(\.\d+)?|81(\.\d+)?|82(\.\d+)?|83(\.\d+)?|84(\.0))\b/, //Rango 78-84
                Wh_Leneta: /^(?:6[5-9](?:\.\d{1,2})?|70(?:\.\d{1,2})?|71(?:\.0{1,2})?)$/, //Rango 65-71
                Dv50: /^(?:7\.5\d*|7\.[6-9]\d*|8\.\d*|9\.\d*|10\.\d*|11\.\d*|12(?:\.0{1,2})?)$/, //Rango 7.5-12.0
                Dv90: /^(?:28\.0|28\.[0-9]{1,2}|29\.[0-9]{1,2}|30\.[0-9]{1,2}|31\.[0-9]{1,2}|32\.[0-9]{1,2}|33\.[0-9]{1,2}|34\.[0-9]{1,2}|35\.0)$/ //Rango 28-35
            }
        };

        function validateFields() {
            const product = document.getElementById('productos').value.trim();
            const solidos = document.getElementById('Solidos').value.trim();
            const pH = document.getElementById('pH').value.trim();
            const ku = document.getElementById('viscosidadKu').value.trim();
            const cP = document.getElementById('viscosidadCp').value.trim();
            const Brigh = document.getElementById('Br').value.trim();
            const Wh = document.getElementById('Wh').value.trim();
            const r325 = document.getElementById('retenido325').value.trim();
            const Dv50 = document.getElementById('Dv50').value.trim();
            const Dv90 = document.getElementById('Dv90').value.trim();
            const Brigh_Leneta = document.getElementById('Brigh_Leneta').value.trim();
            const Wh_Leneta = document.getElementById('Wh_Leneta').value.trim();


            const specs = productSpecs[product];
            if (specs) {
                let errors = [];
                if (!validateField(solidos, specs.solidos, 'Solidos'))
                    errors.push('Solidos');
                if (!validateField(pH, specs.pH, 'pH'))
                    errors.push('pH');
                if (!validateField(ku, specs.ku, 'viscosidadKu'))
                    errors.push('viscosidadKu');
                if (!validateField(cP, specs.cP, 'viscosidadCp'))
                    errors.push('viscosidadCp');
                if (!validateField(Brigh, specs.Brigh, 'Br'))
                    errors.push('Br');
                if (!validateField(Wh, specs.Wh, 'Wh'))
                    errors.push('Wh');
                if (!validateField(r325, specs.r325, 'retenido325'))
                    errors.push('retenido325');
                if (!validateField(Dv50, specs.Dv50, 'Dv50'))
                    errors.push('Dv50');
                if (!validateField(Dv90, specs.Dv90, 'Dv90'))
                    errors.push('Dv90');
                if (!validateField(Wh_Leneta, specs.Wh_Leneta, 'Wh_Leneta'))
                    errors.push('Wh_Leneta');
                if (!validateField(Brigh_Leneta, specs.Brigh_Leneta, 'Brigh_Leneta'))
                    errors.push('Brigh_Leneta');

                if (errors.length > 0) {
                    Swal.fire({
                        title: 'Error',
                        html: 'Los siguientes campos tienen Errores!, <span style="color: #09f; font-weight: bold;">Edite! Producto Terminado Lodo</span>',
                        icon: 'error'
                    });
                } else {
                    Swal.fire({
                        title: 'Éxito',
                        html: 'Aprobado! Generar PDF',
                        icon: 'success'
                    });
                }
            } else {
                console.warn(`Producto no reconocido: ${product}`);
            }
        }

        function validateField(value, regex, fieldId) {
            const field = document.getElementById(fieldId);
            if (!value || (regex && !regex.test(value))) {
                field.style.borderColor = 'red';
                field.style.backgroundColor = '#ffcccc'; // fondo rojo claro
                field.style.fontWeight = 'bold'; // texto en negrita
                return false;
            } else {
                field.style.borderColor = 'green';
                field.style.backgroundColor = '#ccffcc'; // fondo verde claro
                field.style.fontWeight = 'bold'; // texto en negrita
                return true;
            }
        }

        function showAlert(title, text, icon) {
            Swal.fire({
                title: title,
                text: text,
                icon: icon,
                confirmButtonText: 'OK'
            });
        }

// Llamar a la función validateFields en la carga inicial de la página si es necesario
        document.addEventListener('DOMContentLoaded', validateFields);


    </script>



    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <!-- SweetAlert JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>

    <!-- Bootstrap CSS y JavaScript -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous">
    </script>

</body>        
</html>
