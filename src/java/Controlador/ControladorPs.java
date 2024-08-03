package Controlador;

import Modelo.ControlSeco;

import Persistencia.DaoProductoSeco;
import java.io.IOException;

import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControladorPs extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("accion");

        switch (action) {
            case "add":
                request.getRequestDispatcher("Vistas/RegistroProductoSeco.jsp").forward(request, response);
                break;

            case "registrar2":
                //   registrarPS(request, response);
                break;

            case "registrar3":
                registrarPS2(request, response);
                break;

            case "listar":
                listarPS(request, response);
                break;

            case "editar_ps":
                request.setAttribute("idEditar_ps", request.getParameter("id"));
                request.getRequestDispatcher("Vistas/Editar_prod_seco.jsp").forward(request, response);
                break;
            case "editar_ps2":
                request.setAttribute("idEditar_ps", request.getParameter("id"));
                request.getRequestDispatcher("Vistas/EditarPS2.jsp").forward(request, response);
                break;

            case "registrarEdicion":
                editarPS2(request, response);
                break;
            case "registrarEdicion2":
                actualizarPS2(request, response);
                break;

            case "pdf":
                request.setAttribute("idpdf", request.getParameter("id"));
                request.getRequestDispatcher("Vistas/CertificadoSeco.jsp").forward(request, response);
                break;

            case "eliminar2":
                eliminarPS(request, response);
                break;

            case "updatecell":
                actualizarCelda(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción desconocida");
                break;
        }
    }

    private void registrarPS2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ControlSeco controlseco = new ControlSeco();

            // Establecer los valores de los campos fijos
            controlseco.setFecha(request.getParameter("fecha"));
            controlseco.setCant_noconf(Double.valueOf(request.getParameter("cant_noconf")));
            controlseco.setCausas(request.getParameter("causas"));
            controlseco.setLote(request.getParameter("lote"));
            controlseco.setRetenido325(Double.parseDouble(request.getParameter("retenido325")));
            controlseco.setpH_promedio(Double.valueOf(request.getParameter("pH_promedio")));
            controlseco.setHumedad_promedio(Double.valueOf(request.getParameter("sol_promedio")));
            controlseco.setAbs_Aceite(Double.parseDouble(request.getParameter("abs_Aceite")));
            controlseco.setBrigh(Double.parseDouble(request.getParameter("Brigh")));
            controlseco.setWhitness(Double.parseDouble(request.getParameter("Whitness")));
            controlseco.setDv50(Double.parseDouble(request.getParameter("Dv50")));
            controlseco.setDv90(Double.parseDouble(request.getParameter("Dv90")));
            controlseco.setComentarios(request.getParameter("comentarios"));
            controlseco.setObservacion(request.getParameter("observacion"));
            controlseco.setIdProductos(Integer.parseInt(request.getParameter("idProductos")));
            controlseco.setIdUsuarios(Integer.parseInt(request.getParameter("idUsuarios")));
            controlseco.setIdConsecutivo(Integer.parseInt(request.getParameter("idConsecutivo")));

            // Recoger los valores de los campos de humedad y pH dinámicamente
            for (Map.Entry<String, String[]> entry : request.getParameterMap().entrySet()) {
                String paramName = entry.getKey();
                String[] paramValues = entry.getValue();
                for (String paramValue : paramValues) {
                    //System.out.println("Nombre del parámetro: " + paramName + ", Valor: " + paramValue);
                }
                if (paramName.startsWith("humedad_")) {
                    // Extraer el índice de la humedad del nombre del parámetro
                    try {
                        int index = Integer.parseInt(paramName.substring("humedad_".length()));
                        double humedad = Double.parseDouble(paramValues[0]);
                        controlseco.setHumedad(index, humedad);
                    } catch (NumberFormatException e) {
                        System.err.println("Error al convertir el valor de humedad: " + paramValues[0]);
                    }
                } else if (paramName.startsWith("pH_")) {
                    // Extraer el índice del pH del nombre del parámetro
                    try {
                        int index = Integer.parseInt(paramName.substring("pH_".length()));
                        double pH = Double.parseDouble(paramValues[0]);
                        controlseco.setPH(index, pH);
                        System.out.println("Asignado pH: " + pH + " al índice: " + index);
                    } catch (NumberFormatException e) {
                        System.err.println("Error al convertir el valor de pH: " + paramValues[0]);
                    }
                }
            }

            /*   // Verificación de los valores recogidos
        System.out.println("Valores de pH recogidos: ");
        for (int i = 1; i <= 10; i++) {
            System.out.println("pH_" + i + ": " + controlseco.getPH(i));
        }*/
            // Grabar en la base de datos
            if (DaoProductoSeco.grabar4(controlseco)) {
                request.setAttribute("mensaje", "Registro Exitoso");
            } else {
                request.setAttribute("mensaje", "Error, el reporte no fue registrado");
            }
            listarPS(request, response);

        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error al registrar la Especificacion");
            listarPS(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al registrar la Especificacion");
            listarPS(request, response);
        }
    }

    //.  Metodo Listar
    private void listarPS(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<ControlSeco> lt = DaoProductoSeco.listar();
            request.setAttribute("listaProducSeco", lt);
            request.getRequestDispatcher("Vistas/Listarproductoseco.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al listar los Consecutivos");
            request.getRequestDispatcher("Vistas/Listarproductoseco.jsp").forward(request, response);
        }
    }
    
    //.  Metodo para actualizar directamente desde la tabla
      private void actualizarCelda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String column = request.getParameter("column");
        String value = request.getParameter("value");

        //System.out.println("ID: " + id);
       // System.out.println("Column: " + column);
       // System.out.println("Value: " + value);

        if (DaoProductoSeco.actualizarCelda(id, column, value)) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("error");
        }
    }
    
    private void actualizarPS2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ControlSeco controlseco = new ControlSeco();

            // Establecer los valores de los campos fijos desde el formulario
            controlseco.setFecha(request.getParameter("fecha"));
            controlseco.setCant_noconf(Double.valueOf(request.getParameter("cant_noconf")));
            controlseco.setCausas(request.getParameter("causas"));
            controlseco.setLote(request.getParameter("lote"));
            controlseco.setRetenido325(Double.parseDouble(request.getParameter("retenido325")));
            controlseco.setpH_promedio(Double.valueOf(request.getParameter("pH_promedio")));
            controlseco.setHumedad_promedio(Double.valueOf(request.getParameter("sol_promedio")));
            controlseco.setAbs_Aceite(Double.parseDouble(request.getParameter("abs_Aceite")));
            controlseco.setBrigh(Double.parseDouble(request.getParameter("Brigh")));
            controlseco.setWhitness(Double.parseDouble(request.getParameter("Whitness")));
            controlseco.setDv50(Double.parseDouble(request.getParameter("Dv50")));
            controlseco.setDv90(Double.parseDouble(request.getParameter("Dv90")));
            controlseco.setComentarios(request.getParameter("comentarios"));
            controlseco.setObservacion(request.getParameter("observacion"));
            controlseco.setIdProductos(Integer.parseInt(request.getParameter("idProductos")));
            controlseco.setIdUsuarios(Integer.parseInt(request.getParameter("idUsuarios")));
            controlseco.setIdConsecutivo(Integer.parseInt(request.getParameter("idConsecutivo")));

            // Establecer el ID de ControlCalidad a actualizar
            controlseco.setIdControlCalidad(Integer.parseInt(request.getParameter("txtid_ps")));

            // Recoger los valores de los campos de humedad y pH dinámicamente desde el formulario
            for (Map.Entry<String, String[]> entry : request.getParameterMap().entrySet()) {
                String paramName = entry.getKey();
                String[] paramValues = entry.getValue();
                for (String paramValue : paramValues) {
                 //   System.out.println("Nombre del parámetro: " + paramName + ", Valor: " + paramValue);
                }
                if (paramName.startsWith("humedad_")) {
                    // Extraer el índice de la humedad del nombre del parámetro
                    try {
                        int index = Integer.parseInt(paramName.substring("humedad_".length()));
                        double humedad = Double.parseDouble(paramValues[0]);
                        controlseco.setHumedad(index, humedad);
                    } catch (NumberFormatException e) {
                        System.err.println("Error al convertir el valor de humedad: " + paramValues[0]);
                    }
                } else if (paramName.startsWith("pH_")) {
                    // Extraer el índice del pH del nombre del parámetro
                    try {
                        int index = Integer.parseInt(paramName.substring("pH_".length()));
                        double pH = Double.parseDouble(paramValues[0]);
                        controlseco.setPH(index, pH);
                    } catch (NumberFormatException e) {
                        System.err.println("Error al convertir el valor de pH: " + paramValues[0]);
                    }
                }
            }

            // Actualizar en la base de datos
            if (DaoProductoSeco.editar2(controlseco)) {
                request.setAttribute("mensaje", "Actualización Exitosa");
            } else {
                request.setAttribute("mensaje", "Error, la actualización no fue realizada");
            }
            listarPS(request, response);

        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error al actualizar la Especificación: Datos numéricos incorrectos");
            listarPS(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al actualizar la Especificación");
            listarPS(request, response);
        }
    }

    //.  Metodo Actualizar 2
    private void editarPS2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ControlSeco controlseco = new ControlSeco();

            // Establecer los valores de los campos fijos desde el formulario
            controlseco.setIdControlCalidad(Integer.parseInt(request.getParameter("txtid_ps")));
            controlseco.setFecha(request.getParameter("fecha"));
            controlseco.setCant_noconf(Double.valueOf(request.getParameter("cant_noconf")));
            controlseco.setCausas(request.getParameter("causas"));
            controlseco.setLote(request.getParameter("lote"));
            controlseco.setRetenido325(Double.parseDouble(request.getParameter("retenido325")));
            controlseco.setpH_promedio(Double.valueOf(request.getParameter("pH_promedio")));
            controlseco.setHumedad_promedio(Double.valueOf(request.getParameter("sol_promedio")));
            controlseco.setAbs_Aceite(Double.parseDouble(request.getParameter("abs_Aceite")));
            controlseco.setBrigh(Double.parseDouble(request.getParameter("Brigh")));
            controlseco.setWhitness(Double.parseDouble(request.getParameter("Whitness")));
            controlseco.setDv50(Double.parseDouble(request.getParameter("Dv50")));
            controlseco.setDv90(Double.parseDouble(request.getParameter("Dv90")));
            controlseco.setComentarios(request.getParameter("comentarios"));
            controlseco.setObservacion(request.getParameter("observacion"));
            controlseco.setIdProductos(Integer.parseInt(request.getParameter("idProductos")));
            controlseco.setIdUsuarios(Integer.parseInt(request.getParameter("idUsuarios")));
            controlseco.setIdConsecutivo(Integer.parseInt(request.getParameter("idConsecutivo")));

            // Recoger los valores de los campos de humedad y pH dinámicamente desde el formulario
            for (Map.Entry<String, String[]> entry : request.getParameterMap().entrySet()) {
                String paramName = entry.getKey();
                String[] paramValues = entry.getValue();
                for (String paramValue : paramValues) {
                    System.out.println("Nombre del parámetro: " + paramName + ", Valor: " + paramValue);
                }
                if (paramName.startsWith("humedad_")) {
                    // Extraer el índice de la humedad del nombre del parámetro
                    try {
                        int index = Integer.parseInt(paramName.substring("humedad_".length()));
                        double humedad = Double.parseDouble(paramValues[0]);
                        controlseco.setHumedad(index, humedad);
                    } catch (NumberFormatException e) {
                        System.err.println("Error al convertir el valor de humedad: " + paramValues[0]);
                    }
                } else if (paramName.startsWith("pH_")) {
                    // Extraer el índice del pH del nombre del parámetro
                    try {
                        int index = Integer.parseInt(paramName.substring("pH_".length()));
                        double pH = Double.parseDouble(paramValues[0]);
                        controlseco.setPH(index, pH);
                        System.out.println("Asignado pH: " + pH + " al índice: " + index);
                    } catch (NumberFormatException e) {
                        System.err.println("Error al convertir el valor de pH: " + paramValues[0]);
                    }
                }
            }

            // Actualizar en la base de datos
            if (DaoProductoSeco.editar2(controlseco)) {
                request.setAttribute("mensaje", "Actualización Exitosa");
            } else {
                request.setAttribute("mensaje", "Error, la actualización no fue realizada");
            }
            listarPS(request, response);

        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error al actualizar la Especificación: Datos numéricos incorrectos");
            listarPS(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al actualizar la Especificación");
            listarPS(request, response);
        }
    }

    private void eliminarPS(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int idControlCalidad = Integer.parseInt(request.getParameter("id"));

            if (DaoProductoSeco.eliminar(idControlCalidad)) {
                request.setAttribute("Mensaje", "El Reporte fue Eliminado Correctamente");
            } else {
                request.setAttribute("Mensaje", "No se pudo eliminar el Reporte Control ");
            }

            listarPS(request, response);

            // listarPS(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al eliminar el Registro");
            listarPS(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
