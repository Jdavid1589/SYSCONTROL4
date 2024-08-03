package Controlador;

import Modelo.Clientes;
import Persistencia.DaoClientes;

import java.io.IOException;

import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorClientes", urlPatterns = {"/ControladorClientes"})
public class ControladorClientes extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("accion");

        if (action == null || action.isEmpty()) {
            // Si no se especifica ninguna acción, por defecto listar clientes
            action = "listar";
        }
        switch (action.toLowerCase()) {
            case "listar":
                listarClientes(request, response);
                break;
            case "add":
                mostrarFormularioAgregar(request, response);
                break;
            case "registrar":
                registrarCliente(request, response);
                break;
            case "buscar":
                buscarClientes(request, response);
                break;
            case "editarclientes":
                mostrarFormularioEditar(request, response);
                break;
            case "editcliente":
                editarCliente(request, response);
                break;
            case "eliminar":
                eliminarCliente(request, response);
                break;
            case "updatecell":
                actualizarCelda(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción desconocida");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void listarClientes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Clientes> listaClientes = DaoClientes.listar();
        request.setAttribute("listaClientes", listaClientes);
        request.getRequestDispatcher("Vistas/Listar_Clientes.jsp").forward(request, response);
    }

    private void mostrarFormularioAgregar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Vistas/Registro_Clientes.jsp").forward(request, response);
    }

    private void registrarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Clientes clientes = new Clientes();
        clientes.setRazon_Social(request.getParameter("razonSocial"));
        clientes.setNombres_apellidos(request.getParameter("nombres"));
        clientes.setIdDocumento(Integer.parseInt(request.getParameter("idDocumento")));
        clientes.setNumero_Documento(request.getParameter("numDocumento"));
        clientes.setDireccion(request.getParameter("direccion"));
        clientes.setNumero_Telefono(request.getParameter("numTelefono"));
        clientes.setCorreo(request.getParameter("correo"));

        if (DaoClientes.grabar(clientes)) {
            request.setAttribute("mensaje", "El usuario fue registrado correctamente");
        } else {
            request.setAttribute("mensaje", "No se pudo registrar el usuario, verificar los campos ingresados");
        }

        listarClientes(request, response);
    }

    private void buscarClientes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String texto = request.getParameter("txtbuscar");
        List<Clientes> listaClientes = DaoClientes.buscarClientes(texto);
        request.setAttribute("listaClientes", listaClientes);
        request.getRequestDispatcher("Vistas/Listar_Clientes.jsp").forward(request, response);
    }

    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("idEditar", request.getParameter("id"));
        request.getRequestDispatcher("Vistas/Editar_Clientes.jsp").forward(request, response);
    }

    private void editarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Clientes clientes = new Clientes();

        clientes.setRazon_Social(request.getParameter("razonSocial"));
        clientes.setNombres_apellidos(request.getParameter("nombres"));
        clientes.setIdDocumento(Integer.parseInt(request.getParameter("idDocumento")));
        clientes.setNumero_Documento(request.getParameter("numDocumento"));
        clientes.setDireccion(request.getParameter("direccion"));
        clientes.setNumero_Telefono(request.getParameter("numTelefono"));
        clientes.setCorreo(request.getParameter("correo"));
        clientes.setIdclientes(Integer.parseInt(request.getParameter("txtid")));

        if (DaoClientes.editar(clientes)) {
            request.setAttribute("mensaje", "El usuario fue actualizado correctamente");
        } else {
            request.setAttribute("mensaje", "No se pudo actualizar el usuario, verificar los campos ingresados");
        }

        listarClientes(request, response);
    }

    private void actualizarCelda(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String column = request.getParameter("column");
        String value = request.getParameter("value");

        System.out.println("ID: " + id);
        System.out.println("Column: " + column);
        System.out.println("Value: " + value);

        if (DaoClientes.actualizarCelda(id, column, value)) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("error");
        }
    }

    private void eliminarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idclientes = Integer.parseInt(request.getParameter("id"));

        if (DaoClientes.eliminar(idclientes)) {
            request.setAttribute("mensaje", "El usuario fue eliminado correctamente");
        } else {
            request.setAttribute("mensaje", "No se pudo eliminar el usuario");
        }

        listarClientes(request, response);
    }
}
