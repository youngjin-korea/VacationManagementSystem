package com.kcc.vacation.domain.valicationrequest.controller;

import com.kcc.vacation.domain.valicationrequest.service.VacationRequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class VacationRequestRestController {
    private final VacationRequestService vacationRequestService;
}
