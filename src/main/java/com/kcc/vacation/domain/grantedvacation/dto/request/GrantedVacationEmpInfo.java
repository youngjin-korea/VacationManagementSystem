package com.kcc.vacation.domain.grantedvacation.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class GrantedVacationEmpInfo {

    private int grantedVacationId;
    private int empId;
    private String empName;
    private int departmentId;
    private String departmentName;
    private int vacationTypeId;
    private String vacationTypeName;

    @Builder
    public GrantedVacationEmpInfo(int empId, String empName,
                                  String vacationTypeName, String departmentName,int departmentId,
                                  int vacationTypeId, int grantedVacationId) {
        this.empId = empId;
        this.empName = empName;
        this.vacationTypeName = vacationTypeName;
        this.departmentName = departmentName;
        this.departmentId = departmentId;
        this.vacationTypeId = vacationTypeId;
        this.grantedVacationId = grantedVacationId;

    }
}
