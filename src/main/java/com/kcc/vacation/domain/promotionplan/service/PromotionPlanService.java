package com.kcc.vacation.domain.promotionplan.service;

import com.kcc.vacation.domain.promotionplan.mapper.PromotionPlanMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PromotionPlanService {

    private final PromotionPlanMapper promotionPlanMapper;

}
