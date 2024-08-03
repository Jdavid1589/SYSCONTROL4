package Persistencia;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;

public class BackupUtil {

    public static void backupDatabase(String dbName, String dbUser, String dbPassword, String backupPath,
            HttpServletRequest request, HttpServletResponse response) throws IOException, InterruptedException, ServletException {
        
        // Generar nombre de archivo con fecha y hora
        String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
        String backupFileName = backupPath + "/" + dbName + "_" + timeStamp + ".sql";

        // Ruta completa de mysqldump
        String mysqldumpPath = "C:/Program Files/MySQL/MySQL Workbench 8.0/mysqldump.exe"; // Ruta completa

        // Comando de mysqldump
        String command = String.format("\"%s\" -u%s -p%s %s -r \"%s\"", mysqldumpPath, dbUser, dbPassword, dbName, backupFileName);

        // Ejecutar comando
        Process process = Runtime.getRuntime().exec(command);

        int processComplete = process.waitFor();

        if (processComplete == 0) {
            System.out.println("Backup successful");
            request.setAttribute("message", "Respaldo BD, Exitoso!");
        } else {
            System.out.println("Backup failed");
            request.setAttribute("message", "Backup fallido");
        }

        request.getRequestDispatcher("indexLogin.jsp").forward(request, response);
    }
}
