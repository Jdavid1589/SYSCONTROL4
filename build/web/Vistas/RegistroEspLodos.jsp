
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">



        <link href="Vistas/Estilos_css/EstilosPL2.css" rel="stylesheet" type="text/css"/>


        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <title>Registro-Esp-Lodos</title>   

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
                                <span  style="margin-left: 60px; border:none; font-size: 16px" class="btn btn-outline-light">
                                    <i class="bi bi-arrow-left-square-fill text-dark"></i><b> Inicio</span>
                            </a></b>

                        </li><li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="ControladorEspLodos?accion=listar">
                                <span  style="margin-left: 60px; border:none; font-size: 16px" class="btn btn-outline-light">
                                    <i <i class="fas fa-list"></i><b>
                                        Cancelar
                                </span>
                            </a></b>


                        </li>

                    </ul>
                </div>
            </div>

        </nav>

        <!--Barra de Navegacion -->

        <main>

            <!--Stilos CSS-->
            <style>
                /* Comentario: Estilo para los botones */
                .formulario__btn_cancelar2 {
                    /*  height: 40px;  /* Altura del botón */
                    /*  line-height: 40px;    /* Altura de la línea del texto dentro del botón */
                    /*  width: 25%;  /* Ancho del botón */
                    background: #999999;     /* Color de fondo del botón */
                    color: #fff;     /* Color del texto del botón */
                    font-weight: bold;     /* Grosor de la fuente del texto */
                    border: none;     /* Sin borde */
                    border-radius: 3px;   /* Radio del borde del botón */
                    /*  cursor: pointer;   /* Cursor al pasar sobre el botón */
                    transition: .1s ease all;   /* Transición de todas las propiedades con duración de 0.1 segundos */
                }

                .formulario__btn_cancelar2 a {
                    color: #fff;     /* Color del texto del botón */
                    font-weight: bold;     /* Grosor de la fuente del texto */
                    text-decoration: none; /* Quitar el subrayado */
                }
            </style>

            <div class="container-fluid text-center" style="position: relative; top: -22px;">

                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <br>
                        <h4 class="text-primary elegant-font mt-5"><b>REGISTRAR ESPECIFICACIONES LODOS</b></h4>

                    </div>
                </div>
            </div>

            <form class="formulario" id="formulario"  action="ControladorEspLodos" autocomplete="off" method="POST" class="custom-form">         


                <!-- Grupo: Referencia -->
                <div class="formulario__grupo" id="grupo__referencia">
                    <label   class="formulario__label" for="productos_idProductos">  Referencia </label>
                    <select class="formulario__input" style="border: 2px solid #ffdf7e;"     id="productos_idProductos" name="idProductos">
                        <option value="0">Seleccione Referencia</option>
                        <% for (Productos productos : DaoProductos.listarPL()) {
                                if (productos != null) {%>        
                        <option  value="<%=productos.getIdProductos()%>"><%=productos.getNombres_Productos()%></option>
                        <% }
                            } %>
                    </select>
                </div>


                <!-- Grupo: Cliente -->
                <div class="formulario__grupo" id="grupo__cliente">
                    <label    class="formulario__label" for="clientes_idclientes"> 
                        Cliente
                    </label>
                    <select 
                        class="formulario__input"
                        style="border: 2px solid #ffdf7e;" 
                        id="clientes_idclientes" 
                        name="idclientes"
                        >
                        <option value="0">Seleccione Cliente</option>
                        <%   for (Clientes clientes : DaoClientes.listar()) {
                                if (clientes != null) {%>                 
                        <option  value="<%=clientes.getIdclientes()%>"><%=clientes.getRazon_Social()%></option>
                        <% }
                            }
                        %>
                    </select>
                </div>

                <!-- Grupo: variableEsp1 -->
                <div class="formulario__grupo" id="grupo__variableEsp1">
                    <label   class="formulario__label"  for="variableEsp1" style="color: #28a745;">Variable # 1</label>
                    <div class="formulario__grupo-input">
                        <input
                            type="text"
                            class="formulario__input" 
                            id="variableEsp1"
                            name="variableEsp1" 
                            placeholder="Ingrese Variable">
                    </div> 
                </div> 

                <!-- Grupo: rango1 -->
                <div class="formulario__grupo" id="grupo__rango1">
                    <label   class="formulario__label"  for="rango1" >Rango # 1</label>
                    <div class="formulario__grupo-input">
                        <input
                            type="text"
                            class="formulario__input" 
                            id="rango1"
                            name="rango1" 
                            placeholder="Ingrese Rango">
                    </div> 
                </div> 

                <!-- Grupo: metodo1 -->
                <div class="formulario__grupo" id="grupo__metodo1">
                    <label   class="formulario__label"  for="metodo1" >Metodo # 1</label>
                    <div class="formulario__grupo-input">
                        <input
                            type="text"
                            class="formulario__input"
                            id="metodo1"
                            name="metodo1" 
                            placeholder="Ingrese Metodo">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label   class="formulario__label"  for="variableEsp2"><b style="color: #28a745;">Variable # 2</b></label>
                    <input 
                        type="text"  
                        class="formulario__input"
                        id="variableEsp2" 
                        name="variableEsp2" 
                        placeholder="Ingrese Variable">
                </div>

                <div class="formulario__grupo" id="grupo__lote">
                    <label   class="formulario__label"  for="rango2" class="formulario__label">Rango # 2</label>
                    <div class="formulario__grupo-input">
                        <input type="text"  class="formulario__input" id="rango2" name="rango2" 
                               placeholder="Ingrese Rango">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label   class="formulario__label" for="metodo2" class="formulario__label">Metodo # 2</label>
                    <div class="formulario__grupo-input">
                        <input type="text"  class="formulario__input" id="metodo2" name="metodo2" 
                               placeholder="Ingrese Metodo">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label   class="formulario__label"  for="variableEsp3" class="formulario__label"><b style="color: #28a745;">Variable # 3</b></label>
                    <div class="formulario__grupo-input">
                        <input
                            type="text" 
                            class="formulario__input"
                            id="variableEsp3"
                            name="variableEsp3" 
                            placeholder="Ingrese Variable">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label   class="formulario__label"  for="rango3" class="formulario__label">Rango # 3</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="rango3" name="rango3" 
                               placeholder="Ingrese Rango">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label   class="formulario__label"  for="metodo3" class="formulario__label">Metodo # 3</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="metodo3" name="metodo3" 
                               placeholder="Ingrese Metodo">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label   class="formulario__label"  for="variableEsp4" class="formulario__label"><b style="color: #28a745;">Variable # 4</b></label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="variableEsp4" name="variableEsp4" 
                               placeholder="Ingrese Variable">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label   class="formulario__label"  for="rango4" class="formulario__label">Rango # 4</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="rango4" name="rango4" 
                               placeholder="Ingrese Rango">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label   class="formulario__label"  for="metodo4" class="formulario__label">Metodo # 4</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="metodo3" name="metodo4" 
                               placeholder="Ingrese Metodo">
                    </div> 
                </div> 


                <div class="formulario__grupo" id="grupo__lote">
                    <label   class="formulario__label"  for="variableEsp5" class="formulario__label"><b style="color: #28a745;">Variable # 5</b></label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="variableEsp5" name="variableEsp5" 
                               placeholder="Ingrese Variable">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label   class="formulario__label"  for="rango5" class="formulario__label">Rango # 5</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="rango5" name="rango5" 
                               placeholder="Ingrese Rango">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label for="metodo5" class="formulario__label">Metodo # 5</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="metodo5" name="metodo5" 
                               placeholder="Ingrese Metodo">
                    </div> 
                </div> 

                <%-- *************  Inicio Columna 2  **********---%>  

                <div class="formulario__grupo" id="grupo__lote">
                    <label   class="formulario__label"  for="variableEsp6" class="formulario__label"><b style="color: #28a745;">Variable # 6</b></label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="variableEsp6" name="variableEsp6" 
                               placeholder="Ingrese Variable">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label   class="formulario__label"  for="rango6" class="formulario__label">Rango # 6</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="rango6" name="rango6" 
                               placeholder="Ingrese Rango">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label   class="formulario__label"  for="metodo6" class="formulario__label">Metodo # 6</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="metodo6" name="metodo6" 
                               placeholder="Ingrese Metodo">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label   class="formulario__label"   for="variableEsp7" class="formulario__label"><b style="color: #28a745;">Variable # 7</b></label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="variableEsp7" name="variableEsp7" 
                               placeholder="Ingrese Variable">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label   class="formulario__label"  for="rango7" class="formulario__label">Rango # 7</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="rango7" name="rango7" 
                               placeholder="Ingrese Rango">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label" for="metodo7" class="formulario__label">Metodo # 7</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="metodo7" name="metodo7" 
                               placeholder="Ingrese Metodo">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label"  for="variableEsp8" class="formulario__label"><b style="color: #28a745;">Variable # 8</b></label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="variableEsp8" name="variableEsp8" 
                               placeholder="Ingrese Variable">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label"   for="rango8" class="formulario__label">Rango # 8</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="rango8" name="rango8" 
                               placeholder="Ingrese Rango">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label"  for="metodo8" class="formulario__label">Metodo # 8</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="metodo7" name="metodo8" 
                               placeholder="Ingrese Metodo">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label" for="variableEsp9" class="formulario__label"><b style="color: #28a745;">Variable # 9</b></label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="variableEsp9" name="variableEsp9" 
                               placeholder="Ingrese Variable">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label" for="rango9" class="formulario__label">Rango # 9</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="rango9" name="rango9" 
                               placeholder="Ingrese Rango">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label" for="metodo9" class="formulario__label">Metodo # 9</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="metodo9" name="metodo9" 
                               placeholder="Ingrese Metodo">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label"  for="variableEsp10" class="formulario__label"><b style="color: #28a745;">Variable # 10</b></label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="variableEsp10" name="variableEsp10" 
                               placeholder="Ingrese Variable">
                    </div> 
                </div> 


                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label" for="rango10" class="formulario__label">Rango # 10</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="rango10" name="rango10" 
                               placeholder="Ingrese Rango">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label"  for="metodo10" class="formulario__label">Metodo # 10</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="metodo10" name="metodo10" 
                               placeholder="Ingrese Metodo">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label" for="variableEsp11" class="formulario__label"><b style="color: #28a745;">Variable # 11</b></label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="variableEsp11" name="variableEsp11" 
                               placeholder="Ingrese Variable">
                    </div> 
                </div> 


                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label" for="rango11" class="formulario__label">Rango # 11</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="rango11" name="rango11" 
                               placeholder="Ingrese Rango">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label"  for="metodo11" class="formulario__label">Metodo # 11</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="metodo11" name="metodo11" 
                               placeholder="Ingrese Metodo">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label" for="variableEsp12" class="formulario__label"><b style="color: #28a745;">Variable # 12</b></label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="variableEsp12" name="variableEsp12" 
                               placeholder="Ingrese Variable">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label" for="rango12" class="formulario__label">Rango # 12</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="rango12" name="rango12" 
                               placeholder="Ingrese Rango">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label"  for="metodo12" class="formulario__label">Metodo # 12</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="metodo12" name="metodo12" 
                               placeholder="Ingrese Metodo">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label"  for="variableEsp13" class="formulario__label"><b style="color: #28a745;">Variable # 13</b></label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="variableEsp13" name="variableEsp13" 
                               placeholder="Ingrese Variable">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label"  for="rango13" class="formulario__label">Rango # 13</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="rango13" name="rango13" 
                               placeholder="Ingrese Rango">
                    </div> 
                </div> 

                <div class="formulario__grupo" id="grupo__lote">
                    <label class="formulario__label"  for="metodo13" class="formulario__label">Metodo # 13</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" id="metodo13" name="metodo13" 
                               placeholder="Ingrese Metodo">
                    </div> 
                </div> 


                <div class="formulario__grupo formulario__grupo-btn-enviar">
                    <button  
                        class="formulario__btn"
                        type="submit"
                        name="accion"
                        value="registrar" >
                        <i class="fas fa-save "></i> AGREGAR
                    </button>
                    <a href="ControladorEspLodos?accion=listar" class="btn  btn-secondary"> <span class="text-center">
                            <i class="fas fa-times dan"></i> CANCELAR</span></a>

                </div> 


            </form>



            <main>

                <script src="./js/FuncionCondicionales.js" type="text/javascript"></script>
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
