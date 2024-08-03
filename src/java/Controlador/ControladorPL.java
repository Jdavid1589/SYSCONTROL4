package Controlador;

import Modelo.ControlLodo;

import Persistencia.DaoProductoLodo;
import Persistencia.DaoProductoSeco;
import java.io.IOException;

import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControladorPL extends HttpServlet {

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

            case "add2":
                request.getRequestDispatcher("Vistas/RegistroPL2.jsp").forward(request, response);
                break;

            case "registrar3":
                registrarPL3(request, response);
                break;

            case "listar":
                listarPL(request, response);
                break;

            case "editar_pl":
                request.setAttribute("idEditarPL", request.getParameter("id"));
                request.getRequestDispatcher("Vistas/EditarProductoLodos.jsp").forward(request, response);
                break;
            case "editar2":
                request.setAttribute("idEditarPL", request.getParameter("id"));
                request.getRequestDispatcher("Vistas/EditarPL2.jsp").forward(request, response);
                break;

            case "registrarEdicion":
                //  actualizarPL(request, response);
                break;
            case "registrarEdicion2":
                actualizarPL2(request, response);
                break;

            case "pdf":
                request.setAttribute("idpdf", request.getParameter("id"));
                request.getRequestDispatcher("Vistas/CertificadoLodo.jsp").forward(request, response);
                break;

            case "buscar":
                buscarReporte(request, response);
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

    private void registrarPL3(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String fecha = request.getParameter("fecha");
            String lote = request.getParameter("lote");
            int sto = Integer.parseInt(request.getParameter("txtSto"));
            String txtTanque = request.getParameter("tanque");
            Double txtCantkg = Double.valueOf(request.getParameter("Cantidadkg"));
            Double txtSolidos = Double.valueOf(request.getParameter("solidos"));
            Double txtHumedad = Double.valueOf(request.getParameter("humedad"));
            Double retenido325 = Double.valueOf(request.getParameter("r325"));
            Double txtpH = Double.valueOf(request.getParameter("pH"));
            Double txtku = Double.valueOf(request.getParameter("ku"));
            Double txtcP = Double.valueOf(request.getParameter("cP"));
            Double abs_Aceite = Double.valueOf(request.getParameter("AbsAceite"));

            Double Brigh = Double.valueOf(request.getParameter("Brigh"));
            Double Whitness = Double.valueOf(request.getParameter("Wh"));

            Double BrighLeneta = Double.valueOf(request.getParameter("Brigh_Leneta"));
            Double WhitnessLeneta = Double.valueOf(request.getParameter("Wh_Leneta"));

            Double Dv50 = Double.valueOf(request.getParameter("Dv50"));
            Double Dv90 = Double.valueOf(request.getParameter("Dv90"));
            int txtkgAgua = Integer.parseInt(request.getParameter("kgAgua"));
            Double txtkgDisp = Double.valueOf(request.getParameter("dispersante"));
            int txtkgEsp = Integer.parseInt(request.getParameter("espesante"));
            int txtLtBio = Integer.parseInt(request.getParameter("Biocidad"));
            Double txtPorBio = Double.valueOf(request.getParameter("dosisBiocidad"));
            Double txtSodio = Double.valueOf(request.getParameter("kgSodio"));

            String observacion = request.getParameter("observacion");
            String comentarios = request.getParameter("comentarios");
            int IdProductos = Integer.parseInt(request.getParameter("producto"));
            int IdUsuarios = Integer.parseInt(request.getParameter("idUsuarios"));
            int IdConsecutivo = Integer.parseInt(request.getParameter("Consecutivo"));

            ControlLodo controlLodo = new ControlLodo();

            controlLodo.setFecha(fecha);
            controlLodo.setLote(lote);
            controlLodo.setIdSeguimiento(sto);
            controlLodo.setNumeroTanque(txtTanque);
            controlLodo.setCantiKgLodo(txtCantkg);
            controlLodo.setSolidos(txtSolidos);
            controlLodo.setHumedad(txtHumedad); // 7

            controlLodo.setRetenido325(retenido325);
            controlLodo.setpH(txtpH);
            controlLodo.setViscosidadKu(txtku);
            controlLodo.setViscosidadCp(txtcP);
            controlLodo.setAbs_Aceite(abs_Aceite);
            controlLodo.setBrigh(Brigh);
            controlLodo.setWhitness(Whitness);
            controlLodo.setBrigh_Leneta(BrighLeneta);
            controlLodo.setWhitness_Leneta(WhitnessLeneta);
            controlLodo.setDv50(Dv50);
            controlLodo.setDv90(Dv90);  // 16

            controlLodo.setLtAgua(txtkgAgua);
            controlLodo.setDispersante(txtkgDisp);
            controlLodo.setLtNatrosol(txtkgEsp);
            controlLodo.setLtBiocidad(txtLtBio);
            controlLodo.setBiocidadPorcentaje(txtPorBio); // 5
            controlLodo.setKgCarbonatoSosio(txtSodio); // 5

            controlLodo.setComentarios(comentarios);
            controlLodo.setObservacion(observacion);
            controlLodo.setIdProductos(IdProductos);
            controlLodo.setIdUsuarios(IdUsuarios);
            controlLodo.setIdConsecutivo(IdConsecutivo); // 27

            if (DaoProductoLodo.grabar(controlLodo)) {
                request.setAttribute("mensaje", "Registro Exitoso");
            } else {
                request.setAttribute("mensaje", "Error, el reporte no fue registrado");
            }
            listarPL(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al registrar  la Especificacion");
            listarPL(request, response);
        }
    }

    private void listarPL(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<ControlLodo> lt = DaoProductoLodo.listar();
            request.setAttribute("listaProducLodo", lt);
            request.getRequestDispatcher("Vistas/ListarProductoLodo.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al listar los Consecutivos");
            request.getRequestDispatcher("Vistas/ListarProductoLodo.jsp").forward(request, response);
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
        if (DaoProductoLodo.actualizarCelda(id, column, value)) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("error");
        }
    }

    private void actualizarPL2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String fecha = request.getParameter("fecha");
            String lote = request.getParameter("lote");
            int sto = Integer.parseInt(request.getParameter("txtSto"));
            String txtTanque = request.getParameter("tanque");
            Double txtCantkg = Double.valueOf(request.getParameter("Cantidadkg"));
            Double txtSolidos = Double.valueOf(request.getParameter("solidos"));
            Double txtHumedad = Double.valueOf(request.getParameter("humedad"));
            Double retenido325 = Double.valueOf(request.getParameter("r325"));
            Double txtpH = Double.valueOf(request.getParameter("pH"));
            Double txtku = Double.valueOf(request.getParameter("ku"));
            Double txtcP = Double.valueOf(request.getParameter("cP"));
            Double abs_Aceite = Double.valueOf(request.getParameter("AbsAceite"));
            Double Brigh = Double.valueOf(request.getParameter("Brigh"));
            Double Whitness = Double.valueOf(request.getParameter("Wh"));
            Double BrighLeneta = Double.valueOf(request.getParameter("Brigh_Leneta"));
            Double WhitnessLeneta = Double.valueOf(request.getParameter("Wh_Leneta"));
            Double Dv50 = Double.valueOf(request.getParameter("Dv50"));
            Double Dv90 = Double.valueOf(request.getParameter("Dv90"));
            int txtkgAgua = Integer.parseInt(request.getParameter("kgAgua"));
            Double txtkgDisp = Double.valueOf(request.getParameter("dispersante"));
            int txtkgEsp = Integer.parseInt(request.getParameter("espesante"));
            int txtLtBio = Integer.parseInt(request.getParameter("Biocidad"));
            Double txtPorBio = Double.valueOf(request.getParameter("dosisBiocidad"));
            Double txtSodio = Double.valueOf(request.getParameter("kgSodio"));

            String observacion = request.getParameter("observacion");
            String comentarios = request.getParameter("comentarios");
            int IdProductos = Integer.parseInt(request.getParameter("producto"));
            int IdUsuarios = Integer.parseInt(request.getParameter("idUsuarios"));
            int IdConsecutivo = Integer.parseInt(request.getParameter("Consecutivo"));

            int txtid_pl = Integer.parseInt(request.getParameter("txtid_pl"));

            ControlLodo controlLodo = new ControlLodo();

            controlLodo.setFecha(fecha);
            controlLodo.setLote(lote);
            controlLodo.setIdSeguimiento(sto);
            controlLodo.setNumeroTanque(txtTanque);
            controlLodo.setCantiKgLodo(txtCantkg);
            controlLodo.setSolidos(txtSolidos);
            controlLodo.setHumedad(txtHumedad); // 7

            controlLodo.setRetenido325(retenido325);
            controlLodo.setpH(txtpH);
            controlLodo.setViscosidadKu(txtku);
            controlLodo.setViscosidadCp(txtcP);
            controlLodo.setAbs_Aceite(abs_Aceite);
            controlLodo.setBrigh(Brigh);
            controlLodo.setWhitness(Whitness);
            controlLodo.setBrigh_Leneta(BrighLeneta);
            controlLodo.setWhitness_Leneta(WhitnessLeneta);
            controlLodo.setDv50(Dv50);
            controlLodo.setDv90(Dv90);  // 16

            controlLodo.setLtAgua(txtkgAgua);
            controlLodo.setDispersante(txtkgDisp);
            controlLodo.setLtNatrosol(txtkgEsp);
            controlLodo.setLtBiocidad(txtLtBio);
            controlLodo.setBiocidadPorcentaje(txtPorBio); // 5
            controlLodo.setKgCarbonatoSosio(txtSodio); // 5

            controlLodo.setComentarios(comentarios);
            controlLodo.setObservacion(observacion);
            controlLodo.setIdProductos(IdProductos);
            controlLodo.setIdUsuarios(IdUsuarios);
            controlLodo.setIdConsecutivo(IdConsecutivo); // 27
            controlLodo.setIdControlCalidad(txtid_pl);

            boolean actualizacionExitosa = DaoProductoLodo.editar(controlLodo);

            if (actualizacionExitosa) {
                request.setAttribute("mensaje", "Consecutivo actualizado correctamente");

            } else {
                request.setAttribute("mensaje", "No se pudo actualizar el Consecutivo");
            }

            listarPL(request, response);

        } catch (IOException | NumberFormatException | ServletException ex) {
            request.setAttribute("mensaje", "Error al actualizar el reporte: " + ex.getMessage());
            listarPL(request, response);
        }
    }

    private void buscarReporte(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String texto = request.getParameter("txtbuscar");
            List<ControlLodo> lt = DaoProductoLodo.Buscar4(texto);
            request.setAttribute("listaProducLodo", lt);
            request.getRequestDispatcher("Vistas/ListarProductoLodo.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al buscar Reporte");
            request.getRequestDispatcher("Vistas/ListarProductoLodo.jsp").forward(request, response);
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

            listarPL(request, response);

            // listarPS(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al eliminar el Registro");
            listarPL(request, response);
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
