package com.kcc.vacation.domain.vacationtype.controller;

import com.kcc.vacation.domain.vacationtype.service.VacationTypeService;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class VacationTypeController {

    private final VacationTypeService vacationTypeService;
}
