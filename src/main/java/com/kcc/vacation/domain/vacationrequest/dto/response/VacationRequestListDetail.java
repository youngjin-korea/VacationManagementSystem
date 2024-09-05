package com.kcc.vacation.domain.vacationrequest.dto.response;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class VacationRequestListDetail {

    private int id;
    private Timestamp regDate;
    private Timestamp startedDate;
    private Timestamp endDate;
    private String filePath;
    private Timestamp approveDate;
    private String status;
    private String comments;
    private int typeId;
    private int empId;

    private String employeeName; // Employee 테이블의 name 컬럼과 매핑

    private int topApprover;
    private int firstApprover;
    private int secondApprover;
    private String topStatus;
    private String firstStatus;
    private String secondStatus;

    private String isYourTurn;

    private String firstApproverName;
    private String secondApproverName;
    private String topApproverName;


    public void setIsYourTurn(String isYourTurn) {
        this.isYourTurn = isYourTurn;
    }

    @Builder
    public VacationRequestListDetail(int id, Timestamp regDate, Timestamp startedDate, Timestamp endDate, String filePath, Timestamp approveDate, String status, String comments, int typeId, int empId, String employeeName, int topApprover, int firstApprover, int secondApprover, String topStatus, String firstStatus, String secondStatus, String isYourTurn, String firstApproverName, String secondApproverName, String topApproverName) {
        this.id = id;
        this.regDate = regDate;
        this.startedDate = startedDate;
        this.endDate = endDate;
        this.filePath = filePath;
        this.approveDate = approveDate;
        this.status = status;
        this.comments = comments;
        this.typeId = typeId;
        this.empId = empId;
        this.employeeName = employeeName;
        this.topApprover = topApprover;
        this.firstApprover = firstApprover;
        this.secondApprover = secondApprover;
        this.topStatus = topStatus;
        this.firstStatus = firstStatus;
        this.secondStatus = secondStatus;
        this.isYourTurn = isYourTurn;
        this.firstApproverName = firstApproverName;
        this.secondApproverName = secondApproverName;
        this.topApproverName = topApproverName;
    }
}
