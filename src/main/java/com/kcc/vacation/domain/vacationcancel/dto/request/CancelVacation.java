package com.kcc.vacation.domain.vacationcancel.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class CancelVacation {
    private int id;
    private String comments;
    private Integer vacationRequestId;
    private Integer cancelApproverId;

    @Builder
    public CancelVacation(int id, String comments, Integer vacationRequestId, Integer cancelApproverId) {
        this.id = id;
        this.comments = comments;
        this.vacationRequestId = vacationRequestId;
        this.cancelApproverId = cancelApproverId;
    }
}