
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Login-MI</title>

        <!-- Incluye los archivos CSS de Bootstrap -->

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

        <link href="Vistas/Estilos_css/EstilosPL2.css" rel="stylesheet" type="text/css"/>

        <link href="Vistas/Estilos_css/StyleLogin.css" rel="stylesheet" type="text/css"/>    
        <link href="Vistas/StyleFondo.css" rel="stylesheet" type="text/css"/>

    </head>
    <body> 
        <!-- Estilos CSS Mensaje Backu -->  
        <style>/* Estilos el maensaje de error de user o contraseña*/
            #miRespaldo {
                color: #00ff00; /* Color predeterminado del texto */
                background: #09f;
                text-align: center;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Efecto de sombra */
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Fuente */
                font-size: 18px; /* Tamaño de fuente */
                font-weight: bold; /* Peso de la fuente */
                letter-spacing: 1px; /* Espaciado entre letras */
                transition: color 0.3s; /* Transición suave de color */
                text-transform:  uppercase; /* Convierte todo a Mayuscula*/

            }
            hr{
                border: none; /* Elimina el borde por defecto */
                border-top: 2px solid #ADA996; /* Añade un borde superior sólido de 2px con el color deseado */

                img{

                }

            }


        </style>

        <!-- Contenedor principal centrado -->  
        <div class="container mt-4 col-lg-4">

            <!-- Estilos apliacados desde SteyleFondo -->        
            <div class="card col-sm-10">
                <div class="card-body">

                    <!-- Formulario Login -->
                    <form class="form-sing" action="SVValidar" method="POST"> 
                        <div class="formulario__grupo" style="text-align: center;">
                            <h3>LOGIN</h3>
                            <img src="MI.jpg" alt="70" width="120" style="display: block; margin: 0 auto;">     
                            <br>
                            <label>Bienvenidos al Sistema</label>
                        </div>

                        <hr>

                        <div class="formulario__grupo"  >
                            <label  for="txtuser">Usuario:</label>
                            <input
                                class="formulario__input"
                                type="text"
                                id="txtuser" 
                                name="txtuser" 
                                style="background: rgba(179, 215, 255, 0.3); font-family: 'Roboto', sans-serif; font-weight: 700 " 
                                >
                        </div>

                        <div class="formulario__grupo" >
                            <label for="txtpass">Password:</label>
                            <input
                                class="formulario__input"
                                type="password" 
                                id="txtpass"
                                name="txtpass" 
                                style="background: rgba(179, 215, 255, 0.3); font-family: 'Arial', sans-serif; font-weight: 700 " 
                                >
                        </div>
                        <hr>

                        <!-- Boton con style css -->
                        <section class="d-flex justify-content-center align-items-center">
                            <a  clas="Mya" href="" style="--clr:#6eff3e" >
                                <span>
                                    <input  type="submit" name="accion" value="Ingresar" >
                                </span><i>                                
                                </i>
                            </a>

                        </section>
                        <p id="miRespaldo">${message}</p>
                        <div class="form-group text-center">
                            <p id="mimensaje">${errorMensaje}</p>
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


    </body>
</html>
