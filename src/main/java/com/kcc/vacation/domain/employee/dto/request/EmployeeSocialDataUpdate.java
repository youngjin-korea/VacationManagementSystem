package com.kcc.vacation.domain.employee.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class EmployeeSocialDataUpdate {

    private String oauthId;
    private int id;

    @Builder
    public EmployeeSocialDataUpdate(String oauthId, int id) {
        this.oauthId = oauthId;
        this.id = id;
    }
}
