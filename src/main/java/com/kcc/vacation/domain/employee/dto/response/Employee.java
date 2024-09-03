package com.kcc.vacation.domain.employee.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class Employee {

    private int id;
    private String name;
    private String password;
    private Timestamp hireDate;
    private String email;
    private String oauthId;
    private String phoneNumber;
    private int vacationDays;
    private String joinState;
    private int deptId;
    private String position;
    @Setter
    private String authority;
    private String authenticationCode;
    private String verified;

    @Builder
    public Employee(int id, String name, String password,Timestamp hireDate,String oauthId, String email, String phoneNumber, int vacationDays, String joinState, int deptId, String position, String authority, String authenticationCode, String verified) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.hireDate = hireDate;
        this.email = email;
        this.oauthId = oauthId;
        this.phoneNumber = phoneNumber;
        this.vacationDays = vacationDays;
        this.joinState = joinState;
        this.deptId = deptId;
        this.position = position;
        this.authority = authority;
        this.authenticationCode = authenticationCode;
        this.verified = verified;
    }

}
