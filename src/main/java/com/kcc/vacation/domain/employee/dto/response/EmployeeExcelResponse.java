package com.kcc.vacation.domain.employee.dto.response;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class EmployeeExcelResponse {


    private int id;
    private String name;
    private String hireDate;
    private String email;
    private String phoneNumber;
    private String joinState;
    private String deptName;
    private String position;
    private String authority;

    @Builder
    public EmployeeExcelResponse(int id, String name, String hireDate, String email, String phoneNumber, String joinState, String deptName, String position, String authority) {
        this.id = id;
        this.name = name;
        this.hireDate = hireDate;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.joinState = joinState;
        this.deptName = deptName;
        this.position = position;
        this.authority = authority;
    }
}