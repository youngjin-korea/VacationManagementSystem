package com.kcc.vacation.domain.valicationrequest.service;

import com.kcc.vacation.domain.valicationrequest.mapper.VacationRequestMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class VacationRequestService {

    private final VacationRequestMapper vacationRequestMapper;

}
