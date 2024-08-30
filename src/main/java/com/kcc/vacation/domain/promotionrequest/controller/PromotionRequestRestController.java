package com.kcc.vacation.domain.promotionrequest.controller;

import com.kcc.vacation.domain.promotionrequest.service.PromotionRequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class PromotionRequestRestController {

    private final PromotionRequestService promotionRequestService;
}
