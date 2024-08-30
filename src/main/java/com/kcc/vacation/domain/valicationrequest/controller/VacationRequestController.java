package com.kcc.vacation.domain.valicationrequest.controller;

import com.kcc.vacation.domain.valicationrequest.service.VacationRequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class VacationRequestController {
    private final VacationRequestService vacationRequestService;
}
