package com.kcc.vacation.domain.employee.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class MyInfo {

    private int id;
    private String empName;
    private String deptName;
    private String position;
    private Timestamp hireDate;
    private String phoneNumber;
    private String email;

    @Builder
    public MyInfo(int id, String empName, String deptName, String position, Timestamp hireDate, String phoneNumber, String email) {
        this.id = id;
        this.empName = empName;
        this.deptName = deptName;
        this.position = position;
        this.hireDate = hireDate;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }
}
