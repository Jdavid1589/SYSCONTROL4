package Persistencia;

import Modelo.ReportePdfLodo;

import Modelo.VariableUFC;
import Modelo.VariablesPL;
import Persistencia.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoReportePdfLodo {

    
 static Conexion dao = Conexion.getInstance();
// Usar la conexión para realizar consultas y operaciones en la base de datos
    static Connection con;
    static PreparedStatement ps;
    static ResultSet rs;
    //static ReportePdfSeco reportePdfSeco = new ReportePdfSeco();

    private static final Logger logger = Logger.getLogger(DaoReportePdfLodo.class.getName());

    //Grabar1= Metodo para Registrar Varios(L055 - L1117- OEM V5
    public static boolean grabar1(ReportePdfLodo reportePdfLodo) {

        try (Connection con = dao.getConnection(); PreparedStatement ps = con.prepareStatement(getSql())) {

            // Establecer los primeros 24 parámetros
            ps.setString(1, reportePdfLodo.getProducto());
            ps.setString(2, reportePdfLodo.getFechaCertificado());
            ps.setString(3, reportePdfLodo.getCliente());
            ps.setString(4, reportePdfLodo.getNumCertificado());
            ps.setString(5, reportePdfLodo.getNumRemision());
            ps.setString(6, reportePdfLodo.getCantidadKg());
            ps.setString(7, reportePdfLodo.getLote());
            ps.setString(8, reportePdfLodo.getSolidos());
            ps.setString(9, reportePdfLodo.getHumedad());
            ps.setString(10, reportePdfLodo.getpH());
            ps.setString(11, reportePdfLodo.getDensidadg());
            ps.setString(12, reportePdfLodo.getDensidadkggal());
            ps.setString(13, reportePdfLodo.getViscosidadCp());
            ps.setString(14, reportePdfLodo.getViscosidadKu());
            ps.setString(15, reportePdfLodo.getUfc());
            ps.setString(16, reportePdfLodo.getRetenido325());
            ps.setString(17, reportePdfLodo.getAA());
            ps.setString(18, reportePdfLodo.getBr());
            ps.setString(19, reportePdfLodo.getWh());
            ps.setString(20, reportePdfLodo.getDv50());
            ps.setString(21, reportePdfLodo.getDv90());
            ps.setString(22, reportePdfLodo.getAuxiliar());
            ps.setString(23, reportePdfLodo.getBr_Leneta());
            ps.setString(24, reportePdfLodo.getWh_Leneta());
            ps.setString(25, reportePdfLodo.getUfcTiempo());

            // Establecer los valores de las variables PL dinámicamente
            List<VariablesPL> variablesPL = reportePdfLodo.getVariablesPL();
            for (int i = 0; i < variablesPL.size(); i++) {
                VariablesPL variable = variablesPL.get(i);
                int baseIndex = 26 + i * 3; // Índice base para la variable actual

                ps.setString(baseIndex, variable.getTipo());
                ps.setString(baseIndex + 1, variable.getRango());
                ps.setString(baseIndex + 2, variable.getMetodo());
            }

            // Establecer los valores de la variable UFC, asumiendo que solo hay una
            List<VariableUFC> variablesUFC = reportePdfLodo.getVariablesUFC();
            if (!variablesUFC.isEmpty()) {
                VariableUFC variableUFC = variablesUFC.get(0);
                int baseIndexUFC = 62; // Índice base para la variable UFC

                ps.setString(baseIndexUFC, variableUFC.getTipo());
                ps.setString(baseIndexUFC + 1, variableUFC.getRango());
                ps.setString(baseIndexUFC + 2, variableUFC.getMetodo());
            }

            // Ejecutar la consulta y verificar el resultado
            if (ps.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error al guardar el reporte PDF lodo", e);
            return false;
        }

    }

    // Grabar2= Metodo para Registrar L055 Colorquimica
    public static boolean grabar2(ReportePdfLodo reportePdfLodo) {
        try (Connection con = dao.getConnection(); PreparedStatement ps = con.prepareStatement(getSql())) {

            // Establecer los primeros 25 parámetros
            ps.setString(1, reportePdfLodo.getProducto());
            ps.setString(2, reportePdfLodo.getFechaCertificado());
            ps.setString(3, reportePdfLodo.getCliente());
            ps.setString(4, reportePdfLodo.getNumCertificado());
            ps.setString(5, reportePdfLodo.getNumRemision());
            ps.setString(6, reportePdfLodo.getCantidadKg());
            ps.setString(7, reportePdfLodo.getLote());
            ps.setString(8, reportePdfLodo.getSolidos());
            ps.setString(9, reportePdfLodo.getHumedad());
            ps.setString(10, reportePdfLodo.getpH());
            ps.setString(11, reportePdfLodo.getDensidadg());
            ps.setString(12, reportePdfLodo.getDensidadkggal());
            ps.setString(13, reportePdfLodo.getViscosidadCp());
            ps.setString(14, reportePdfLodo.getViscosidadKu());
            ps.setString(15, reportePdfLodo.getUfc());
            ps.setString(16, reportePdfLodo.getRetenido325());
            ps.setString(17, reportePdfLodo.getAA());
            ps.setString(18, reportePdfLodo.getBr());
            ps.setString(19, reportePdfLodo.getWh());
            ps.setString(20, reportePdfLodo.getDv50());
            ps.setString(21, reportePdfLodo.getDv90());
            ps.setString(22, reportePdfLodo.getAuxiliar());
            ps.setString(23, reportePdfLodo.getBr_Leneta());
            ps.setString(24, reportePdfLodo.getWh_Leneta());
            ps.setString(25, reportePdfLodo.getUfcTiempo());

            // Establecer los valores de las variables PL dinámicamente
            List<VariablesPL> variablesPL = reportePdfLodo.getVariablesPL();
            for (int i = 0; i < variablesPL.size(); i++) {
                VariablesPL variable = variablesPL.get(i);
                int baseIndex = 26 + i * 3; // Índice base para la variable actual

                ps.setString(baseIndex, variable.getTipo());
                ps.setString(baseIndex + 1, variable.getRango());
                ps.setString(baseIndex + 2, variable.getMetodo());
            }

            // Establecer los valores de las variables UFC dinámicamente
            List<VariableUFC> variablesUFC = reportePdfLodo.getVariablesUFC();
            if (!variablesUFC.isEmpty()) {
                for (int i = 0; i < variablesUFC.size(); i++) {
                    VariableUFC variableUFC = variablesUFC.get(i);
                    int baseIndexUFC = 26 + variablesPL.size() * 3 + i * 3; // Índice base para las variables UFC

                    ps.setString(baseIndexUFC, variableUFC.getTipo());
                    ps.setString(baseIndexUFC + 1, variableUFC.getRango());
                    ps.setString(baseIndexUFC + 2, variableUFC.getMetodo());
                }
            }

            // Ejecutar la consulta y verificar el resultado
            if (ps.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace(); // Es recomendable registrar el error para depuración
        } finally {
            cerrarRecursos(con, ps);
        }
        return false;
    }

    // Grabar3= Metodo para Registrar OEM CN 2 (1)
    public static boolean grabar3(ReportePdfLodo reportePdfLodo) {

        try (Connection con = dao.getConnection(); PreparedStatement ps = con.prepareStatement(getSql())) {

            // Establecer los primeros 25 parámetros
            ps.setString(1, reportePdfLodo.getProducto());
            ps.setString(2, reportePdfLodo.getFechaCertificado());
            ps.setString(3, reportePdfLodo.getCliente());
            ps.setString(4, reportePdfLodo.getNumCertificado());
            ps.setString(5, reportePdfLodo.getNumRemision());
            ps.setString(6, reportePdfLodo.getCantidadKg());
            ps.setString(7, reportePdfLodo.getLote());
            ps.setString(8, reportePdfLodo.getSolidos());
            ps.setString(9, reportePdfLodo.getHumedad());
            ps.setString(10, reportePdfLodo.getpH());
            ps.setString(11, reportePdfLodo.getDensidadg());
            ps.setString(12, reportePdfLodo.getDensidadkggal());
            ps.setString(13, reportePdfLodo.getViscosidadCp());
            ps.setString(14, reportePdfLodo.getViscosidadKu());
            ps.setString(15, reportePdfLodo.getUfc());
            ps.setString(16, reportePdfLodo.getRetenido325());
            ps.setString(17, reportePdfLodo.getAA());
            ps.setString(18, reportePdfLodo.getBr());
            ps.setString(19, reportePdfLodo.getWh());
            ps.setString(20, reportePdfLodo.getDv50());
            ps.setString(21, reportePdfLodo.getDv90());
            ps.setString(22, reportePdfLodo.getAuxiliar());
            ps.setString(23, reportePdfLodo.getBr_Leneta());
            ps.setString(24, reportePdfLodo.getWh_Leneta());
            ps.setString(25, reportePdfLodo.getUfcTiempo());

            List<VariablesPL> variables = reportePdfLodo.getVariablesPL();

            // Establecer los valores de las variables, sus rangos y métodos dinámicamente
            for (int i = 0; i < variables.size(); i++) {
                VariablesPL variable = variables.get(i);
                int baseIndex = 26 + i * 3; // Índice base para la variable actual

                // Establecer el tipo de variable
                ps.setString(baseIndex, variable.getTipo());

                // Establecer el rango de la variable
                ps.setString(baseIndex + 1, variable.getRango());

                // Establecer el método de la variable
                ps.setString(baseIndex + 2, variable.getMetodo());
            }

            // Verificar que se configuraron exactamente 64 parámetros
            int totalParameters = 25 + variables.size() * 3;
            if (totalParameters != 64) {
                throw new SQLException("Expected 64 parameters, but got " + totalParameters);
            }

            if (ps.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            cerrarRecursos(con, ps);
        }
        return false;
    }

    // Grabar4= Metodo para Registrar OEM CN 2 Mejorado
    public static boolean grabar4(ReportePdfLodo reportePdfLodo) {

        try (Connection con = dao.getConnection(); PreparedStatement ps = con.prepareStatement(getSql())) {

            // Establecer los primeros 25 parámetros
            int index = 1;
            ps.setString(index++, reportePdfLodo.getProducto());
            ps.setString(index++, reportePdfLodo.getFechaCertificado());
            ps.setString(index++, reportePdfLodo.getCliente());
            ps.setString(index++, reportePdfLodo.getNumCertificado());
            ps.setString(index++, reportePdfLodo.getNumRemision());
            ps.setString(index++, reportePdfLodo.getCantidadKg());
            ps.setString(index++, reportePdfLodo.getLote());
            ps.setString(index++, reportePdfLodo.getSolidos());
            ps.setString(index++, reportePdfLodo.getHumedad());
            ps.setString(index++, reportePdfLodo.getpH());
            ps.setString(index++, reportePdfLodo.getDensidadg());
            ps.setString(index++, reportePdfLodo.getDensidadkggal());
            ps.setString(index++, reportePdfLodo.getViscosidadCp());
            ps.setString(index++, reportePdfLodo.getViscosidadKu());
            ps.setString(index++, reportePdfLodo.getUfc());
            ps.setString(index++, reportePdfLodo.getRetenido325());
            ps.setString(index++, reportePdfLodo.getAA());
            ps.setString(index++, reportePdfLodo.getBr());
            ps.setString(index++, reportePdfLodo.getWh());
            ps.setString(index++, reportePdfLodo.getDv50());
            ps.setString(index++, reportePdfLodo.getDv90());
            ps.setString(index++, reportePdfLodo.getAuxiliar());
            ps.setString(index++, reportePdfLodo.getBr_Leneta());
            ps.setString(index++, reportePdfLodo.getWh_Leneta());
            ps.setString(index++, reportePdfLodo.getUfcTiempo());

            List<VariablesPL> variables = reportePdfLodo.getVariablesPL();
            for (VariablesPL variable : variables) {
                ps.setString(index++, variable.getTipo());
                ps.setString(index++, variable.getRango());
                ps.setString(index++, variable.getMetodo());
            }

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {

            return false;
        } finally {
            cerrarRecursos(con, ps);
        }
    }

    // Consulta SQL Independiente para Metodo Registrar (Todos)
    private static String getSql() {

        return "INSERT INTO certificadopdflodo "
                + "(producto, fechaCertificado, cliente, numCertificado, numRemision, cantidadKg, "
                + "lote, Solidos, humedad, pH, densidadg, densidadkggal, viscosidadCp, viscosidadKu, ufc, retenido325, AA, Br, Wh, Dv50, Dv90, Auxiliar, Brigh_Leneta, Whitness_Leneta, ufcTiempo, "
                + "variableEsp1, rango1, metodo1, variableEsp2, rango2, metodo2, variableEsp3, rango3, metodo3, "
                + "variableEsp4, rango4, metodo4, variableEsp5, rango5, metodo5, variableEsp6, rango6, metodo6, "
                + "variableEsp7, rango7, metodo7, variableEsp8, rango8, metodo8, variableEsp9, rango9, metodo9, "
                + "variableEsp10, rango10, metodo10, variableEsp11, rango11, metodo11, "
                + "variableEsp12, rango12, metodo12, variableEsp13, rango13, metodo13) "//64
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,"//15
                + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?," //16
                + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?," //17
                + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";//16

    }

//Se le paso como parametro el modelo Cosnsecutivo
    public static List<ReportePdfLodo> listar() {
        List<ReportePdfLodo> lista = new ArrayList<>();
        try {
            con = dao.getConnection();
            String sql = "SELECT * FROM certificadopdflodo;";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                ReportePdfLodo reportePdfLodo = new ReportePdfLodo();

                reportePdfLodo.setIdCertificadoLodo(rs.getInt("idCertificadoLodo"));
                reportePdfLodo.setProducto(rs.getString("producto"));
                reportePdfLodo.setFechaCertificado(rs.getString("fechaCertificado"));
                reportePdfLodo.setCliente(rs.getString("cliente"));
                reportePdfLodo.setNumCertificado(rs.getString("numCertificado"));
                reportePdfLodo.setNumRemision(rs.getString("numRemision"));
                reportePdfLodo.setCantidadKg(rs.getString("CantidadKg"));
                reportePdfLodo.setLote(rs.getString("lote"));
                reportePdfLodo.setSolidos(rs.getString("solidos"));
                reportePdfLodo.setHumedad(rs.getString("humedad"));
                reportePdfLodo.setDensidadg(rs.getString("densidadg"));
                reportePdfLodo.setDensidadkggal(rs.getString("densidadkggal"));
                reportePdfLodo.setViscosidadCp(rs.getString("viscosidadCp"));
                reportePdfLodo.setViscosidadKu(rs.getString("viscosidadKu"));
                reportePdfLodo.setpH(rs.getString("pH"));
                reportePdfLodo.setRetenido325(rs.getString("retenido325"));
                reportePdfLodo.setUfc(rs.getString("ufc"));
                reportePdfLodo.setUfcTiempo(rs.getString("ufcTiempo"));
                reportePdfLodo.setAA(rs.getString("AA"));
                reportePdfLodo.setBr(rs.getString("Br"));
                reportePdfLodo.setWh(rs.getString("Wh"));
                reportePdfLodo.setBr_Leneta(rs.getString("Brigh_Leneta"));
                reportePdfLodo.setWh_Leneta(rs.getString("Whitness_Leneta"));

                //reportePdfLodo.setYell(rs.getString("Yell"));
                reportePdfLodo.setDv50(rs.getString("Dv50"));
                reportePdfLodo.setAuxiliar(rs.getString("Auxiliar"));

                // Recuperar las variables y sus rangos
                List<VariablesPL> variables = new ArrayList<>();
                for (int i = 1; i <= 13; i++) { // Suponiendo que tienes hasta 13 pares de variables y rangos
                    String tipo = rs.getString("variableEsp" + i);
                    String rango = rs.getString("rango" + i);
                    String metodo = rs.getString("metodo" + i);
                    if (tipo != null && rango != null && metodo != null) {
                        VariablesPL variable = new VariablesPL(tipo, rango, metodo);
                        variables.add(variable);
                    }
                }
                reportePdfLodo.setVariablesPL(variables);

                lista.add(reportePdfLodo);
            }
        } catch (Exception e) {
        } finally {
            cerrarRecursos(con, ps);
        }
        return lista;
    }

    //Editar modificado
    public static boolean editar(ReportePdfLodo reportePdfLodo) {
        try {
       con = dao.getConnection();

            String sql = "UPDATE certificadopdflodo SET producto= ?, fechaCertificado= ?, cliente= ?, numCertificado= ?, numRemision= ?, CantidadKg= ?, "
                    + "lote= ?, humedad= ?, pH = ?,  retenido325= ?, AA= ?, Br= ?,  Wh= ?,   Dv50= ?,  Auxiliar= ?,  variableEsp1= ?, variableEsp2= ?,  variableEsp3= ?, "
                    + "variableEsp4 = ?, variableEsp5= ?, variableEsp6 = ?,  variableEsp7 = ?,  variableEsp8= ?,  rango1= ?,  rango2= ?, rango3= ?, rango4= ?,  rango5= ?, "
                    + "rango6 = ?, rango7= ?, rango8= ? "
                    + "WHERE idCertificadoLodo = ?";

            ps = con.prepareStatement(sql);

            ps.setString(1, reportePdfLodo.getProducto());
            ps.setString(2, reportePdfLodo.getFechaCertificado());
            ps.setString(3, reportePdfLodo.getCliente());
            ps.setString(4, reportePdfLodo.getNumCertificado());
            ps.setString(5, reportePdfLodo.getNumRemision());
            ps.setString(6, reportePdfLodo.getCantidadKg());
            ps.setString(7, reportePdfLodo.getLote());
            ps.setString(8, reportePdfLodo.getHumedad());
            ps.setString(9, reportePdfLodo.getpH());
            ps.setString(10, reportePdfLodo.getRetenido325());
            ps.setString(11, reportePdfLodo.getAA());
            ps.setString(12, reportePdfLodo.getBr());
            ps.setString(13, reportePdfLodo.getWh());
            //  ps.setString(14, reportePdfLodo.getYell());
            ps.setString(15, reportePdfLodo.getDv50());
            ps.setString(16, reportePdfLodo.getAuxiliar());

            List<VariablesPL> variables = reportePdfLodo.getVariablesPL();

            for (int i = 0; i < variables.size(); i++) {
                VariablesPL variable = variables.get(i);
                ps.setString(17 + i * 2, variable.getTipo());
                ps.setString(17 + i * 2 + 1, variable.getRango());
            }

            ps.setInt(33, reportePdfLodo.getIdCertificadoLodo());

            // Ejecutar la consulta de actualización
            int rowsAffected = ps.executeUpdate();

            // Verificar si se actualizó algún registro
            if (rowsAffected > 0) {
                return true; // La actualización fue exitosa
            }

        } catch (SQLException ex) {
            Logger.getLogger(DaoReportePdfSeco.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarRecursos();
        }
        return false;
    }

    public static boolean eliminar(int id) {
        try {
         con = dao.getConnection();
            String sql = "DELETE FROM certificadopdfseco WHERE idCertificadoSeco=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            if (ps.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Maneja las excepciones de mejor manera, por ejemplo, lanzando una excepción personalizada.
        } finally {
            cerrarRecursos(con, ps);
        }
        return false;
    }

    
    private static void cerrarRecursos(Connection con, PreparedStatement ps) {
        try {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error al cerrar los recursos", e);
        }
    }

// Agrega este método para cerrar las conexiones y recursos
    private static void cerrarRecursos() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
