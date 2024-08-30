package com.kcc.vacation.domain.employee.dto.request;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class EmployeeCreate {


    private String name;
    private String title;

    @Builder
    public EmployeeCreate(String name, String title) {
        this.name = name;
        this.title = title;
    }
}