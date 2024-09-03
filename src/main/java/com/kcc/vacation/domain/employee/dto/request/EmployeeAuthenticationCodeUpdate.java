package com.kcc.vacation.domain.employee.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class EmployeeAuthenticationCodeUpdate {


    private int id;
    private String 	authenticationCode;

    @Builder
    public EmployeeAuthenticationCodeUpdate(int id, String authenticationCode) {
        this.id = id;
        this.authenticationCode = authenticationCode;
    }
}


