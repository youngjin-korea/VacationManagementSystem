package com.kcc.vacation.domain.department.dto.request;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class DepartmentCreate {


    private int id;
    private String name;
    private int upperDeptId;


    @Builder
    public DepartmentCreate(int id, String name, int upperDeptId) {
        this.id = id;
        this.name = name;
        this.upperDeptId = upperDeptId;

    }
}