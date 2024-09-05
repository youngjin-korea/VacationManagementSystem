package com.kcc.vacation.domain.grantedvacation.dto.response;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class GrantedVacationList {

    private int id;
    private String dept_name;
    private String emp_name;
    private String vacation_name;
    private Timestamp granted_date;
    private Timestamp expiration_date;



    @Builder
    public GrantedVacationList(int id,String dept_name, String emp_name, String vacation_name, Timestamp granted_date, Timestamp expiration_date) {

        this.id = id;
        this.dept_name = dept_name;
        this.emp_name = emp_name;
        this.vacation_name = vacation_name;
        this.granted_date = granted_date;
        this.expiration_date = expiration_date;

    }


}
