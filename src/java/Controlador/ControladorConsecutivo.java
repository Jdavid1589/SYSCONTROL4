package Controlador;

import Modelo.Consecutivo;
import Persistencia.DaoConsecutivo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControladorConsecutivo extends HttpServlet {

    Consecutivo cons = new Consecutivo();
    int ide;  // Variable de instancia para almacenar el ID

    //La variable serialVersionUID se utiliza en Java para asignar una versión única 
    //a una clase Serializable.
    //En este contexto, private static final long serialVersionUID = 1L; simplemente está estableciendo 
    //el serialVersionUID de la clase ControladorConsecutivo
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String action = request.getParameter("accion");

        switch (action) {
            case "add":
                request.getRequestDispatcher("Vistas/RegistroConsecutivo.jsp").forward(request, response);
                break;

            case "RegistrarConsecutivo":
                registrarConsecutivo(request, response);
                break;

            case "Listar2":
                listarConsecutivos(request, response);
                break;
            case "Listar3":
                listarConsecutivos3(request, response);
                break;

            case "editarConsecutivo":
                editarConsecutivo(request, response);
                break;

            case "editarConsecutivo2":
                request.setAttribute("idEditar", request.getParameter("id"));
                request.getRequestDispatcher("Vistas/EditarConsecutivo.jsp").forward(request, response);
                break;

            case "actualizar":
                actualizarConsecutivo(request, response);
                break;
            case "actualizar2":
                actualizarConsecutivo2(request, response);
                break;

            case "buscar":
                buscarConsecutivos(request, response);
                break;

            /*  case "eliminar":
                eliminarConsecutivo(request, response);
                break;*/
            case "eliminar2":
                eliminarConsecutivo2(request, response);
                break;
            case "canDelete":
                ValidarCanDelete(request, response);
                break;
            case "updatecell":
                actualizarCelda(request, response);
                break;

            default:
                // Handle any other actions or provide a default behavior
                break;
        }
    }

    private void registrarConsecutivo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int idespecificaciones = Integer.parseInt(request.getParameter("idespecificaciones"));
            String nroRemision = request.getParameter("nroRemision");

            String fechaCertificado = request.getParameter("fechaCertificado");
            String fechaProduccion = request.getParameter("fechaProduccion");
            int cantidadMaterial = Integer.parseInt(request.getParameter("cantidadMaterial"));
            String lote = request.getParameter("lote");
            String clientenn = request.getParameter("cliente_NN");
            int idUsuarios = Integer.parseInt(request.getParameter("idUsuarios"));

            Consecutivo consecutivo = new Consecutivo();

            consecutivo.setIdEspecificaciones(idespecificaciones);
            consecutivo.setNroRemision(nroRemision);

            consecutivo.setFechaCertificado(fechaCertificado);
            consecutivo.setFechaProduccion(fechaProduccion);
            consecutivo.setCantidadMaterial(cantidadMaterial);
            consecutivo.setIdUsuarios(idUsuarios);
            consecutivo.setLote(lote);
            consecutivo.setCliente_NN(clientenn);

            if (DaoConsecutivo.grabarConsecutivo(consecutivo)) {
                request.setAttribute("mensaje", "Consecutivo fue registrado");
            } else {
                request.setAttribute("mensaje", "Consecutivo no fue registrado, validar campos ingresados");
            }
            //  listarConsecutivos(request, response);
            /*    List<Consecutivo> lt = DaoConsecutivo.listar();
            request.setAttribute("listaConsecutivo", lt);
            request.getRequestDispatcher("Vistas/ListaConsecutivo.jsp").forward(request, response);*/

            listarConsecutivos3(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al registrar el Consecutivo");
            listarConsecutivos(request, response);
        }
    }

    private void listarConsecutivos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Consecutivo> lt = DaoConsecutivo.listar();
            request.setAttribute("listaConsecutivo", lt);
            request.getRequestDispatcher("Vistas/ListaConsecutivo.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al listar los Consecutivos");
            request.getRequestDispatcher("Vistas/ListaConsecutivo.jsp").forward(request, response);
        }
    }

    private void listarConsecutivos3(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Consecutivo> lt = DaoConsecutivo.listar();
            request.setAttribute("listaConsecutivo", lt);
            request.getRequestDispatcher("Vistas/ListaConsecutivo2.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al listar los Consecutivos");
            request.getRequestDispatcher("Vistas/ListaConsecutivo2.jsp").forward(request, response);
        }
    }

    //.  Metodo para actualizar directamente desde la tabla
    private void actualizarCelda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String column = request.getParameter("column");
        String value = request.getParameter("value");

        // System.out.println("ID: " + id);
        //System.out.println("Column: " + column);
        // System.out.println("Value: " + value);
        if (DaoConsecutivo.actualizarCelda(id, column, value)) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("error");
        }
    }

    private void editarConsecutivo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Obtener el ID del parámetro de solicitud y almacenarlo en la variable de instancia
            ide = Integer.parseInt(request.getParameter("id"));
            Consecutivo cons = DaoConsecutivo.obtenerConsecutivoPorId(ide);

            request.setAttribute("Consec", cons);

            listarConsecutivos3(request, response);

        } catch (IOException | NumberFormatException | ServletException ex) {
            request.setAttribute("mensaje", "Error al editar el Consecutivo");
            listarConsecutivos(request, response);
        }
    }

    private void actualizarConsecutivo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Utilizar la variable de instancia para obtener el ID
            Consecutivo cons = DaoConsecutivo.obtenerConsecutivoPorId(ide);
            request.setAttribute("Consec", cons);

            // Resto del código para actualizar el Consecutivo
            String nroRemi = request.getParameter("nroRemision");
            int idespecificaciones = Integer.parseInt(request.getParameter("idespecificaciones"));

            String fechaCert = request.getParameter("fechaCertificado");
            String fechaProdu = request.getParameter("fechaProduccion");
            int cantidadM = Integer.parseInt(request.getParameter("cantidadMaterial"));
            int usuarios_id = Integer.parseInt(request.getParameter("idUsuarios"));
            String lote = request.getParameter("lote");
            String clientenn = request.getParameter("cliente_NN");

            Consecutivo consecutivo = new Consecutivo();

            consecutivo.setNroRemision(nroRemi);
            consecutivo.setIdEspecificaciones(idespecificaciones);

            consecutivo.setFechaCertificado(fechaCert);
            consecutivo.setFechaProduccion(fechaProdu);
            consecutivo.setCantidadMaterial(cantidadM);
            consecutivo.setIdUsuarios(usuarios_id);
            consecutivo.setLote(lote);
            consecutivo.setCliente_NN(clientenn);
            consecutivo.setIdconsecutivo(ide);

            boolean actualizacionExitosa = DaoConsecutivo.editar(consecutivo);

            String mensaje = actualizacionExitosa ? "Consecutivo actualizado correctamente" : "No se pudo actualizar el Consecutivo";
            request.setAttribute("mensaje", mensaje);

            /*  List<Consecutivo> lt = DaoConsecutivo.listar();
        request.setAttribute("listaConsecutivo", lt);
        request.getRequestDispatcher("Vistas/ListaConsecutivo.jsp").forward(request, response);*/
            listarConsecutivos3(request, response);

        } catch (IOException | NumberFormatException | ServletException ex) {
            request.setAttribute("mensaje", "Error al actualizar el Consecutivo: " + ex.getMessage());
            listarConsecutivos(request, response);
        }
    }

    private void actualizarConsecutivo2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Utilizar la variable de instancia para obtener el ID       

            // Resto del código para actualizar el Consecutivo
            String nroRemi = request.getParameter("nroRemision");
            
            int idespecificaciones = Integer.parseInt(request.getParameter("idespecificaciones"));

            String fechaCert = request.getParameter("fechaCertificado");
            String fechaProdu = request.getParameter("fechaProduccion");
            int cantidadM = Integer.parseInt(request.getParameter("cantidadMaterial"));
            int usuarios_id = Integer.parseInt(request.getParameter("idUsuarios"));
            String lote = request.getParameter("lote");
            String clientenn = request.getParameter("cliente_NN");
            int txtConsecutivo = Integer.parseInt(request.getParameter("txtid"));

            Consecutivo consecutivo = new Consecutivo();

            consecutivo.setNroRemision(nroRemi);
            consecutivo.setIdEspecificaciones(idespecificaciones);

            consecutivo.setFechaCertificado(fechaCert);
            consecutivo.setFechaProduccion(fechaProdu);
            consecutivo.setCantidadMaterial(cantidadM);
            consecutivo.setIdUsuarios(usuarios_id);
            consecutivo.setLote(lote);
            consecutivo.setCliente_NN(clientenn);
            
            consecutivo.setIdconsecutivo(txtConsecutivo);

            boolean actualizacionExitosa = DaoConsecutivo.editar(consecutivo);

            String mensaje = actualizacionExitosa ? "Consecutivo actualizado correctamente" : "No se pudo actualizar el Consecutivo";
            request.setAttribute("mensaje", mensaje);

            /*  List<Consecutivo> lt = DaoConsecutivo.listar();
        request.setAttribute("listaConsecutivo", lt);
        request.getRequestDispatcher("Vistas/ListaConsecutivo.jsp").forward(request, response);*/
            listarConsecutivos3(request, response);

        } catch (IOException | NumberFormatException | ServletException ex) {
            request.setAttribute("mensaje", "Error al actualizar el Consecutivo: " + ex.getMessage());
            listarConsecutivos(request, response);
        }
    }

    private void buscarConsecutivos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String texto = request.getParameter("txtbuscar");
            List<Consecutivo> lt = DaoConsecutivo.buscarConsecutivo(texto);
            request.setAttribute("listaConsecutivo", lt);
            request.getRequestDispatcher("Vistas/ListaConsecutivo.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al buscar los Consecutivos");
            request.getRequestDispatcher("Vistas/ListaConsecutivo.jsp").forward(request, response);
        }
    }

    private void eliminarConsecutivo2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int idconsecutivo = Integer.parseInt(request.getParameter("id"));

            if (DaoConsecutivo.canDelete(idconsecutivo)) {
                if (DaoConsecutivo.eliminar(idconsecutivo)) {
                    request.setAttribute("mensaje", "El Reporte fue Eliminado Correctamente");
                } else {
                    request.setAttribute("mensaje", "No se pudo eliminar el Reporte");
                }
            } else {
                request.setAttribute("mensaje", "El Reporte no se puede eliminar porque está en uso");
            }

            listarConsecutivos(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al eliminar el Consecutivo");
            listarConsecutivos(request, response);
        }
    }

    //Metodo para validar si un resgistro esta siendo usado en controlcalidad
    private void ValidarCanDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el ID del registro a verificar desde la petición HTTP
        int idconsecutivo = Integer.parseInt(request.getParameter("id"));

        // Llamar al método canDelete del DAO para verificar si se puede eliminar el registro
        boolean canDelete = DaoConsecutivo.canDelete(idconsecutivo);

        // Establecer el tipo de contenido de respuesta en JSON
        response.setContentType("application/json");

        // Obtener el objeto PrintWriter para enviar la respuesta como un objeto JSON
        PrintWriter out = response.getWriter();

        // Escribir el valor booleano canDelete como un objeto JSON
        out.print(canDelete);

        // Asegurarse de que la respuesta se envíe al cliente
        out.flush();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
