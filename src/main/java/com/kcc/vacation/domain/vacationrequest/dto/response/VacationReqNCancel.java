package com.kcc.vacation.domain.vacationrequest.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
public class VacationReqNCancel {
    private int id;
    private Timestamp startedDate;
    private Timestamp endDate;
    private String status;
    private String name;
    private String cancelStatus;
    private String cancelComments;
    private Timestamp cancelApproveDate;
    private int cancelApproverId;

    @Builder
    public VacationReqNCancel(int id, Timestamp startedDate, Timestamp endDate, String status, String name, String cancelStatus, String cancelComments, Timestamp cancelApproveDate, int cancelApproverId) {
        this.id = id;
        this.startedDate = startedDate;
        this.endDate = endDate;
        this.status = status;
        this.name = name;
        this.cancelStatus = cancelStatus;
        this.cancelComments = cancelComments;
        this.cancelApproveDate = cancelApproveDate;
        this.cancelApproverId = cancelApproverId;
    }
}
