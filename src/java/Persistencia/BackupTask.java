package Persistencia;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BackupTask implements Runnable {
    private String dbName;
    private String dbUser;
    private String dbPassword;
    private String backupPath;

    public BackupTask(String dbName, String dbUser, String dbPassword, String backupPath) {
        this.dbName = dbName;
        this.dbUser = dbUser;
        this.dbPassword = dbPassword;
        this.backupPath = backupPath;
    }

    @Override
    public void run() {
        try {
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
            } else {
                System.out.println("Backup failed");
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
