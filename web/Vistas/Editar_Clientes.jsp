
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">


        <link href="Vistas/Estilos_css/EstilosPL2.css" rel="stylesheet" type="text/css"/>

        <title>Editar_Clientes</title>   

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

        <main>

            <div class="container-fluid text-center" style="position: relative; top: -22px;">

                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <br>
                        <h4 class="text-primary elegant-font mt-5" style="font-weight: bold; font-size: 30px;">EDITAR  CLIENTES</h4>

                    </div>
                </div>
            </div>
            <!--Barra de Navegacion -->

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


            <%
                int id = Integer.parseInt((String) request.getAttribute("idEditar"));
                Clientes clientes = DaoClientes.obtenerClientePorId(id);
            %>

            <form   class="formulario" id="formulario"   action="ControladorClientes" method="post" class="custom-form">


                <!-- Grupo: ID -->
                <div class="formulario__grupo" id="grupo__ID">
                    <label class="formulario__label" for="txtid">ID</label>
                    <input type="text" class="formulario__input col-md-3" readonly=""
                           id="txtid"
                           value="<%=clientes.getIdclientes()%>" name="txtid">

                </div>

                <div class="formulario__grupo" >
                </div>

                <div class="formulario__grupo" id="grupo__ID">
                    <label class="formulario__label" for="razon_Social" class="text-left">Empresa</label>
                    <input type="text" class="formulario__input" id="razon_Social" value="<%=clientes.getRazon_Social()%>"
                           name="razonSocial" placeholder="Ingrese Empresa">
                </div>                           

                <div class="formulario__grupo" id="grupo__ID">
                    <label class="formulario__label" for="idDocumento">Nombres</label>
                    <input   value="xx" type="text" class="formulario__input" id="idDocumento" value="<%=clientes.getNombres_apellidos()%>" 
                             name="nombres" placeholder="Ingrese Nombres">
                </div>




                <%--    <div class="formulario__grupo" id="grupo__ID">
                <label class="formulario__label" for="idDocumento">Tipo Doc</label>
                <select  class="formulario__input" style="border: 2px solid #ffdf7e;"
                         id="idDocumento" name="idDocumento">
                    <option value="0">Seleccione Referencia</option>
                    <%
                        for (Documento documento : DaoDocumento.listar()) {
                            if (documento != null) {
                    %>
                    <option value="<%=documento.getIdDocumento()%>"><%=documento.getTipo_documento()%></option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>--%>

                <!-- Grupo: Doc -->
                <div class="formulario__grupo" id="grupo__Usuario">
                    <label class="formulario__label" for="idDocumento">Tipo Doc</label>
                    <select
                        class="formulario__input" 
                        style="border: 2px solid #ffdf7e;"  
                        id="idDocumento" 
                        name="idDocumento">
                        <option value="0">Seleccione Tipo Doc</option>
                        <% for (Documento cl : DaoDocumento.listar()) { %>
                        <% if (cl != null) {%>
                        <%-- Comprueba si el seguimiento coincide con el valor recibido del formulario para marcarlo como seleccionado --%>
                        <option
                            value="<%= cl.getIdDocumento()%>" 
                            <% if (cl.getIdDocumento() == clientes.getIdDocumento()) { %> selected <% }%>>
                            <%= cl.getTipo_documento()%>
                        </option>
                        <% } %>
                        <% }%>
                    </select>
                </div>



                <div class="formulario__grupo" id="grupo__tipodoc">
                    <label class="formulario__label"  for="numDocumento"># Documento</label>
                    <input  value="xx" type="text" class="formulario__input" id="numDocumento" value="<%=clientes.getNumero_Documento()%>" 
                            name="numDocumento" placeholder="Ingrese docum">
                </div>


                <div class="formulario__grupo" id="grupo__tipodoc">
                    <label class="formulario__label"  for="direccion">Direccion</label>
                    <input  value="xx" type="text" class="formulario__input" id="direccion" value="<%=clientes.getDireccion()%>" 
                            name="direccion" placeholder="Ingrese Direccion">
                </div>

                <div class="formulario__grupo" id="grupo__tipodoc">
                    <label class="formulario__label"   for="numTelefono">Telefono</label>
                    <input  value="xx" type="text" class="formulario__input" id="numTelefono" value="<%=clientes.getNumero_Telefono()%>" 
                            name="numTelefono" placeholder="Ingrese Telefono">
                </div>

                <div class="formulario__grupo" id="grupo__tipodoc">
                    <label class="formulario__label"  for="correo">Correo</label>
                    <input  value="xx" type="text" class="formulario__input" id="correo" value="<%=clientes.getCorreo()%>" 
                            name="correo" placeholder="Ingrese Correo">
                </div>


                <!--div id ="cuadro"-->
                <div class="formulario__grupo formulario__grupo-btn-enviar">
                    <input type="hidden" name="cli2" value="<%=clientes.getIdclientes()%>">
                    <button class="formulario__btn" type="submit" name="accion" value="EditCliente" class="btn btn-primary"> 
                        <i class="fas fa-sync"></i>ACTUALIZAR</button>

                    <a href="ControladorClientes?accion=listar" class="btn  btn-secondary"> <span class="text-center">
                            <i class="fas fa-times dan"></i>CANCELAR</span></a>

                </div>
                </div>

            </form>
        </main>

        <h1> ${mensaje}</h1>

        <!-- Bootstrap CSS y JavaScript -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                crossorigin="anonymous"
        ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
                integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                crossorigin="anonymous"
        ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
                integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
                crossorigin="anonymous"
        ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                crossorigin="anonymous"
        ></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script><%--lo de las alertas--%>

        <script src="./js/FuncionCondicionales.js" type="text/javascript"></script>

    </body>
</html>
