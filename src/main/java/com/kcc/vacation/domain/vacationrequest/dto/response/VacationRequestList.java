package com.kcc.vacation.domain.vacationrequest.dto.response;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class VacationRequestList {

    private Long id;
    private Timestamp regDate;
    private Timestamp startedDate;
    private Timestamp endDate;
    private String filePath;
    private Timestamp approveDate;
    private String status;
    private String comments;
    private Long typeId;
    private Long empId;
    private String name;

    @Builder
    public VacationRequestList(Long id, Timestamp regDate, Timestamp startedDate, Timestamp endDate,
                                 String filePath, Timestamp approveDate, String status, String comments,
                                 Long typeId, Long empId, String name) {
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
        this.name = name;
    }

}
