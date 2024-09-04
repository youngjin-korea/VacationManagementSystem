package com.kcc.vacation.domain.vacationrequest.dto.request;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
public class MyVacationApprover {
    private int id;
    private int topApprover;
    private int firstApprover;
    private int secondApprover;

    @Builder
    public MyVacationApprover(int id, int topApprover, int firstApprover, int secondApprover) {
        this.id = id;
        this.topApprover = topApprover;
        this.firstApprover = firstApprover;
        this.secondApprover = secondApprover;
    }
}
