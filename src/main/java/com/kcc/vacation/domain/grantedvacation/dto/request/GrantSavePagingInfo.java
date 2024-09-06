package com.kcc.vacation.domain.grantedvacation.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;


@Getter
public class GrantSavePagingInfo {
    private int pageNum;
    private int amount;



    @Builder
    public GrantSavePagingInfo(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }
}
