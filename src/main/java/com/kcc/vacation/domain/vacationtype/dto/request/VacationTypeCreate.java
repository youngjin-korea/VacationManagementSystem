package com.kcc.vacation.domain.vacationtype.dto.request;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class VacationTypeCreate {


    private String name;
    private String title;

    @Builder
    public VacationTypeCreate(String name, String title) {
        this.name = name;
        this.title = title;
    }
}