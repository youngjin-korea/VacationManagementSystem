package com.kcc.vacation.domain.grantedvacation.dto.response;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class GrantedVacationDetail {

    private int id;
    private int vacation_days;
    private Timestamp granted_date;
    private Timestamp expiration_date;
    private String description;
    private int vacation_type_id;
    private int emp_id;
    private int admin_id;



    @Builder
    public GrantedVacationDetail(int id, int vacation_days, Timestamp granted_date, Timestamp expiration_date, String description, int vacation_type_id, int emp_id, int admin_id) {

        this.id = id;
        this.vacation_days = vacation_days;
        this.granted_date = granted_date;
        this.expiration_date = expiration_date;
        this.description = description;
        this.vacation_type_id = vacation_type_id;
        this.emp_id = emp_id;
        this.admin_id = admin_id;



    }
}
