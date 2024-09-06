package com.kcc.vacation.domain.vacationrequest.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
public class VacationReqNCancelAll {
    private int id;
    private int deptId;
    private String empName;
    private Timestamp startedDate;
    private Timestamp endDate;
    private String status;
    private String vtName;
    private String cancelStatus;
    private String cancelComments;
    private Timestamp cancelApproveDate;
    private int cancelApproverId;

    @Builder
    public VacationReqNCancelAll(int id, int deptId, String empName, Timestamp startedDate, Timestamp endDate, String status, String vtName, String cancelStatus, String cancelComments, Timestamp cancelApproveDate, int cancelApproverId) {
        this.id = id;
        this.deptId = deptId;
        this.empName = empName;
        this.startedDate = startedDate;
        this.endDate = endDate;
        this.status = status;
        this.vtName = vtName;
        this.cancelStatus = cancelStatus;
        this.cancelComments = cancelComments;
        this.cancelApproveDate = cancelApproveDate;
        this.cancelApproverId = cancelApproverId;
    }
}
