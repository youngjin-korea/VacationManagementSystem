package com.kcc.vacation.domain.vacationcancel.controller;


import com.kcc.vacation.domain.vacationcancel.service.VacationCancelService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class VacationCancelController {

    private final VacationCancelService vacationCancelService;
}