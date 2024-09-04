package com.kcc.vacation.domain.grantedvacation.controller;

import ch.qos.logback.core.model.Model;
import com.kcc.vacation.domain.grantedvacation.service.GrantedVacationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class GrantedVacationController {

    private final GrantedVacationService grantedVacationService;

    @GetMapping("/admin/grant-vacation-management")
    public String grantVacationManagement(Model model) {
        return "admin/grant-vacation-management";
    }
}
