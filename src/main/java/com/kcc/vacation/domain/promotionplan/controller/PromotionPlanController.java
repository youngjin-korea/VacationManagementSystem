package com.kcc.vacation.domain.promotionplan.controller;

import com.kcc.vacation.domain.promotionplan.service.PromotionPlanService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class PromotionPlanController {

    private final PromotionPlanService promotionPlanService;
}
