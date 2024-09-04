package com.kcc.vacation.domain.vacationrequest.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
public class MyVacationRequest {
    // id 시퀀스로 mapper에서 주입
    private int id;
    private Timestamp startedDate;
    private Timestamp endedDate;
    private String filePath;
    private Timestamp approveDate;
    private String status;
    private String comments;
    private int typeId;
    private int empId;

    @Builder
    public MyVacationRequest(int id, Timestamp startedDate, Timestamp endedDate, String filePath, Timestamp approveDate, String status, String comments, int typeId, int empId) {
        this.id = id;
        this.startedDate = startedDate;
        this.endedDate = endedDate;
        this.filePath = filePath;
        this.approveDate = approveDate;
        this.status = status;
        this.comments = comments;
        this.typeId = typeId;
        this.empId = empId;
    }
}
