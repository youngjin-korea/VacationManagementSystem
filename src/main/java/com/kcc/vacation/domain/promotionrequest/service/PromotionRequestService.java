package com.kcc.vacation.domain.promotionrequest.service;

import com.kcc.vacation.domain.promotionrequest.mapper.PromotionRequestMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class PromotionRequestService {

    private final PromotionRequestMapper promotionRequestMapper;
}
