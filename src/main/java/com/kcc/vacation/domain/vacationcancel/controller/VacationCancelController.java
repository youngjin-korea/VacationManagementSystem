package com.kcc.vacation.domain.vacationcancel.controller;


import com.kcc.vacation.domain.vacationcancel.service.VacationCancelService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class VacationCancelController {

    private final VacationCancelService vacationCancelService;

    @GetMapping("/client/client-calender")
    public String client_clientcalender(Model model) {

        return "client/client-calender";
    }
}
