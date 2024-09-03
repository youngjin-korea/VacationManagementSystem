package com.kcc.vacation.domain.grantedvacation.controller;

import com.kcc.vacation.domain.grantedvacation.service.GrantedVacationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class GrantedVacationController {

    private final GrantedVacationService grantedVacationService;


}
