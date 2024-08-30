package com.kcc.vacation.domain.vacationcancel.dto.response;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class VacationCancelDetail {

    private String name;
    private String title;

    @Builder
    public VacationCancelDetail(String name, String title) {
        this.name = name;
        this.title = title;
    }
}
