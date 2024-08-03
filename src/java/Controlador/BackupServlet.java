package Controlador;

import Persistencia.BackupUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/backupDatabase")
public class BackupServlet extends HttpServlet {

    private static final String DB_NAME = "syscontrol8";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "jdproot123456";
    private static final String BACKUP_PATH = "/RespaldoBD2"; // Cambia esto a tu ruta de respaldo deseada

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            BackupUtil.backupDatabase(DB_NAME, DB_USER, DB_PASSWORD, BACKUP_PATH, req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("message", "Backup fallido: " + e.getMessage());
            req.getRequestDispatcher("indexLogin.jsp").forward(req, resp);
        }
    }
}
