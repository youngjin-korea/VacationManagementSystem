package com.kcc.vacation.domain.vacationrequest.controller;

import com.kcc.vacation.domain.vacationrequest.dto.response.MyVacation;
import com.kcc.vacation.domain.vacationrequest.dto.response.VacationRequestDetail;
import com.kcc.vacation.domain.vacationrequest.service.VacationRequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class VacationRequestRestController {
    private final VacationRequestService vacationRequestService;

    @PostMapping("/admin/approve-vacation")
    public boolean approveVacation(@RequestBody VacationRequestDetail requestDetail) {
        boolean success = vacationRequestService.approveVacation(requestDetail.getId());
        return success;
    }

    @PostMapping("/admin/reject-vacation")
    public boolean rejectVacation(@RequestParam("id") String id, @RequestParam("commentsOfApprover") String commentsOfApprover) {
      boolean success = vacationRequestService.rejectVacation(Integer.parseInt(id), commentsOfApprover);
      return success;
    };


    @GetMapping("/my-vacations/{employeeId}")
    public List<MyVacation> getClientVacationList(@PathVariable int employeeId) {

        return vacationRequestService.getMyVacationList(employeeId);
    }
}
