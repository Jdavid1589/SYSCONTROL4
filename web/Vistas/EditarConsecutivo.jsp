<%@page import="Persistencia.DaoEspecificacionesSeco"%>
<%@page import="Modelo.EspecificacionesSeco"%>
<%@page import="Persistencia.DaoUsuarios"%>
<%@page import="Persistencia.DaoProductos"%>
<%@page import="Modelo.Productos"%>
<%@page import="Persistencia.DaoConsecutivo"%>
<%@page import="Modelo.Consecutivo"%>
<%@page import="Modelo.Clientes"%>

<%@page import="Persistencia.DaoClientes"%>
<%@page import="Modelo.Usuarios"%>
<%@page import="java.util.List"%>
<%@page import="Persistencia.DaoDocumento"%>
<%@page import="Modelo.Documento"%>
<%@page import="Persistencia.DaoPerfil"%>
<%@page import="Modelo.Perfil"%>
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



        <link href="Vistas/Estilos_css/EstilosPL2.css" rel="stylesheet" type="text/css"/>

        <title>Editar Consecutivo</title>

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
                                <span  style="margin-left: 10px; border:none; font-size: 16px" class="btn btn-outline-light">
                                    <i class="bi bi-arrow-left-square-fill text-dark"></i><b> Inicio</span>
                            </a></b>

                        </li><li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="ControladorClientes?accion=listar">
                                <span  style="margin-left: 10px; border:none; font-size: 16px" class="btn btn-outline-light">
                                    <i <i class="fas fa-list"></i><b>
                                        Listar
                                </span>
                            </a></b>

                        </li>

                    </ul>
                </div>
            </div>

        </nav>

        <style>

            #cuadro {
                /* Estilos para tu cuadro de formulario */
                max-width: 600px;
                margin: 50px auto;
                background-color: rgba(255, 255, 255, 0.8); /* el 0.6 es el grado de transparencia/* Fondo semitransparente para que la imagen de fondo sea visible */
                padding: 20px;

                border-radius: 10px;

                background-color: #ffcc0; /* Cambia #ffcc00 por el color que desees */
                padding: 20px; /* Ajusta el relleno según sea necesario */


            }
        </style>
        <main>
            <div class="container-fluid text-center" style="position: relative; top: -22px;">           
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <br>
                        <h4 class="text-primary elegant-font mt-5"><b>EDITAR CONSECUTIVO</b></h4>                  
                    </div>
                </div>
            </div>
            <!--Barra de Navegacion -->
            <%
                int id = Integer.parseInt((String) request.getAttribute("idEditar"));
                Consecutivo consecutivo = DaoConsecutivo.obtenerConsecutivoPorId(id);
            %>

            <form onsubmit="return validarFormulario()" action="ControladorConsecutivo" method="post"  class="formulario" id="formulario">

                <%-- <div class="formulario__grupo">  
                    <label class="formulario__label"  for="idconsecutivo">ID Producto</label>
                    <input  
                        type="text" 
                        class="formulario__input" 
                        readonly=""
                        id="idconsecutivo" 
                        value="<%=consecutivo.getIdconsecutivo()%>"
                        name="idconsecutivo2"
                        >
                </div>--%>

                <div class="formulario__grupo" id="grupo__Usuario">
                    <label class="formulario__label" for="idespecificaciones">Referencia-Cliente</label>
                    <select 
                        class="formulario__input" 
                        style="border: 2px solid #ffdf7e;"
                        id="idespecificaciones" 
                        name="idespecificaciones">
                        <option value="0">Seleccione Aux</option>
                        <% for (EspecificacionesSeco esp : DaoEspecificacionesSeco.listarPS_PL()) { %>
                        <% if (esp != null) {%>
                        <%-- Comprueba si el seguimiento coincide con el valor recibido del formulario para marcarlo como seleccionado --%>
                        <option value="<%= esp.getIdespecificaciones()%>" 
                                <% if (esp.getIdespecificaciones() == consecutivo.getIdEspecificaciones()) { %> selected <% }%>>
                            <%=DaoEspecificacionesSeco.obtReferenciaCliente(esp.getIdespecificaciones())%>
                        </option>
                        <% } %>
                        <% }%>
                    </select>
                </div>
                <div class="formulario__grupo" id="grupo__Usuario">
                    <label class="formulario__label" for="usuarios_idUsuarios">Auxiliar</label>
                    <select 
                        class="formulario__input" 
                        style="border: 2px solid #ffdf7e;"
                        id="usuarios_idUsuarios" 
                        name="idUsuarios">
                        <option value="0">Seleccione Aux</option>
                        <% for (Usuarios usuarios : DaoUsuarios.listar()) { %>
                        <% if (usuarios != null) {%>
                        <%-- Comprueba si el seguimiento coincide con el valor recibido del formulario para marcarlo como seleccionado --%>
                        <option value="<%= usuarios.getIdUsuarios()%>" 
                                <% if (usuarios.getIdUsuarios() == consecutivo.getIdUsuarios()) { %> selected <% }%>>
                            <%= usuarios.getNombres_apellido()%>
                        </option>
                        <% } %>
                        <% }%>
                    </select>
                </div>

                <div class="formulario__grupo">  
                    <label class="formulario__label"  for="fechaCertificado"> Fecha Registro</label>
                    <input  
                        type="date" 
                        class="formulario__input"                      
                        id="fechaCertificado" 
                        value="<%=consecutivo.getFechaCertificado()%>"
                        name="fechaCertificado"
                        >
                </div>
                <div class="formulario__grupo">  
                    <label class="formulario__label"  for="fechaProduccion"> Fecha Prod</label>
                    <input  
                        type="date" 
                        class="formulario__input"                         
                        id="fechaProduccion" 
                        value="<%=consecutivo.getFechaProduccion()%>"
                        name="fechaProduccion"
                        >
                </div>                        


                <div class="formulario__grupo">  
                    <label class="formulario__label"  for="nroRemision">Remision</label>
                    <input  
                        type="text" 
                        class="formulario__input" 
                        readonly=""
                        id="nroRemision" 
                        value="<%=consecutivo.getNroRemision()%>"
                        name="nroRemision"
                        >
                </div>


                <!-- Grupo: Remision -->
                <div class="formulario__grupo" id="grupo__clienteFinal">
                    <label class="formulario__label" for="cliente_NN"  class="text-left">Cliente Final</label>
                    <input type="text" 
                           class="formulario__input"  
                           value="<%=consecutivo.getCliente_NN()%>"
                           id="cliente_NN" 
                           name="cliente_NN" 
                           placeholder="Ingrese Cliente ">
                </div>



                <div class="formulario__grupo">  
                    <label class="formulario__label"  for="cantidadMaterial"> Cantidad Material</label>
                    <input  
                        type="text" 
                        class="formulario__input" 
                        readonly=""
                        id="cantidadMaterial" 
                        value="<%=consecutivo.getCantidadMaterial()%>"
                        name="cantidadMaterial"
                        >
                </div>

                <div class="formulario__grupo" id="grupo__tanque">
                    <label class="formulario__label" for="lote">Lote</label>
                    <input type="text"
                           class="formulario__input" 
                           id="lote" 
                           value="<%=consecutivo.getLote()%>"
                           name="lote" 
                           placeholder="Ingrese Lote">
                </div>

                <div class="formulario__grupo">  
                    <label class="formulario__label"  for="nroConsecutivo"># Consecutivo</label>
                    <input  
                        type="text" 
                        class="formulario__input" 
                        readonly=""
                        id="nroConsecutivo" 
                        value="<%=consecutivo.getIdconsecutivo()%>"
                        name="nroConsecutivo"
                        >
                </div>


                <!--div id ="cuadro"-->
                <fieldset class="formulario__grupo-btn-enviar">

                    <input type="hidden" name="txtid" value="<%=consecutivo.getIdconsecutivo()%>">
                    <button type="submit" name="accion" value="actualizar2" class="formulario__btn"> 
                        <i class="fas fa-sync"></i>ACTUALIZAR</button>
                    <a href="ControladorConsecutivo?accion=Listar3" class="btn btn-secondary">
                        Cancelar
                        <i class="bi bi-x-lg"></i>
                    </a>
                </fieldset>
                <!-- Grupo: Botones -->
                <fieldset class="formulario__grupo-btn-enviar">
                
                </fieldset>

            </form>

        </main>

        <h1> ${mensaje}</h1>


        <!-- Bootstrap CSS y JavaScript -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
                integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
                integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

    </body>
</html>
