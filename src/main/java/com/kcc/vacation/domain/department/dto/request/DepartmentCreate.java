package com.kcc.vacation.domain.department.dto.request;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class DepartmentCreate {


    private String name;
    private String title;

    @Builder
    public DepartmentCreate(String name, String title) {
        this.name = name;
        this.title = title;
    }
}