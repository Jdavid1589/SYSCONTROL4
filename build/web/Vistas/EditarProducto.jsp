
<%@page import="Persistencia.DaoProductos"%>
<%@page import="Persistencia.DaoTipoProducto"%>
<%@page import="Modelo.TipoProducto"%>
<%@page import="Modelo.TipoProducto"%>

<%@page import="Persistencia.DaoClientes"%>
<%@page import="Modelo.Clientes"%>


<%@page import="java.util.List"%>
<%@page import="Modelo.Productos"%>
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
                        <h4 class="text-primary elegant-font mt-5" style="font-weight: bold; font-size: 30px;">EDITAR  PRODUCTOS</h4>

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
            <%-- Optenemos el ID del Producto y se lo pasamos al metodo de listar para editar --%>
            <%
                int id = Integer.parseInt((String) request.getAttribute("idEditarPr"));
                Productos productos = DaoProductos.listarAtributos(id);
            %>



            <form   class="formulario" id="formulario"action="ControladorProductos" method="POST">

                <div class="formulario__grupo">  
                    <label class="formulario__label"  for="id">ID Producto</label>
                    <input  
                        type="text" 
                        class="formulario__input" 
                        readonly=""
                        id="idControlCalidad" 
                        value="<%=productos.getIdProductos()%>"
                        name="idProductos2"
                        >
                </div>
                <div class="formulario__grupo" >
                </div>

                <!-- Grupo: Tipo De producto -->
                <div class="formulario__grupo">  
                    <label for="variablesEspecificacion" class="formulario__label"> <b>REFERENCIA</b></label>
                    <input
                        type="text" 
                        class="formulario__input"
                        id="referencia"   
                        value="<%=productos.getNombres_Productos()%>" 
                        name="referencia" 
                        placeholder="Ingrese Producto">                           
                </div>                 

                <!-- Grupo: Tipo De producto -->
                <div class="formulario__grupo" id="grupo__Usuario">
                    <label class="formulario__label" for="idtipo">Tipo Producto</label>
                    <select
                        class="formulario__input" 
                        style="border: 2px solid #ffdf7e;"  
                        id="idtipo" 
                        name="idtipo">
                        <option value="0">Seleccione Tipo Producto</option>
                        <% for (TipoProducto pr : DaoTipoProducto.listar()) { %>
                        <% if (pr != null) {%>
                        <%-- Comprueba si el seguimiento coincide con el valor recibido del formulario para marcarlo como seleccionado --%>
                        <option
                            value="<%= pr.getIdtipoProducto()%>" 
                            <% if (pr.getIdtipoProducto() == productos.getTipoProducto_idtipoProducto()) { %> selected <% }%>>
                            <%= pr.getTipo()%>
                        </option>
                        <% } %>
                        <% }%>
                    </select>
                    <p style=" font-weight: bold; color: #005cbf; margin-top: 5px;" >Seleccione El Tipo de Producto!</p>
                </div>


                <div class="formulario__grupo" >
                </div>
                <hr>

                <div class="formulario__grupo formulario__grupo-btn-enviar">
                    <input type="hidden" name="txtidProducto" value="<%=productos.getIdProductos()%>">
                    <button type="submit" name="accion" value="registrarEdicion"  class="formulario__btn">
                        <i class="fas fa-sync"></i>ACTUALIZAR
                    </button>

                    <a href="ControladorProductos?accion=listar" class="btn btn-secondary "><span >
                            <i class="fas fa-times dan"></i> CANCELAR </span></a>

                </div>
            </form>
        </main>
        <h1>${mensaje}</h1>
    </div>
</div>
</div>



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
