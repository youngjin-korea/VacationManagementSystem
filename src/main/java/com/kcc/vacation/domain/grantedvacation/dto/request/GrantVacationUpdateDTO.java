package com.kcc.vacation.domain.grantedvacation.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class GrantVacationUpdateDTO {

    private int id;
    private int vacation_days;
    private Timestamp expiration_date;


    @Builder
    public GrantVacationUpdateDTO(int id, int vacation_days, Timestamp expiration_date) {

        this.id = id;
        this.vacation_days = vacation_days;
        this.expiration_date = expiration_date;

    }
}
