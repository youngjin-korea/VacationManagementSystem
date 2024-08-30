package com.kcc.vacation.domain.vacationrequest.dto.response;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class VacationRequestDetail {

    private String name;
    private String title;

    @Builder
    public VacationRequestDetail(String name, String title) {
        this.name = name;
        this.title = title;
    }
}
