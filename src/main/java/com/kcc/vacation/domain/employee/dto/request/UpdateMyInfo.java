package com.kcc.vacation.domain.employee.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class UpdateMyInfo {
    private int id;
    private String phoneNumber;
    private String email;

    @Builder
    public UpdateMyInfo(int id, String phoneNumber, String email) {
        this.id = id;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }
}
