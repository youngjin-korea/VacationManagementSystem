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
    private int emp_id;
    private String emp_name;
    private String dept_name;
    private String position;
    private String email;
    private String vacation_type_name;





    @Builder
    public GrantedVacationDetail(int id, int vacation_days, Timestamp granted_date, Timestamp expiration_date,
                                 String description, int emp_id, String email, String position, String dept_name, String vacation_type_name) {

        this.id = id;
        this.vacation_days = vacation_days;
        this.granted_date = granted_date;
        this.expiration_date = expiration_date;
        this.description = description;
        this.emp_id = emp_id;
        this.email = email;
        this.position = position;
        this.dept_name = dept_name;
        this.vacation_type_name = vacation_type_name;

    }
}
