package com.kcc.vacation.domain.vacationcancel.controller;


import com.kcc.vacation.domain.vacationcancel.dto.response.VacationCancelDetail;
import com.kcc.vacation.domain.vacationcancel.service.VacationCancelService;
import lombok.RequiredArgsConstructor;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class VacationCancelController {

    private final VacationCancelService vacationCancelService;

    @GetMapping("/admin/cancel-vacation")
    public String cancelVacation(Model model) {
        model.addAttribute("vacationCancelList", vacationCancelService.getVacationCancelListByApproverId());
        return "admin/cancel-vacation";
    }

    @GetMapping("/client/client-calender")
    public String client_clientcalender(Model model) {

        return "client/client-calender";
    }
}
