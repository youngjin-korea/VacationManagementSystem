package com.kcc.vacation.domain.vacationrequest.controller;

import com.kcc.vacation.domain.vacationrequest.dto.response.VacationRequestDetail;
import com.kcc.vacation.domain.vacationrequest.service.VacationRequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class VacationRequestRestController {
    private final VacationRequestService vacationRequestService;

}
