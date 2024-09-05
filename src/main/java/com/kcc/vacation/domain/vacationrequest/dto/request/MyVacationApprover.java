package com.kcc.vacation.domain.vacationrequest.dto.request;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
public class MyVacationApprover {
    // service에서 id 주입
    private int id;
    private Integer topApprover;
    private Integer firstApprover;
    private Integer secondApprover;

    @Builder
    public MyVacationApprover(int id, Integer topApprover, Integer firstApprover, Integer secondApprover) {
        this.id = id;
        this.topApprover = topApprover;
        this.firstApprover = firstApprover;
        this.secondApprover = secondApprover;
    }
}
