package com.kcc.vacation.domain.vacationtype.controller;

import com.kcc.vacation.domain.vacationtype.service.VacationTypeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class VacationTypeRestController {

    private final VacationTypeService vacationTypeService;
}
