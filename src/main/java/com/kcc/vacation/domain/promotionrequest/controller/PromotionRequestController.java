package com.kcc.vacation.domain.promotionrequest.controller;

import com.kcc.vacation.domain.promotionrequest.service.PromotionRequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class PromotionRequestController {

    private final PromotionRequestService promotionRequestService;
}
