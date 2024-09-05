package com.kcc.vacation.domain.employee.dto.request;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@NoArgsConstructor
@Getter
@Setter
public class EmployeeCreate {


    private int id;
    private String name;
    private String password;
    private String passwordCheck;
    private Timestamp hireDate;
    private String oauthId;
    private String email;
    private String phoneNumber;
    private int vacationDays;
    private String joinState;
    private int deptId;
    private String position;
    private String authority;

    @Builder
    public EmployeeCreate(int id, String name, String password, String oauthId, String passwordCheck, Timestamp hireDate, String email, String phoneNumber, int vacationDays, String joinState, int deptId, String position, String authority) {
        this.id = id;
        this.name = name;
        this.hireDate = hireDate;
        this.oauthId = oauthId;
        this.password = password;
        this.passwordCheck = passwordCheck;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.vacationDays = vacationDays;
        this.joinState = joinState;
        this.deptId = deptId;
        this.position = position;
        this.authority = authority;
    }

    public static EmployeeCreate of(EmployeeCreateRequest employeeCreateRequest) {
        return EmployeeCreate.builder()
                .id(employeeCreateRequest.getId())
                .name(employeeCreateRequest.getName())
                .password(employeeCreateRequest.getPassword())
                .passwordCheck(employeeCreateRequest.getPasswordCheck())
                .oauthId(employeeCreateRequest.getOauthId())
                .hireDate(handleDate(employeeCreateRequest.getHireDate()))
                .email(employeeCreateRequest.getEmail())
                .phoneNumber(employeeCreateRequest.getPhoneNumber())
                .vacationDays(employeeCreateRequest.getVacationDays())
                .joinState(employeeCreateRequest.getJoinState())
                .deptId(employeeCreateRequest.getDeptId())
                .position(employeeCreateRequest.getPosition())
                .authority(employeeCreateRequest.getAuthority())
                .build();
    }


    public static Timestamp handleDate(String dateString) {

        // SimpleDateFormat을 사용해 문자열을 Date 객체로 파싱
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        try {
            Date parsedDate = dateFormat.parse(dateString); // Date 객체로 변환
            return new Timestamp(parsedDate.getTime()); // Timestamp로 변환
        } catch (ParseException e) {
            e.printStackTrace(); // 파싱 중 오류가 발생할 경우 예외 처리
        }
        return null;
    }
}