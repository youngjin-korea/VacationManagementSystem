package com.kcc.vacation.domain.employee.dto.response;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class EmployeeDetail {

    private String name;
    private String title;

    @Builder
    public EmployeeDetail(String name, String title) {
        this.name = name;
        this.title = title;
    }
}
