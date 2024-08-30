package com.kcc.vacation.domain.promotionplan.dto.request;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class PromotionPlanCreate {


    private String name;
    private String title;

    @Builder
    public PromotionPlanCreate(String name, String title) {
        this.name = name;
        this.title = title;
    }
}