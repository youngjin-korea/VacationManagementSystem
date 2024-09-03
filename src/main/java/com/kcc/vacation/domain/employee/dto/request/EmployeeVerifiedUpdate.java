package com.kcc.vacation.domain.employee.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class EmployeeVerifiedUpdate {


    private String email;
    private String verified;

    @Builder
    public EmployeeVerifiedUpdate(String email, String verified) {
        this.email = email;
        this.verified = verified;
    }
}


