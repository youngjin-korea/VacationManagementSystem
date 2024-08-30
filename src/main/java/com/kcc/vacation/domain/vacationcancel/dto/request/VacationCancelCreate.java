package com.kcc.vacation.domain.vacationcancel.dto.request;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class VacationCancelCreate {


    private String name;
    private String title;

    @Builder
    public VacationCancelCreate(String name, String title) {
        this.name = name;
        this.title = title;
    }
}