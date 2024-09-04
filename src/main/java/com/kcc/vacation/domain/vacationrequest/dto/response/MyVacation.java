package com.kcc.vacation.domain.vacationrequest.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class MyVacation {
    private int vacationId;
    private Timestamp start;
    private Timestamp end;
    private Timestamp approvedDate;
    private String  status;
    private String title;
    private int vacationDays;

    @Builder
    public MyVacation(int vacationId, Timestamp start, Timestamp end, Timestamp approvedDate, String status, String title, int vacationDays) {
        this.vacationId = vacationId;
        this.start = start;
        this.end = end;
        this.approvedDate = approvedDate;
        this.status = status;
        this.title = title;
        this.vacationDays = vacationDays;
    }
}
