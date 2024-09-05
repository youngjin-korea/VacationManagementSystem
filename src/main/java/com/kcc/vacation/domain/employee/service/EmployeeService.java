package com.kcc.vacation.domain.employee.service;


import com.kcc.vacation.domain.employee.dto.request.EmployeeCreate;
import com.kcc.vacation.domain.employee.dto.request.EmployeeFormLoginDataUpdate;
import com.kcc.vacation.domain.employee.dto.response.Employee;
import com.kcc.vacation.domain.employee.dto.request.UpdateMyInfo;

import com.kcc.vacation.domain.employee.dto.request.*;

import com.kcc.vacation.domain.employee.dto.response.EmployeeDetail;
import com.kcc.vacation.domain.employee.dto.response.MyInfo;
import com.kcc.vacation.domain.employee.mapper.EmployeeMapper;
import com.kcc.vacation.global.exception.ErrorCode;
import com.kcc.vacation.global.exception.custom_exception.BadRequestException;
import com.kcc.vacation.global.exception.custom_exception.NotFoundException;
import com.kcc.vacation.global.mail.MailService;
import com.kcc.vacation.global.scheduler.CustomSchedulerRunner;
import com.kcc.vacation.global.util.RandomCodeUtils;
import lombok.RequiredArgsConstructor;

import lombok.extern.slf4j.Slf4j;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.CompletableFuture;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmployeeService {

    private final EmployeeMapper employeeMapper;
    private final PasswordEncoder passwordEncoder;
    private final MailService mailService;
    private final CustomSchedulerRunner schedulerRunner;

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

    public void add(EmployeeCreate employeeCreate) {

        String authority = "";
        if(employeeCreate.getAuthority().equals("최고"))
        {
            authority = "ROLE_TOP_APPROVAL";
        }
        else if(employeeCreate.getAuthority().equals("1차"))
        {
            authority = "ROLE_FIRST_APPROVAL";
        }
        else if(employeeCreate.getAuthority().equals("2차")){
            authority = "ROLE_SECOND_APPROVAL";
        }
        else
            authority = "ROLE_NONE";

        employeeCreate.setAuthority(authority);
        employeeMapper.save(employeeCreate);


    }

    public void update(EmployeeUpdate employeeUpdate) {
        String authority = "";
        if(employeeUpdate.getAuthority().equals("최고관리자"))
        {
            authority = "ROLE_TOP_APPROVAL";
        }
        else if(employeeUpdate.getAuthority().equals("1차 승인권자"))
        {
            authority = "ROLE_FIRST_APPROVAL";
        }
        else if(employeeUpdate.getAuthority().equals("2차 승인권자")){
            authority = "ROLE_SECOND_APPROVAL";
        }
        else
            authority = "ROLE_NONE";

        employeeUpdate.setAuthority(authority);
        employeeMapper.update(employeeUpdate);
    }


    public EmployeeDetail getById(int id) {
        return employeeMapper.findEmployeeDetailById(id);
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
     * 3. 이메일 전송(비동기 처리)
     *          -> 실패 시 관리자에게 전송실패 메일 전송
     *          -> 이것도 실패 시 스케줄러를 돌려 이후에 처리되도록 무한루프
     */
    public void handleSendMail(List<Integer> ids) {
        ids.stream().forEach(id -> {

            Employee employee = employeeMapper.findById(id);
            String authenticationCode = RandomCodeUtils.generateRandomString();

            CompletableFuture<String> completableFuture = mailService.sendMail(employee.getEmail(), authenticationCode);
            completableFuture
                    .thenApply(result -> {
                        log.info("메일전송 성공");
                        updateCode(employee, authenticationCode);
                        return "메일전송 성공 Return";
                    })
                    .exceptionally(e -> {
                        log.info("메일전송 실패");
                        updateCode(employee, "FAIL");
                        schedulerRunner.runResendScheduler();
                        return "예외 발생 Return";
                    });

        });
    }

    private void updateCode(Employee employee, String authenticationCode) {
        employeeMapper.updateAuthenticationCode(EmployeeAuthenticationCodeUpdate
                .builder()
                .id(employee.getId())
                .authenticationCode(authenticationCode)
                .build());
        System.out.println("코드 정보 업데이트");
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




    public List<EmployeeDetail> getEmployeeList() {
        return employeeMapper.findAll();
    }


    public void delete(int id) {
        employeeMapper.delete(id);
    }

    public void resendMail() {
        List<Integer> list = employeeMapper.findByJoinCodeIsFail().stream().map(EmployeeDetail::getId).toList();
        handleSendMail(list);
    }
}



