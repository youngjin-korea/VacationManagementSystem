package com.kcc.vacation.domain.promotionplan.dto.response;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class PromotionPlanDetail {

    private String name;
    private String title;

    @Builder
    public PromotionPlanDetail(String name, String title) {
        this.name = name;
        this.title = title;
    }
}
