package com.kcc.vacation.domain.vacationrequest.controller;

import com.kcc.vacation.domain.vacationrequest.dto.response.Approver;
import com.kcc.vacation.domain.vacationrequest.dto.response.MyVacation;
import com.kcc.vacation.domain.vacationrequest.dto.response.VacationRequestDetail;
import com.kcc.vacation.domain.vacationrequest.service.VacationRequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class VacationRequestRestController {
    private final VacationRequestService vacationRequestService;

    @PostMapping("/admin/approve-vacation")
    public boolean approveVacation(@RequestBody VacationRequestDetail requestDetail) {
        boolean success = vacationRequestService.approveVacation(requestDetail.getId());
        return success;
    }

    @GetMapping("/my-vacations/{employeeId}")
    public List<MyVacation> getClientVacationList(@PathVariable int employeeId) {

        return vacationRequestService.getMyVacationList(employeeId);
    }

    @GetMapping("/approvers/{employeeId}")
    public List<Approver> getApproverList(@PathVariable int employeeId) {
        List<Approver> myApprover = vacationRequestService.getMyApprover(employeeId);
        return myApprover;
    }

    @GetMapping("/appreovers/top-approver")
    public List<Approver> getTopApproverList() {
        return vacationRequestService.getByAuthority("ROLE_TOP_APPROVAL");
    }
}
