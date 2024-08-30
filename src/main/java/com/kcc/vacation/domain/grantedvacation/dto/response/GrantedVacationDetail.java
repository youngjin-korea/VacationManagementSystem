package com.kcc.vacation.domain.grantedvacation.dto.response;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class GrantedVacationDetail {

    private String name;
    private String title;

    @Builder
    public GrantedVacationDetail(String name, String title) {
        this.name = name;
        this.title = title;
    }
}
