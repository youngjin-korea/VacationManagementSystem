package com.kcc.vacation.domain.promotionplan.controller;

import com.kcc.vacation.domain.promotionplan.service.PromotionPlanService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class PromotionPlanRestController {

    private final PromotionPlanService promotionPlanService;
}
