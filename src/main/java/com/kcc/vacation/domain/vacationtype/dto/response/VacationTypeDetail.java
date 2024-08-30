package com.kcc.vacation.domain.vacationtype.dto.response;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class VacationTypeDetail {

    private String name;
    private String title;

    @Builder
    public VacationTypeDetail(String name, String title) {
        this.name = name;
        this.title = title;
    }
}
