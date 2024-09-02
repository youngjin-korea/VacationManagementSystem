package com.kcc.vacation.domain.employee.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
@Setter
public class EmployeeEmailLogin  {

    private String username;
    private String password;

    @Builder
    public EmployeeEmailLogin (String username, String password) {
        this.username = username;
        this.password = password;

    }
}
