package Persistencia;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@WebListener
public class BackupScheduler implements ServletContextListener {
    private ScheduledExecutorService scheduler;

    @Override
    public void contextInitialized(ServletContextEvent event) {
        scheduler = Executors.newSingleThreadScheduledExecutor();

        // Configurar el tiempo en que se desea ejecutar la tarea (por ejemplo, a las 3:30 PM)
        long initialDelay = calculateInitialDelay(15, 50); // 3:50 PM
        long period = 24 * 60; // 24 hours en minutos

        // Crear y programar la tarea
        scheduler.scheduleAtFixedRate(new BackupTask("syscontrol8", "root", "jdproot123456", "C:/RespaldoBD2/"), 
                initialDelay, period, TimeUnit.MINUTES);
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        scheduler.shutdownNow();
    }

    private long calculateInitialDelay(int targetHour, int targetMinute) {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime targetTime = now.withHour(targetHour).withMinute(targetMinute).withSecond(0);

        if (now.isAfter(targetTime)) {
            targetTime = targetTime.plusDays(1);
        }

        return Duration.between(now, targetTime).toMinutes();
    }
}
