package com.kcc.vacation.domain.department.dto.response;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class DepartmentDetail {

    private int id;
    private String name;
    private int upperDeptId;

    @Builder
    public DepartmentDetail(int id, String name, int upperDeptId) {
        this.id = id;
        this.name = name;
        this.upperDeptId = upperDeptId;
    }
}
