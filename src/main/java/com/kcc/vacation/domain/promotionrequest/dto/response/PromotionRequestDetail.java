package com.kcc.vacation.domain.promotionrequest.dto.response;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class PromotionRequestDetail {

    private String name;
    private String title;

    @Builder
    public PromotionRequestDetail(String name, String title) {
        this.name = name;
        this.title = title;
    }
}
