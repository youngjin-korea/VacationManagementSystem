package com.kcc.vacation.domain.vacationcancel.controller;


import com.kcc.vacation.domain.vacationcancel.dto.response.VacationCancelDetail;
import com.kcc.vacation.domain.vacationcancel.service.VacationCancelService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class VacationCancelRestController {

    private final VacationCancelService vacationCancelService;


    @PostMapping("/admin/cancel-approve-vacation")
    public boolean cancelApproveVacation(@RequestBody VacationCancelDetail vacationCancelDetail) {
        boolean success = vacationCancelService.cancelApproveVacation(vacationCancelDetail.getId());
        return success;
    }
}
