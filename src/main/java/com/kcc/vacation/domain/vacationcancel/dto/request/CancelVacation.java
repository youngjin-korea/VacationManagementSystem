package com.kcc.vacation.domain.vacationcancel.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class CancelVacation {
    private String comments;
    private Integer vacationRequestId;
    private Integer cancelApproverId;

    @Builder
    public CancelVacation(String comments, Integer vacationRequestId, Integer cancelApproverId) {
        this.comments = comments;
        this.vacationRequestId = vacationRequestId;
        this.cancelApproverId = cancelApproverId;
    }
}