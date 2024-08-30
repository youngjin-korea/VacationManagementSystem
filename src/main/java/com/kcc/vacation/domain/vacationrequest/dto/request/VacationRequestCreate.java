package com.kcc.vacation.domain.vacationrequest.dto.request;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class VacationRequestCreate {


    private String name;
    private String title;

    @Builder
    public VacationRequestCreate(String name, String title) {
        this.name = name;
        this.title = title;
    }
}