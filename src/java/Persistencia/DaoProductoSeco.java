package Persistencia;

import Modelo.ControlSeco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoProductoSeco {

    static Conexion dao = Conexion.getInstance();
// Usar la conexión para realizar consultas y operaciones en la base de datos
    static Connection con;
    static PreparedStatement ps;
    static ResultSet rs;

    static ControlSeco controlseco = new ControlSeco();

    public static boolean grabar4(ControlSeco controlSeco) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = dao.getConnection();
            StringBuilder sqlBuilder = new StringBuilder("INSERT INTO controlcalidad (fecha, cant_noconf, causas, lote");
            StringBuilder valuesBuilder = new StringBuilder("VALUES (?, ?, ?, ?");

            // Agregar campos dinámicos de humedad
            List<Double> humedades = new ArrayList<>();
            for (int i = 1; i <= 80; i++) {
                sqlBuilder.append(", humedad_").append(i);
                valuesBuilder.append(", ?");
                Double humedad = controlSeco.getHumedad(i);
                if (humedad != null) {
                    humedades.add(humedad);
                } else {
                    humedades.add(null);
                }
            }

            // Agregar campos dinámicos de pH
            List<Double> phs = new ArrayList<>();
            for (int i = 1; i <= 30; i++) {
                sqlBuilder.append(", pH_").append(i);
                valuesBuilder.append(", ?");
                Double ph = controlSeco.getPH(i);
                if (ph != null) {
                    phs.add(ph);
                } else {
                    phs.add(null);
                }
            }

            // Añadir el resto de los campos a la consulta SQL
            sqlBuilder.append(", humedad_promedio, retenido325, pH_promedio, abs_Aceite, Brigh, Whitness, Dv50, Dv90, observacion, comentarios, idProductos, idUsuarios, idConsecutivo) "); //13
            valuesBuilder.append(", ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");//13
            sqlBuilder.append(valuesBuilder.toString());

            System.out.println("Consulta SQL: " + sqlBuilder.toString());

            // Preparar la declaración SQL
            ps = con.prepareStatement(sqlBuilder.toString());

            // Establecer los parámetros de la declaración SQL
            ps.setString(1, controlSeco.getFecha());
            ps.setDouble(2, controlSeco.getCant_noconf());
            ps.setString(3, controlSeco.getCausas());
            ps.setString(4, controlSeco.getLote());

            // Establecer los valores de humedad
            int index = 5;
            for (Double humedad : humedades) {
                ps.setObject(index++, humedad);
            }

// Establecer los valores de pH
            for (Double ph : phs) {
                ps.setObject(index++, ph);
            }

            // Establecer los demás campos
            ps.setDouble(index++, controlSeco.getHumedad_promedio());
            ps.setDouble(index++, controlSeco.getRetenido325());
            ps.setDouble(index++, controlSeco.getpH_promedio());
            ps.setDouble(index++, controlSeco.getAbs_Aceite());
            ps.setDouble(index++, controlSeco.getBrigh());
            ps.setDouble(index++, controlSeco.getWhitness());
            ps.setDouble(index++, controlSeco.getDv50());
            ps.setDouble(index++, controlSeco.getDv90());
            ps.setString(index++, controlSeco.getObservacion());
            ps.setString(index++, controlSeco.getComentarios());
            ps.setInt(index++, controlSeco.getIdProductos());
            ps.setInt(index++, controlSeco.getIdUsuarios());
            ps.setInt(index, controlSeco.getIdConsecutivo());

            // Ejecutar la consulta SQL
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();

        } finally {
            cerrarRecursos(); // Método para cerrar recursos como la conexión, el PreparedStatement y el ResultSet
        }
        return false;
    }

    public static List<ControlSeco> listar() {
        List<ControlSeco> lista = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
                  con = dao.getConnection();
            String sql = "SELECT  cc.* "
                    + "FROM controlcalidad cc "
                    + "JOIN productos prod ON "
                    + " cc.idProductos = prod.idProductos "
                    + "JOIN tipoproducto tp ON "
                    + " prod.idTipoProducto = tp.idTipoProducto "
                    + "WHERE tp.idTipoProducto = 1;";

            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                ControlSeco controlSeco = new ControlSeco();

                // Setear los campos comunes
                controlSeco.setIdControlCalidad(rs.getInt("idControlCalidad"));
                controlSeco.setIdProductos(rs.getInt("idProductos"));
                controlSeco.setIdUsuarios(rs.getInt("idUsuarios"));
                controlSeco.setIdConsecutivo(rs.getInt("idConsecutivo"));
                controlSeco.setFecha(rs.getString("fecha"));
                controlSeco.setLote(rs.getString("lote"));
                controlSeco.setCant_noconf(rs.getDouble("cant_noconf"));
                controlSeco.setCausas(rs.getString("causas"));
                controlSeco.setHumedad_promedio(rs.getDouble("humedad_promedio"));
                controlSeco.setRetenido325(rs.getDouble("retenido325"));
                controlSeco.setpH_promedio(rs.getDouble("pH_promedio"));
                controlSeco.setAbs_Aceite(rs.getDouble("abs_Aceite"));
                controlSeco.setBrigh(rs.getDouble("Brigh"));
                controlSeco.setWhitness(rs.getDouble("Whitness"));
                controlSeco.setDv50(rs.getDouble("Dv50"));
                controlSeco.setDv90(rs.getDouble("Dv90"));
                controlSeco.setObservacion(rs.getString("observacion"));
                controlSeco.setComentarios(rs.getString("comentarios"));

                // Setear las humedades dinámicamente
                for (int i = 1; i <= 80; i++) {
                    Double humedad = rs.getDouble("humedad_" + i);
                    if (!rs.wasNull()) {
                        controlSeco.setHumedad(i, humedad);
                    }
                }

                // Setear los valores de pH dinámicamente
                for (int i = 1; i <= 30; i++) {
                    Double ph = rs.getDouble("pH_" + i);
                    if (!rs.wasNull()) {
                        controlSeco.setPH(i, ph);
                    }
                }

                lista.add(controlSeco);
            }

        } catch (Exception e) {
            e.printStackTrace(); // Manejar adecuadamente la excepción en tu aplicación
        } finally {
            cerrarRecursos(); // Método para cerrar recursos como la conexión, el PreparedStatement y el ResultSet
        }
        return lista;
    }

    public static ControlSeco listarpdf(int id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ControlSeco controlSeco = new ControlSeco();

        try {
                   con = dao.getConnection();
            String sql = "SELECT * FROM controlcalidad WHERE idControlCalidad = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                controlSeco.setIdControlCalidad(rs.getInt("idControlCalidad"));
                controlSeco.setIdProductos(rs.getInt("idProductos"));
                controlSeco.setIdUsuarios(rs.getInt("idUsuarios"));
                controlSeco.setIdConsecutivo(rs.getInt("idConsecutivo"));
                controlSeco.setFecha(rs.getString("fecha"));
                controlSeco.setLote(rs.getString("lote"));
                controlSeco.setCant_noconf(rs.getDouble("cant_noconf"));
                controlSeco.setCausas(rs.getString("causas"));
                controlSeco.setHumedad_promedio(rs.getDouble("humedad_promedio"));
                controlSeco.setRetenido325(rs.getDouble("retenido325"));
                controlSeco.setpH_promedio(rs.getDouble("pH_promedio"));
                controlSeco.setAbs_Aceite(rs.getDouble("abs_Aceite"));
                controlSeco.setBrigh(rs.getDouble("Brigh"));
                controlSeco.setWhitness(rs.getDouble("Whitness"));
                controlSeco.setDv50(rs.getDouble("Dv50"));
                controlSeco.setDv90(rs.getDouble("Dv90"));
                controlSeco.setObservacion(rs.getString("observacion"));
                controlSeco.setComentarios(rs.getString("comentarios"));

                // Setear las humedades dinámicamente
                for (int i = 1; i <= 80; i++) {
                    Double humedad = rs.getDouble("humedad_" + i);
                    if (!rs.wasNull()) {
                        controlSeco.setHumedad(i, humedad);
                    }
                }

                // Setear los valores de pH dinámicamente
                for (int i = 1; i <= 30; i++) {
                    Double ph = rs.getDouble("pH_" + i);
                    if (!rs.wasNull()) {
                        controlSeco.setPH(i, ph);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoProductoSeco.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarRecursos(); // Método para cerrar recursos como la conexión, el PreparedStatement y el ResultSet
        }

        return controlSeco;
    }

    public static boolean editar2(ControlSeco controlSeco) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
                   con = dao.getConnection();

            StringBuilder sqlBuilder = new StringBuilder("UPDATE controlcalidad SET fecha = ?, lote = ?, cant_noconf = ?, "
                    + "causas = ?, humedad_promedio = ?");

            List<Object> values = new ArrayList<>();
            values.add(controlSeco.getFecha());
            values.add(controlSeco.getLote());
            values.add(controlSeco.getCant_noconf());
            values.add(controlSeco.getCausas());
            values.add(controlSeco.getHumedad_promedio());

            int numCamposHumedad = 80;
            int numCamposPH = 30;

            // Agregar solo los campos de humedad que tienen valores
            for (int i = 1; i <= numCamposHumedad; i++) {
                Double humedad = controlSeco.getHumedad(i);
                if (humedad != null) {
                    sqlBuilder.append(", humedad_").append(i).append(" = ?");
                    values.add(humedad);
                }
            }

            // Agregar solo los campos de pH que tienen valores
            for (int i = 1; i <= numCamposPH; i++) {
                Double ph = controlSeco.getPH(i);
                if (ph != null) {
                    sqlBuilder.append(", pH_").append(i).append(" = ?");
                    values.add(ph);
                }
            }

            // Agregar los demás campos fijos
            sqlBuilder.append(", retenido325 = ?, pH_promedio = ?, abs_Aceite = ?, Brigh = ?, Whitness = ?, Dv50 = ?, Dv90 = ?, observacion = ?, comentarios = ?, idProductos = ?, idUsuarios = ?, idConsecutivo = ? WHERE idControlCalidad = ?");

            // Agregar los valores de los campos fijos
            values.add(controlSeco.getRetenido325());
            values.add(controlSeco.getpH_promedio());
            values.add(controlSeco.getAbs_Aceite());
            values.add(controlSeco.getBrigh());
            values.add(controlSeco.getWhitness());
            values.add(controlSeco.getDv50());
            values.add(controlSeco.getDv90());
            values.add(controlSeco.getObservacion());
            values.add(controlSeco.getComentarios());
            values.add(controlSeco.getIdProductos());
            values.add(controlSeco.getIdUsuarios());
            values.add(controlSeco.getIdConsecutivo());
            values.add(controlSeco.getIdControlCalidad());

            ps = con.prepareStatement(sqlBuilder.toString());

            // Asignar los valores a la consulta preparada
            for (int i = 0; i < values.size(); i++) {
                ps.setObject(i + 1, values.get(i));
            }

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            Logger.getLogger(DaoProductoSeco.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Cerrar recursos
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DaoProductoSeco.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    //Metodo para Actualizar desde la tabla directamente
    public static boolean actualizarCelda(int id, String column, String value) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
                  con = dao.getConnection();
            //   System.out.println("Conexión establecida: " + (con != null));

            String sql = "UPDATE controlcalidad SET " + column + " = ? WHERE idControlCalidad = ?";
            //    System.out.println("SQL: " + sql);

            ps = con.prepareStatement(sql);
            ps.setString(1, value);
            ps.setInt(2, id);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            Logger.getLogger(DaoProductoSeco.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            cerrarRecursos();
        }
    }

    /* este metodo (listarAtributos2) sirve para listar todos los atributos de ProductoSeco dependiendo el id
    del PS para poder editarlos */
    public static ControlSeco listarAtributos2(int id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ControlSeco controlSeco = new ControlSeco();

        try {
                  con = dao.getConnection();
            String sql = "SELECT * FROM controlcalidad WHERE idControlCalidad = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Setear los campos comunes
                controlSeco.setIdControlCalidad(rs.getInt("idControlCalidad"));
                controlSeco.setIdProductos(rs.getInt("idProductos"));
                controlSeco.setIdUsuarios(rs.getInt("idUsuarios"));
                controlSeco.setIdConsecutivo(rs.getInt("idConsecutivo"));
                controlSeco.setFecha(rs.getString("fecha"));
                controlSeco.setLote(rs.getString("lote"));
                controlSeco.setCant_noconf(rs.getDouble("cant_noconf"));
                controlSeco.setCausas(rs.getString("causas"));
                controlSeco.setHumedad_promedio(rs.getDouble("humedad_promedio"));
                controlSeco.setRetenido325(rs.getDouble("retenido325"));
                controlSeco.setpH_promedio(rs.getDouble("pH_promedio"));
                controlSeco.setAbs_Aceite(rs.getDouble("abs_Aceite"));
                controlSeco.setBrigh(rs.getDouble("Brigh"));
                controlSeco.setWhitness(rs.getDouble("Whitness"));
                controlSeco.setDv50(rs.getDouble("Dv50"));
                controlSeco.setDv90(rs.getDouble("Dv90"));
                controlSeco.setObservacion(rs.getString("observacion"));
                controlSeco.setComentarios(rs.getString("comentarios"));

                // Setear las humedades dinámicamente
                for (int i = 1; i <= 80; i++) {
                    Double humedad = rs.getDouble("humedad_" + i);
                    if (!rs.wasNull()) {
                        controlSeco.setHumedad(i, humedad);
                    }
                }

                // Setear los valores de pH dinámicamente
                for (int i = 1; i <= 30; i++) {
                    Double ph = rs.getDouble("pH_" + i);
                    if (!rs.wasNull()) {
                        controlSeco.setPH(i, ph);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoProductoSeco.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarRecursos(); // Método para cerrar recursos como la conexión, el PreparedStatement y el ResultSet
        }

        return controlSeco;
    }

    public static String obtenerNombreprod(int id) {

        try {
                   con = dao.getConnection();
            String sql = "SELECT pr.nombres_Productos "
                    + "FROM especificaciones E "
                    + "JOIN productosref pr "
                    + "ON pr.idProductos = E.productos_idProductos "
                    + "WHERE E.idespecificaciones = ?"; // Agregado el WHERE para filtrar por ID

            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("nombres_Productos");
            } else {
                return "--";
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoClientes.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarRecursos();
        }
        return "--";
    }

    public static String obtenerNombreproducto(int idEspecificaciones) {

        try {
                    con = dao.getConnection();
            String sql = "SELECT  pr.nombres_Productos  "
                    + "FROM  productosref pr "
                    + "JOIN especificaciones E "
                    + "ON pr.idProductos = E.productos_idProductos "
                    + "JOIN  clientes c "
                    + "ON E.clientes_idclientes = c.idclientes "
                    + "WHERE E.idespecificaciones = ?"; // Agregado el WHERE para filtrar por ID

            ps = con.prepareStatement(sql);
            ps.setInt(1, idEspecificaciones);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("nombres_Productos");
            } else {
                return "--";
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoClientes.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarRecursos();
        }
        return "--";
    }

    public static String obtenerNombrecliente(int idEspecificaciones) {

        try {
                   con = dao.getConnection();
            String sql = "SELECT  c.razon_Social "
                    + "FROM  productos pr "
                    + "JOIN especificaciones E "
                    + "ON pr.idProductos = E.idProductos "
                    + "JOIN  clientes c "
                    + "ON E.idclientes = c.idclientes "
                    + "WHERE E.idespecificaciones = ?"; // Agregado el WHERE para filtrar por ID

            ps = con.prepareStatement(sql);
            ps.setInt(1, idEspecificaciones);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("razon_Social");
            } else {
                return "--";
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoClientes.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarRecursos();
        }
        return "--";
    }

    public static String obtenerTipoProducto(int id) {
        try {
               con = dao.getConnection();

            String sql = "SELECT PR.tipoProducto_idtipoProducto, TP.tipo "
                    + "FROM productos PR "
                    + "INNER JOIN tipoproducto TP ON PR.idTipoProducto = TP.idTipoProducto "
                    + "WHERE PR.idProductos=?";

            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            rs = ps.executeQuery();
            if (rs.next()) {
                // Devolvemos solo el nombre del tipo de producto
                return rs.getString("tipo");
            } else {
                return "--";
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoProductoSeco.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarRecursos();
        }
        return "--";
    }

    public static String obtenerUsuario(int id) {
        try {
             con = dao.getConnection();

            String sql = "SELECT "
                    + "u.nombres_apellido "
                    + "FROM controlcalidad C "
                    + "INNER JOIN consecutivo cs ON "
                    + "C.idConsecutivo = cs.idconsecutivo "
                    + "INNER JOIN especificaciones E ON "
                    + "E.idespecificaciones = cs.idespecificaciones "
                    + "INNER JOIN usuarios u  ON "
                    + "u.idUsuarios= cs.idUsuarios "
                    + "WHERE C.idControlCalidad = ?";

            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            rs = ps.executeQuery();
            if (rs.next()) {
                // Devolvemos solo el nombre del tipo de Usu
                return rs.getString("nombres_apellido");
            } else {
                return "--";
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoProductoSeco.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarRecursos();
        }
        return "--";
    }

    //El que Funsiona
    public static String obtenerclienteFinal(int id) {
        try {
                   con = dao.getConnection();

            String sql = "select "
                    + "cl.razon_Social "
                    + "FROM controlcalidad C "
                    + "INNER JOIN consecutivo cs ON "
                    + "C.idConsecutivo = cs.idconsecutivo "
                    + "INNER JOIN especificaciones E ON "
                    + "E.idespecificaciones = cs.idespecificaciones "
                    + "INNER JOIN clientes cl ON "
                    + "cl.idclientes = E.idclientes "
                    + "WHERE C.idControlCalidad = ?";

            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("razon_Social");
            } else {
                return "--";
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoProductoSeco.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarRecursos();
        }
        return "--";
    }

    //El que Funsiona
    public static String obtenerProductoFinal(int id) {
        try {
                 con = dao.getConnection();

            String sql = "SELECT "
                    + "pr.nombres_Productos "
                    + "FROM controlcalidad C "
                    + "INNER JOIN consecutivo cs ON "
                    + "C.idConsecutivo = cs.idconsecutivo "
                    + "INNER JOIN especificaciones E ON "
                    + "E.idespecificaciones = cs.idespecificaciones "
                    + "INNER JOIN productos pr ON "
                    + "pr.idProductos= E.idProductos "
                    + "WHERE C.idControlCalidad = ?";

            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("nombres_Productos");
            } else {
                return "--";
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoProductoSeco.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarRecursos();
        }
        return "--";
    }

    //El que Funsiona
    public static String obtenerUserFinal(int id) {
        try {
                  con = dao.getConnection();

            String sql = "SELECT "
                    + "u.nombres_apellido "
                    + "FROM controlcalidad C "
                    + "INNER JOIN consecutivo cs ON "
                    + "C.idConsecutivo = cs.idconsecutivo "
                    + "INNER JOIN especificaciones E ON "
                    + "E.idespecificaciones = cs.idespecificaciones "
                    + "INNER JOIN usuarios u  ON "
                    + "u.idUsuarios= cs.idUsuarios "
                    + "WHERE C.idControlCalidad = ?";

            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("nombres_apellido");
            } else {
                return "--";
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoProductoSeco.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarRecursos();
        }
        return "--";
    }

    public static boolean eliminar(int idControlCalidad) {
        try (Connection con = dao.getConnection(); PreparedStatement ps = con.prepareStatement("DELETE FROM controlcalidad WHERE idControlCalidad=?")) {
            ps.setInt(1, idControlCalidad);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            // Aquí puedes lanzar una excepción personalizada si lo prefieres
        } finally {
            cerrarRecursos();

        }
        return false;
    }

// Método para cerrar conexiones y recursos
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
