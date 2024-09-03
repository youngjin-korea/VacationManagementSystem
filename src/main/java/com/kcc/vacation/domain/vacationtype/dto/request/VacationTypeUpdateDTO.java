package com.kcc.vacation.domain.vacationtype.dto.request;

import lombok.*;


@NoArgsConstructor
@Data
public class VacationTypeUpdateDTO {


    private int id;
    private String name;
    private int max_days;
    private String is_paid;

    @Builder
    public VacationTypeUpdateDTO(int id, String name, int max_days, String is_paid) {
        this.id = id;
        this.name = name;
        this.max_days = max_days;
        this.is_paid = is_paid;

    }

}