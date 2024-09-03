package com.kcc.vacation.domain.employee.service;

<<<<<<< HEAD
import com.kcc.vacation.domain.employee.dto.request.EmployeeCreate;
import com.kcc.vacation.domain.employee.dto.request.EmployeeEmailLogin;
import com.kcc.vacation.domain.employee.dto.request.EmployeeFormLoginDataUpdate;
import com.kcc.vacation.domain.employee.dto.response.Employee;
import com.kcc.vacation.domain.employee.dto.request.UpdateMyInfo;
=======
import com.kcc.vacation.domain.employee.dto.request.*;
import com.kcc.vacation.domain.employee.dto.response.Employee;
>>>>>>> a4f4c951d95c5eb1b0a7a1186eebb374db7b1e1b
import com.kcc.vacation.domain.employee.dto.response.MyInfo;
import com.kcc.vacation.domain.employee.mapper.EmployeeMapper;
import com.kcc.vacation.global.exception.ErrorCode;
import com.kcc.vacation.global.exception.custom_exception.BadRequestException;
import com.kcc.vacation.global.exception.custom_exception.NotFoundException;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
<<<<<<< HEAD
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
=======
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Random;

@Service
@RequiredArgsConstructor
public class EmployeeService {

    private final EmployeeMapper employeeMapper;
    private final PasswordEncoder passwordEncoder;
    private final AuthenticationManagerBuilder authenticationManagerBuilder;

    private final JavaMailSender mailSender;
   // private final SpringTemplateEngine templateEngine;

    public void join(EmployeeCreate employeeCreate) {
        if(!employeeCreate.getPassword().equals(employeeCreate.getPasswordCheck()))
            System.out.println("비밀번호확인 오류");

        Employee employee = employeeMapper.findByEmail(employeeCreate.getEmail());

        /**
         *  @Description
         *  사원이 없다면 -> 회원가입 진행
         *
         *  사원은 존재하지만 합류여부 'TRUE'인 상태
         *  -> 소셜회원가입을 진행한 상태
         *  -> 비밀번호 등의 계정정보를 추가로 채운다.
         *
         *
         */
        if(employee == null)
        {
            employeeCreate.setPassword(passwordEncoder.encode(employeeCreate.getPassword()));
            employeeCreate.setAuthority("ROLE_USER");
            employeeMapper.save(employeeCreate);
        }
        else {
            employeeMapper.updateFormLoginData(
                    EmployeeFormLoginDataUpdate.builder()
                            .id(employee.getId())
                            .phoneNumber(employeeCreate.getPhoneNumber())
                            .password(passwordEncoder.encode(employeeCreate.getPassword()))
                            .build()
            );
        }

    }

    public Employee getById(int id) {
        return employeeMapper.findById(id);
    }


    public MyInfo getMyInfo(int employeeId) {
        return employeeMapper.getMyInfo(employeeId);
    }

    public int updateMyInfo(UpdateMyInfo updateMyInfo) {
        return employeeMapper.updateMyInfo(updateMyInfo);
    }


    /**
     * 1. 랜덤 코드 생성
     * 2. 회원테이블의 인증코드 업데이트
     * 3. 이메일 전송
     */
    public void handleSendMail(int id) {
        Employee employee = employeeMapper.findById(id);
        String authenticationCode = generateRandomString();


        employeeMapper.updateAuthenticationCode(EmployeeAuthenticationCodeUpdate
                .builder()
                .id(employee.getId())
                .authenticationCode(authenticationCode)
                .build());

        sendMail(employee.getEmail(), authenticationCode);

    }

    private void sendMail(String email, String authenticationCode) {
        MimeMessage message = mailSender.createMimeMessage();

        try {
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setSubject("NeoJumper팀의 휴가관리 시스템에 초대되었습니다.");
            messageHelper.setTo(email);

            String html = generateEmailContent(authenticationCode.substring(0,4), authenticationCode.substring(4,8));
            messageHelper.setText(html, true);
            mailSender.send(message);

        } catch (MessagingException e) {
            throw new IllegalArgumentException("Failed to send email");
        }

    }

    public void certificate(String email, String authenticationCode) {
        Employee employee = employeeMapper.findByEmail(email);
        if(employee == null){
            throw new NotFoundException(ErrorCode.NOT_FOUND_MEMBER);
        }

        if(!authenticationCode.equals(employee.getAuthenticationCode())){
            throw new BadRequestException(ErrorCode.INVALID_CODE);
        }
        employeeMapper.updateVerified(EmployeeVerifiedUpdate.builder()
                .email(email)
                .verified( "TRUE")
                .build());

    }

