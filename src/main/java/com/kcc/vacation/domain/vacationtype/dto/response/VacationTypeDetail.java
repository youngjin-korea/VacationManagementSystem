package com.kcc.vacation.domain.vacationtype.dto.response;


import java.sql.Timestamp;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class VacationTypeDetail {

    private int id;
    private String name;
    private Timestamp created_date;
    private Timestamp updated_date;
    private double max_days;
    private String is_paid;


    @Builder
    public VacationTypeDetail(int id,String name, Timestamp created_date, Timestamp updated_date, double max_days, String is_paid) {
        
        this.id = id;
        this.name = name;
        this.created_date = created_date;
        this.updated_date = updated_date;
        this.max_days = max_days;
        this.is_paid = is_paid;
    
    }
}
