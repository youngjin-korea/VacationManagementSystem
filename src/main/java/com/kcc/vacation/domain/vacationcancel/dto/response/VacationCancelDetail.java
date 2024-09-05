package com.kcc.vacation.domain.vacationcancel.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class VacationCancelDetail {

    private int id;
    private String status;
    private Timestamp cancelDate;
    private String comments;
    private String commentsOfApprover;
    private Timestamp cancelApproveDate;
    private int vacationRequestId;
    private int cancelApproverId;
    private Timestamp requestStartDate;
    private Timestamp requestEndDate;
    private String requesterName;
    private String approverName;

    @Builder
    public VacationCancelDetail(int id, String status, Timestamp cancelDate, String comments,
                                String commentsOfApprover, Timestamp cancelApproveDate,
                                int vacationRequestId, int cancelApproverId,
                                Timestamp requestStartDate, Timestamp requestEndDate,
                                String requesterName, String approverName) {
        this.id = id;
        this.status = status;
        this.cancelDate = cancelDate;
        this.comments = comments;
        this.commentsOfApprover = commentsOfApprover;
        this.cancelApproveDate = cancelApproveDate;
        this.vacationRequestId = vacationRequestId;
        this.cancelApproverId = cancelApproverId;
        this.requestStartDate = requestStartDate;
        this.requestEndDate = requestEndDate;
        this.requesterName = requesterName;
        this.approverName = approverName;
    }
}
