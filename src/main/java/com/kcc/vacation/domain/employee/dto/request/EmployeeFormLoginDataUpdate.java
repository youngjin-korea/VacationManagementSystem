package com.kcc.vacation.domain.employee.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class EmployeeFormLoginDataUpdate {


    private int id;
    private String password;
    private String phoneNumber;


    @Builder
    public EmployeeFormLoginDataUpdate(int id, String password, String phoneNumber) {
        this.id = id;
        this.password = password;
        this.phoneNumber = phoneNumber;
    }
}
