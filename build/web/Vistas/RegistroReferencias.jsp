
<%@page import="Persistencia.DaoTipoProducto"%>
<%@page import="Modelo.TipoProducto"%>
<%@page import="Persistencia.DaoClientes"%>
<%@page import="Modelo.Clientes"%>
<%@page import="Persistencia.DaoProductos"%>
<%@page import="Modelo.Productos"%>
<%@page import="java.util.List"%>

<%@page import="Persistencia.DaoUsuarios"%>
<%@page import="Modelo.Usuarios"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
                <link href="Vistas/Estilos_css/estilo4.css" rel="stylesheet" type="text/css"/>
        <script src="./js/FuncionCondicionales.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <title>Referencias</title>   

    </head>
    <body>


        <!--Barra de Navegacion -->
        <nav class="navbar  navbar-expand-md navbar-dark bg-primary border-3 fixed-top border-bottom " id="menu">
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
                                <span  class=" btn btn-primary ">
                                    <i class="bi bi-arrow-left-square-fill text-dark"></i><b> Inicio</span>
                            </a></b>

                        </li><li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="ControladorProductos?accion=listar">
                                <span  class=" btn btn-primary ">
                                    <i <i class="fas fa-list"></i><b>
                                        Listar
                                </span>
                            </a></b>

                        </li>

                    </ul>
                </div>
            </div>

        </nav>

        <!--Barra de Navegacion -->


        <div class="container  mt-5 "> 
            <h1 class=" elegant-font text-primary">REGISTRO REFERENCIAS</h1>

            <form action="ControladorProductos" autocomplete="off" method="POST" class="custom-form">         

                <div class="Container centrado">

                    <div class="row">
                        <div class="col-md-6 ">

                            <div class="form-group text-left"> 
                                <label for="variablesEspecificacion" class="text-left">
                                    <b style="color: #00008B; font-family: Century Gothic;">REFERENCIA</b></label>
                                <input  style="color: #00008B; background: #7abaff; font-family: Century Gothic ; font-size: 18PX;" 
                                        type="text" class="formulario__input" id="nombres_Productos"   
                                        name="nombres_Productos" 
                                        placeholder="Ingrese Producto">                           
                            </div>  

                            <div class="form-group text-left">
                                <label for="tipoProducto">Tipo</label>
                                <select class="formulario__input" id="tipoPerfil" name="tipoProducto_idtipoProducto">
                                    <option value="0">Seleccione Tipo</option>
                                    <% List<TipoProducto> tipopro = DaoTipoProducto.listar();
                                        if (tipopro != null) {
                                            for (TipoProducto tipoproducto : tipopro) {
                                                if (tipoproducto != null) {%>
                                    <option value="<%=tipoproducto.getIdtipoProducto()%>"><%=tipoproducto.getTipo()%></option>
                                    <% }
                                            }
                                        }%>
                                </select>
                            </div>
           <%-- 
                            <div class="form-group text-left">
                                <label for="clientes_idclientes"> Cliente</label>
                                <select class="form-control" id="clientes_idclientes" name="clientes_idclientes">
                                    <option value="0">Seleccione Cliente</option>
                                    <%
                                        for (Clientes clientes : DaoClientes.listar()) {
                                            if (clientes != null) {
                                    %>
                                    <option  value="<%=clientes.getIdclientes()%>"><%=clientes.getRazon_Social()%></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>

                         

                            <div class="form-group text-left">
                                <label for="variableEsp1" class="text-left"><b style="color: #28a745;">Variable # 1</b></label>
                                <input type="text" class="form-control" id="variableEsp1" name="variableEsp1" 
                                       placeholder="Ingrese Variable">
                            </div> 
                            <div class="form-group text-left">
                                <label for="rango1" class="text-left">Rango # 1</label>
                                <input type="text" class="form-control" id="rango1" name="rango1" 
                                       placeholder="Ingrese Rango">
                            </div> 
                            <div class="form-group text-left">
                                <label for="metodo1" class="text-left">Metodo # 1</label>
                                <input type="text" class="form-control" id="metodo1" name="metodo1" 
                                       placeholder="Ingrese Metodo">
                            </div> 

                            <div class="form-group text-left">
                                <label for="variableEsp2" class="text-left"><b style="color: #28a745;">Variable # 2</b></label>
                                <input type="text" class="form-control" id="variableEsp2" name="variableEsp2" 
                                       placeholder="Ingrese Variable">
                            </div> 
                            <div class="form-group text-left">
                                <label for="rango2" class="text-left">Rango # 2</label>
                                <input type="text" class="form-control" id="rango2" name="rango2" 
                                       placeholder="Ingrese Rango">
                            </div> 
                            <div class="form-group text-left">
                                <label for="metodo2" class="text-left">Metodo # 2</label>
                                <input type="text" class="form-control" id="metodo2" name="metodo2" 
                                       placeholder="Ingrese Metodo">
                            </div> 

                            <div class="form-group text-left">
                                <label for="variableEsp3" class="text-left"><b style="color: #28a745;">Variable # 3</b></label>
                                <input type="text" class="form-control" id="variableEsp3" name="variableEsp3" 
                                       placeholder="Ingrese Variable">
                            </div> 
                            <div class="form-group text-left">
                                <label for="rango3" class="text-left">Rango # 3</label>
                                <input type="text" class="form-control" id="rango3" name="rango3" 
                                       placeholder="Ingrese Rango">
                            </div> 
                            <div class="form-group text-left">
                                <label for="metodo3" class="text-left">Metodo # 3</label>
                                <input type="text" class="form-control" id="metodo3" name="metodo3" 
                                       placeholder="Ingrese Metodo">
                            </div> 

                            <div class="form-group text-left">
                                <label for="variableEsp4" class="text-left"><b style="color: #28a745;">Variable # 4</b></label>
                                <input type="text" class="form-control" id="variableEsp4" name="variableEsp4" 
                                       placeholder="Ingrese Variable">
                            </div> 
                            <div class="form-group text-left">
                                <label for="rango4" class="text-left">Rango # 4</label>
                                <input type="text" class="form-control" id="rango4" name="rango4" 
                                       placeholder="Ingrese Rango">
                            </div> 
                            <div class="form-group text-left">
                                <label for="metodo4" class="text-left">Metodo # 4</label>
                                <input type="text" class="form-control" id="metodo3" name="metodo4" 
                                       placeholder="Ingrese Metodo">
                            </div> 

                            <div class="form-group text-left">
                                <label for="variableEsp5" class="text-left"><b style="color: #28a745;">Variable # 5</b></label>
                                <input type="text" class="form-control" id="variableEsp5" name="variableEsp5" 
                                       placeholder="Ingrese Variable">
                            </div> 
                            <div class="form-group text-left">
                                <label for="rango5" class="text-left">Rango # 5</label>
                                <input type="text" class="form-control" id="rango5" name="rango5" 
                                       placeholder="Ingrese Rango">
                            </div> 
                            <div class="form-group text-left">
                                <label for="metodo5" class="text-left">Metodo # 5</label>
                                <input type="text" class="form-control" id="metodo5" name="metodo5" 
                                       placeholder="Ingrese Metodo">
                            </div> 
--%>

                        </div>

                        <%-- *************  Inicio Columna 2  **********---%>  

                

      <%-- 

                            <div class="form-group text-left">
                                <label for="variableEsp6" class="text-left"><b style="color: #28a745;">Variable # 6</b></label>
                                <input type="text" class="form-control" id="variableEsp6" name="variableEsp6" 
                                       placeholder="Ingrese Variable">
                            </div> 
                            <div class="form-group text-left">
                                <label for="rango6" class="text-left">Rango # 6</label>
                                <input type="text" class="form-control" id="rango6" name="rango6" 
                                       placeholder="Ingrese Rango">
                            </div> 
                            <div class="form-group text-left">
                                <label for="metodo6" class="text-left">Metodo # 6</label>
                                <input type="text" class="form-control" id="metodo6" name="metodo6" 
                                       placeholder="Ingrese Metodo">
                            </div> 

                            <div class="form-group text-left">
                                <label for="variableEsp7" class="text-left"><b style="color: #28a745;">Variable # 7</b></label>
                                <input type="text" class="form-control" id="variableEsp7" name="variableEsp7" 
                                       placeholder="Ingrese Variable">
                            </div> 
                            <div class="form-group text-left">
                                <label for="rango7" class="text-left">Rango # 7</label>
                                <input type="text" class="form-control" id="rango7" name="rango7" 
                                       placeholder="Ingrese Rango">
                            </div> 
                            <div class="form-group text-left">
                                <label for="metodo7" class="text-left">Metodo # 7</label>
                                <input type="text" class="form-control" id="metodo7" name="metodo7" 
                                       placeholder="Ingrese Metodo">
                            </div> 

                            <div class="form-group text-left">
                                <label for="variableEsp8" class="text-left"><b style="color: #28a745;">Variable # 8</b></label>
                                <input type="text" class="form-control" id="variableEsp8" name="variableEsp8" 
                                       placeholder="Ingrese Variable">
                            </div> 
                            <div class="form-group text-left">
                                <label for="rango8" class="text-left">Rango # 8</label>
                                <input type="text" class="form-control" id="rango8" name="rango8" 
                                       placeholder="Ingrese Rango">
                            </div> 
                            <div class="form-group text-left">
                                <label for="metodo8" class="text-left">Metodo # 8</label>
                                <input type="text" class="form-control" id="metodo7" name="metodo8" 
                                       placeholder="Ingrese Metodo">
                            </div> 

                            <div class="form-group text-left">
                                <label for="variableEsp9" class="text-left"><b style="color: #28a745;">Variable # 9</b></label>
                                <input type="text" class="form-control" id="variableEsp9" name="variableEsp9" 
                                       placeholder="Ingrese Variable">
                            </div> 
                            <div class="form-group text-left">
                                <label for="rango9" class="text-left">Rango # 9</label>
                                <input type="text" class="form-control" id="rango9" name="rango9" 
                                       placeholder="Ingrese Rango">
                            </div> 
                            <div class="form-group text-left">
                                <label for="metodo9" class="text-left">Metodo # 9</label>
                                <input type="text" class="form-control" id="metodo9" name="metodo9" 
                                       placeholder="Ingrese Metodo">
                            </div> 

                            <div class="form-group text-left">
                                <label for="variableEsp10" class="text-left"><b style="color: #28a745;">Variable # 10</b></label>
                                <input type="text" class="form-control" id="variableEsp10" name="variableEsp10" 
                                       placeholder="Ingrese Variable">
                            </div> 
                            <div class="form-group text-left">
                                <label for="rango10" class="text-left">Rango # 10</label>
                                <input type="text" class="form-control" id="rango10" name="rango10" 
                                       placeholder="Ingrese Rango">
                            </div> 
                            <div class="form-group text-left">
                                <label for="metodo10" class="text-left">Metodo # 10</label>
                                <input type="text" class="form-control" id="metodo10" name="metodo10" 
                                       placeholder="Ingrese Metodo">
                            </div> 

                            <div class="form-group text-left">
                                <label for="variableEsp11" class="text-left"><b style="color: #28a745;">Variable # 11</b></label>
                                <input type="text" class="form-control" id="variableEsp11" name="variableEsp11" 
                                       placeholder="Ingrese Variable">
                            </div> 
                            <div class="form-group text-left">
                                <label for="rango11" class="text-left">Rango # 11</label>
                                <input type="text" class="form-control" id="rango11" name="rango11" 
                                       placeholder="Ingrese Rango">
                            </div> 
                            <div class="form-group text-left">
                                <label for="metodo11" class="text-left">Metodo # 11</label>
                                <input type="text" class="form-control" id="metodo11" name="metodo11" 
                                       placeholder="Ingrese Metodo">
                            </div> 
--%>

                            <div class="form-group text-right ">
                                <button type="submit" name="accion" value="registrar" class="btn btn-outline-primary">
                                    <i class="fas fa-save "></i> Guardar</button>

                                <!--button type="button" onclick="mostrarAlerta()" class="btn btn-outline-primary">
                                    <i class="fas fa-save"></i> Guardar Registro
                                </button-->
                                <a href="./index3.jsp"class="btn  btn-outline-success"> <span class="text-warning">Inicio</span></a>
                            </div>    
                            </form>

                        </div> 
                    </div> 
                </div> 

   




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




                </body>
                </html>
