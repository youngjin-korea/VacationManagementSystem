package com.kcc.vacation.domain.vacationrequest.controller;

import com.kcc.vacation.domain.vacationrequest.dto.request.MyVacationApprover;
import com.kcc.vacation.domain.vacationrequest.dto.request.MyVacationRequest;
import com.kcc.vacation.domain.vacationrequest.dto.request.MyVacationRequestJSP;
import com.kcc.vacation.domain.vacationrequest.service.VacationRequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class VacationRequestController {
    private final VacationRequestService vacationRequestService;

        @GetMapping("/admin/request-vacation")
        public String getVacationList(Model model) {
            model.addAttribute("vacationRequestList", vacationRequestService.getVacationRequestListByApproverId());
            return "admin/request-vacation";
        }

        @GetMapping("/client/request-vacation/{employeeId}")
        public String getClientVacationList(@PathVariable int employeeId, Model model) {
            model.addAttribute("employeeId",employeeId);
            return "client/request-vacation";
        }

        @GetMapping("/client/client-calender")
        public String client_clientcalender() {
        return "client/client-calender";
    }

        @PostMapping("/client/request-vacation")
        public String requestMyVacation(@ModelAttribute MyVacationRequestJSP vacationRequestJSP, @ModelAttribute MyVacationApprover vacationApprover) {
            vacationRequestService.insertVacationRequest(vacationRequestJSP, vacationApprover);
            return "redirect:/client/request-vacation/"+vacationRequestJSP.getEmpId()+"?updateSuccess=true";
        }
}
