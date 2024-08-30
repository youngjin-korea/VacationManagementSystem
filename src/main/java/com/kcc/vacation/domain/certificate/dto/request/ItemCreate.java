package com.kcc.vacation.domain.certificate.dto.request;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class ItemCreate {


    private String name;
    private String title;

    @Builder
    public ItemCreate(String name, String title) {
        this.name = name;
        this.title = title;
    }
}