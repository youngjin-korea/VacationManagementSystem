package com.kcc.vacation.domain.grantedvacation.dto.request;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class GrantedVacationCreate {


    private String name;
    private String title;

    @Builder
    public GrantedVacationCreate(String name, String title) {
        this.name = name;
        this.title = title;
    }
}