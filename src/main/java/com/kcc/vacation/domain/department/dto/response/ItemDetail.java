package com.kcc.vacation.domain.department.dto.response;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class ItemDetail {

    private String name;
    private String title;

    @Builder
    public ItemDetail(String name, String title) {
        this.name = name;
        this.title = title;
    }
}
