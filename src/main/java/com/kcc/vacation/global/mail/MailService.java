package com.kcc.vacation.global.mail;

import com.kcc.vacation.controller.MailController;
import com.kcc.vacation.controller.MailStatus;
import com.kcc.vacation.domain.employee.dto.response.EmployeeDetail;
import com.kcc.vacation.domain.employee.mapper.EmployeeMapper;
import com.kcc.vacation.global.util.HtmlUtils;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.CompletableFuture;

@Service
@RequiredArgsConstructor
public class MailService {
    private final JavaMailSender mailSender;
    private final EmployeeMapper employeeMapper;

    @Async
    public CompletableFuture<String> sendMail(String email, String authenticationCode) {
        MimeMessage message = mailSender.createMimeMessage();


        try {
            if(!MailStatus.isMailSystemActive())
                throw new Exception("메시지 전송 실패");

            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setSubject("NeoJumper팀의 휴가관리 시스템에 초대되었습니다.");
            messageHelper.setTo(email);

            String html = HtmlUtils.generateEmailContent(authenticationCode.substring(0,4), authenticationCode.substring(4,8));

            messageHelper.setText(html, true);
            mailSender.send(message);

        } catch (MessagingException e) {
            throw new IllegalArgumentException("Failed to send email");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return CompletableFuture.completedFuture("메일전송 시작");

    }

    @Async
    public CompletableFuture<String> sendFailNotificationMail() {

        List<EmployeeDetail> resendTargets = employeeMapper.findByJoinCodeIsFail();

        MimeMessage message = mailSender.createMimeMessage();


        try {
            if(!MailStatus.isMailSystemActive())
                throw new Exception("메시지 전송 실패");

            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setSubject("NeoJumper팀의 휴가관리 시스템입니다.(직원 초대메일 전송실패)");
            messageHelper.setTo("gkfktkrh153@naver.com");

            String html = HtmlUtils.generateFailNotificationEmailContent(resendTargets);

            messageHelper.setText(html, true);
            mailSender.send(message);

            //if(true)
            //throw new Exception("메시지 재전송 실패");
        } catch (MessagingException e) {
            throw new IllegalArgumentException("Failed to send email");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return CompletableFuture.completedFuture("메일전송 시작");

    }
}
