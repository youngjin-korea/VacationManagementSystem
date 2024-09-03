package com.kcc.vacation.domain.vacationrequest.controller;

import com.kcc.vacation.domain.vacationrequest.dto.response.MyVacation;
import com.kcc.vacation.domain.vacationrequest.service.VacationRequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class VacationRequestRestController {
    private final VacationRequestService vacationRequestService;

    @GetMapping("/my-vacations/{employeeId}")
    public List<MyVacation> getClientVacationList(@PathVariable int employeeId) {

        return vacationRequestService.getMyVacationList(employeeId);
    }
}
