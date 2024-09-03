package com.kcc.vacation.domain.vacationtype.dto.request;


import java.sql.Timestamp;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class VacationTypeCreate {


    
    private int id;
    private String name;
    private Timestamp created_date;
    private Timestamp updated_date;
    private long max_days;
    private String is_paid;


    @Builder
    public VacationTypeCreate(int id,String name, Timestamp created_date, Timestamp updated_date, long max_days, String is_paid) {
        
        this.id = id;
        this.name = name;
        this.created_date = created_date;
        this.updated_date = updated_date;
        this.max_days = max_days;
        this.is_paid = is_paid;
    
    }

}