package com.kcc.vacation.global.scheduler;

import com.kcc.vacation.global.mail.MailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.stereotype.Component;

import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ScheduledFuture;

@Component
@Slf4j
@RequiredArgsConstructor
public class CustomSchedulerRunner {
    private final MailService mailService;
    private final Map<String, ScheduledFuture<?>> scheduledTasks = new ConcurrentHashMap<>();
    @Autowired
    private TaskScheduler taskScheduler;

    public void runResendScheduler() {
        synchronized (this){
            if(scheduledTasks.get("resendScheduler") == null) {
                log.info("재전송 스케줄러 추가");
                ScheduledFuture<?> task = taskScheduler.scheduleAtFixedRate(
                        ()->{
                            log.info("재전송 스케줄러 동작");
                            CompletableFuture<String> completableFuture = mailService.sendFailNotificationMail();
                            completableFuture
                                    .thenApply(result -> {
                                        log.info("실패 알림메일 전송 성공");
                                        stopResendScheduler();
                                        return "실패 알림메일 전송 성공 Return";
                                    })
                                    .exceptionally(e -> {
                                        log.info("실패 알림메일 전송 실패");
                                        return "실패 알림메일 전송 실패 Return";
                                    });
                        }
                        , 15000); // ms
                scheduledTasks.put("resendScheduler", task);
            }
        }

    }

    public void stopResendScheduler(){
        log.info("재전송 스케줄러 정지");

        scheduledTasks.get("resendScheduler").cancel(true);
        scheduledTasks.remove("resendScheduler");
        System.out.println(scheduledTasks);
    }


}