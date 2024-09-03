package com.kcc.vacation.domain.vacationrequest.controller;

import com.kcc.vacation.domain.vacationrequest.dto.request.MyVacationRequest;
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
            model.addAttribute("vacationRequestList", vacationRequestService.getVacationList());
            return "admin/request-vacation";
        }

        @GetMapping("/client/request-vacation/{employeeId}")
        public String getClientVacationList(@PathVariable int employeeId, Model model) {
            model.addAttribute("employeeId",employeeId);
            vacationRequestService.insertVacationRequest(new MyVacationRequest());
            return "/client/request-vacation";
        }

        @PostMapping("/client/request-vacation")
        public String requestMyVacation(@ModelAttribute MyVacationRequest vacationRequest) {
             vacationRequestService.insertVacationRequest(vacationRequest);
//             TODO:: insert 승인권자
             return "redirect:/client/request-vacation/"+vacationRequest.getEmpId()+"?updateSuccess=true";
        }
}
