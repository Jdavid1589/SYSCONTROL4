<%@page import="Persistencia.DaoEspecificacionesSeco"%>
<%@page import="Modelo.EspecificacionesSeco"%>
<%@page import="Persistencia.DaoEspecificaciones"%>
<%@page import="Modelo.Especificaciones"%>
<%@page import="Persistencia.DaoUsuarios"%>
<%@page import="Persistencia.DaoProductos"%>
<%@page import="Modelo.Productos"%>
<%@page import="Persistencia.DaoConsecutivo"%>
<%@page import="Modelo.Consecutivo"%>
<%@page import="Modelo.Clientes"%>
<%@page import="Persistencia.DaoClientes"%>
<%@page import="Modelo.Usuarios"%>
<%@page import="java.util.List"%>

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

        <title>Editar_Especificaciones Seco</title>   

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
                            <a class="nav-link active"  aria-current="page" href="./index3.jsp">
                                <span  style="margin-left: 10px; border:none" class="btn btn-outline-light">
                                    <i class="bi bi-arrow-left-square-fill text-dark"></i><b> Inicio</span>
                            </a></b>

                        </li><li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="ControladorEspSeco?accion=listar">
                                <span  style="margin-left: 10px; border:none" class="btn btn-outline-light">
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
                        <h4 class="text-primary elegant-font mt-5" style="font-weight: bold; font-size: 30px;">EDITAR ESPECIFICACIONES</h4>

                    </div>
                </div>
            </div>
            <!--Barra de Navegacion -->

            <%
                int id = Integer.parseInt((String) request.getAttribute("idEditar"));
                EspecificacionesSeco especific = DaoEspecificacionesSeco.obtenerEspecificPorId(id);
            %>

            <form class="formulario" id="formulario"   action="ControladorEspSeco" method="POST" class="custom-form">

                <!-- Grupo: ID -->
                <div class="formulario__grupo" id="grupo__ID">                
                    <label class="formulario__label"  for="idespecificaciones">ID</label>
                    <input type="text" class="formulario__input col-md-3" readonly=""
                           id="idespecificaciones"
                           value="<%=especific.getIdespecificaciones()%>" name="txtid">
                </div>
                <div class="formulario__grupo" >     

                </div>


                <div class="formulario__grupo" id="grupo__producto">
                    <label class="formulario__label" for="idProductos">Referencia</label>
                    <select 
                        class="formulario__input"
                        style="border: 2px solid #ffdf7e;"
                        id="idProductos" 
                        name="idProductos">
                        <option value="0">Seleccione Referencia</option>
                        <% for (Productos pr : DaoProductos.listarPS()) { %>
                        <% if (pr != null) {%>
                        <%-- Comprueba si el producto coincide con el valor recibido del formulario para marcarlo como seleccionado --%>
                        <option value="<%= pr.getIdProductos()%>" 
                                <% if (pr.getIdProductos() == especific.getIdProductos()) { %>
                                selected <% }%>>
                            <%= DaoProductos.obtenerNombreProducto(pr.getIdProductos())%>
                        </option>
                        <% } %>
                        <% }%>
                    </select>
                </div>

                <div class="formulario__grupo" id="grupo__Cliente">
                    <label class="formulario__label" for="idclientes">Cliente</label>
                    <select 
                        class="formulario__input" 
                        style="border: 2px solid #ffdf7e;"
                        id="idclientes" 
                        name="idclientes">
                        <option value="0">Seleccione Cliente</option>
                        <% for (Clientes clientes : DaoClientes.listar()) { %>
                        <% if (clientes != null) {%>
                        <%-- Comprueba si el cliente coincide con el valor recibido de 'especific' para marcarlo como seleccionado --%>
                        <option value="<%= clientes.getIdclientes()%>"
                                <% if (clientes.getIdclientes() == (especific.getIdclientes())) { %>
                                selected <% }%>>
                            <%= clientes.getRazon_Social()%>
                        </option>
                        <% } %>
                        <% }%>
                    </select>
                </div>




                <div class="formulario__grupo" id="grupo__ID">
                    <label class="formulario__label" for="variableEsp1" class="text-left"><b style="color: #28a745;">Variable # 1</b></label>
                    <input type="text" class="formulario__input" id="variableEsp1" name="variableEsp1" value="<%=especific.getVariableEsp1()%>"   
                           placeholder="Ingrese Variable">
                </div> 
                <div class="formulario__grupo" id="grupo__ID">
                    <label class="formulario__label" for="rango1" class="text-left">Rango # 1</label>
                    <input type="text" class="formulario__input" id="rango1" name="rango1" value="<%=especific.getRango1()%>"
                           placeholder="Ingrese Rango">
                </div>                            

                <div class="formulario__grupo" id="grupo__ID">
                    <label  class="formulario__label"class="formulario__label" for="variableEsp2" class="text-left"><b style="color: #28a745;">Variable # 2</b></label>
                    <input type="text" class="formulario__input" id="variableEsp2" name="variableEsp2" value="<%=especific.getVariableEsp2()%>" 
                           placeholder="Ingrese Variable">
                </div> 
                <div class="formulario__grupo" id="grupo__ID">
                    <label class="formulario__label" for="rango2" class="text-left">Rango # 2</label>
                    <input type="text" class="formulario__input" id="rango2" name="rango2" value="<%=especific.getRango2()%>"
                           placeholder="Ingrese Rango">
                </div> 


                <div class="formulario__grupo" id="grupo__ID">
                    <label class="formulario__label" class="formulario__label" for="variableEsp3" class="text-left"><b style="color: #28a745;">Variable # 3</b></label>
                    <input type="text" class="formulario__input" id="variableEsp3" name="variableEsp3" value="<%=especific.getVariableEsp3()%>"
                           placeholder="Ingrese Variable">
                </div> 
                <div class="formulario__grupo" id="grupo__ID">
                    <label class="formulario__label" for="rango3" class="text-left">Rango # 3</label>
                    <input type="text" class="formulario__input" id="rango3" name="rango3" value="<%=especific.getRango3()%>"
                           placeholder="Ingrese Rango">
                </div> 


                <div class="formulario__grupo" id="grupo__ID">
                    <label  class="formulario__label"for="variableEsp4" class="text-left"><b style="color: #28a745;">Variable # 4</b></label>
                    <input type="text" class="formulario__input" id="variableEsp4" name="variableEsp4" value="<%=especific.getVariableEsp4()%>"
                           placeholder="Ingrese Variable">
                </div> 

                <%-- *************  Inicio Columna 2  **********---%>  



                <div class="formulario__grupo" id="grupo__ID">
                    <label class="formulario__label" for="rango4" class="text-left">Rango # 4</label>
                    <input type="text" class="formulario__input" id="rango4" name="rango4" value="<%=especific.getRango4()%>"
                           placeholder="Ingrese Rango">
                </div> 


                <div class="formulario__grupo" id="grupo__ID">
                    <label class="formulario__label" for="variableEsp5" class="text-left"><b style="color: #28a745;">Variable # 5</b></label>
                    <input type="text" class="formulario__input" id="variableEsp5" name="variableEsp5" value="<%=especific.getVariableEsp5()%>"
                           placeholder="Ingrese Variable">
                </div> 
                <div class="formulario__grupo" id="grupo__ID">
                    <label class="formulario__label" for="rango5" class="text-left">Rango # 5</label>
                    <input type="text" class="formulario__input" id="rango5" name="rango5" value="<%=especific.getRango5()%>"
                           placeholder="Ingrese Rango">
                </div> 

                <div class="formulario__grupo" id="grupo__ID">
                    <label class="formulario__label" for="variableEsp6" class="text-left"><b style="color: #28a745;">Variable # 6</b></label>
                    <input type="text" class="formulario__input" id="variableEsp6" name="variableEsp6" value="<%=especific.getVariableEsp6()%>"
                           placeholder="Ingrese Variable">
                </div> 
                <div class="formulario__label" class="formulario__grupo" id="grupo__ID">
                    <label class="formulario__label" for="rango6" class="text-left">Rango # 6</label>
                    <input type="text" class="formulario__input" id="rango6" name="rango6" value="<%=especific.getRango6()%>"
                           placeholder="Ingrese Rango">
                </div> 

                <div class="formulario__grupo" id="grupo__ID">
                    <label class="formulario__label" for="variableEsp7" class="text-left"><b style="color: #28a745;">Variable # 7</b></label>
                    <input type="text" class="formulario__input" id="variableEsp7" name="variableEsp7" value="<%=especific.getVariableEsp7()%>"
                           placeholder="Ingrese Variable">
                </div> 
                <div class="formulario__grupo" id="grupo__ID">
                    <label class="formulario__label" for="rango7" class="text-left">Rango # 7</label>
                    <input type="text" class="formulario__input" id="rango7" name="rango7" value="<%=especific.getRango7()%>"
                           placeholder="Ingrese Rango">
                </div> 


                <div class="formulario__grupo" id="grupo__ID">
                    <label class="formulario__label" class="formulario__label" for="variableEsp8" class="text-left"><b style="color: #28a745;">Variable # 8</b></label>
                    <input type="text" class="formulario__input" id="variableEsp8" name="variableEsp8" value="<%=especific.getVariableEsp8()%>"
                           placeholder="Ingrese Variable">
                </div> 
                <div class="formulario__grupo" id="grupo__ID">
                    <label class="formulario__label" for="rango8" class="text-left">Rango # 8</label>
                    <input type="text" class="formulario__input" id="rango8" name="rango8" value="<%=especific.getRango8()%>"  
                           placeholder="Ingrese Rango">
                </div>                               

                <!-- Fila de botones -->



                <div class="formulario__grupo formulario__grupo-btn-enviar">
                    <input  type="hidden" name="idEspecificaciones" value="<%=especific.getIdespecificaciones()%>">
                    <button class="formulario__btn"  type="submit" name="accion" value="Modificar" class="btn btn-primary">                                   
                        <i class="fas fa-sync"></i>ACTUALIZAR
                    </button>
                    <a href="ControladorEspSeco?accion=listar" class="btn  btn-secondary">
                        <span class="text-center">
                            <i class="fas fa-times dan"></i>
                            CANCELAR
                        </span></a>

                </div>

                <h1> ${mensaje}</h1>
            </form>
        </main>



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


    </body>
</html>

