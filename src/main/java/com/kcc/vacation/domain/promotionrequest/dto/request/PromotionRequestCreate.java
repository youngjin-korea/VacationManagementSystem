package com.kcc.vacation.domain.promotionrequest.dto.request;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class PromotionRequestCreate {


    private String name;
    private String title;

    @Builder
    public PromotionRequestCreate(String name, String title) {
        this.name = name;
        this.title = title;
    }
}