    public String generateRandomString() {
            String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            StringBuilder result = new StringBuilder();
            Random random = new Random();

            for (int i = 0; i < 8; i++) {
                int randomIndex = random.nextInt(characters.length());
                result.append(characters.charAt(randomIndex));
            }

            return result.toString();
    }

    public String generateEmailContent(String joinCodePart1, String joinCodePart2) {
        StringBuilder htmlBuilder = new StringBuilder();

        htmlBuilder.append("<!DOCTYPE html>\n")
                .append("<html xmlns:th=\"http://www.thymeleaf.org\">\n")
                .append("<head>\n")
                .append("  <meta charset=\"UTF-8\">\n")
                .append("  <title>상권 분석 업데이트</title>\n")
                .append("  <style>\n")
                .append("    p {\n")
                .append("      font-size: 18px;\n")
                .append("    }\n")
                .append("    .blue-button {\n")
                .append("      background-color: #007BFF;\n")
                .append("      /* 파란색 */\n")
                .append("      color: white;\n")
                .append("      /* 글자색 흰색 */\n")
                .append("      border: none;\n")
                .append("      /* 테두리 없음 */\n")
                .append("      padding: 10px 20px;\n")
                .append("      /* 여백 */\n")
                .append("      text-align: center;\n")
                .append("      /* 텍스트 가운데 정렬 */\n")
                .append("      text-decoration: none;\n")
                .append("      /* 밑줄 없음 */\n")
                .append("      display: inline-block;\n")
                .append("      /* 인라인 블록으로 배치 */\n")
                .append("      font-size: 16px;\n")
                .append("      /* 글자 크기 */\n")
                .append("      margin: 4px 2px;\n")
                .append("      /* 마진 */\n")
                .append("      cursor: pointer;\n")
                .append("      /* 커서가 손가락 모양으로 변경 */\n")
                .append("      border-radius: 4px;\n")
                .append("      /* 둥근 모서리 */\n")
                .append("      transition: background-color 0.3s;\n")
                .append("      /* 배경색 변화 애니메이션 */\n")
                .append("    }\n")
                .append("    .blue-button:hover {\n")
                .append("      background-color: #0056b3;\n")
                .append("      /* 버튼에 마우스를 올렸을 때 색상 */\n")
                .append("    }\n")
                .append("  </style>\n")
                .append("  <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\"\n")
                .append("    integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\">\n")
                .append("</head>\n")
                .append("<body style=\"font-family: Arial, sans-serif;\">\n")
                .append("  <div class=\"header\" style=\"background-color: #004aad; color: white; padding: 10px; text-align: center;\">\n")
                .append("    <h2>NeoJumper 팀 휴가관리 솔루션에 초대되었습니다.</h2>\n")
                .append("  </div>\n")
                .append("  <div class=\"content\" style=\"margin: 20px; padding: 10px; text-align: center;\">\n")
                .append("    <p>안녕하세요, NeoJumper 팀입니다.</p>\n")
                .append("    <p>NeoJumper 팀에서는 직원분들의 편리한 휴가관리를 위한 솔루션을 제공합니다.</p>\n")
                .append("    <p>저희 팀에 합류하기 위한 인증코드를 보내드립니다.</p>\n")
                .append("    <hr>\n")
                .append("    <h4 style=\"font-weight: bold; color: #828282;\">합류 코드</h4>\n")
                .append("    <h1 style=\"color: #0575E6;\">\n")
                .append("      <strong>ABVC</strong> - <strong>FN1K</strong>\n")
                .append("    </h1>\n")
                .append("    <hr>\n")
                .append("    <a href=\"http://localhost:8085/auth/join-form\" style=\"list-style: none;\">\n")
                .append("    <button class=\"blue-button\"> 합류하기</button>\n")
                .append("    </a>\n")
                .append("  </div>\n")
                .append("  <div class=\"footer\" style=\"padding: 10px; text-align: center;\">\n")
                .append("    감사합니다.<br>\n")
                .append("    NeoJumber 인사팀 드림\n")
                .append("  </div>\n")
                .append("  <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js\"\n")
                .append("    integrity=\"sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL\"\n")
                .append("    crossorigin=\"anonymous\"></script>\n")
                .append("</body>\n")
                .append("</html>");

        return htmlBuilder.toString();
    }
}
