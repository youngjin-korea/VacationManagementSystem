package com.kcc.vacation.domain.vacationcancel.service;

import com.kcc.vacation.domain.vacationcancel.mapper.VacationCancelMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class VacationCancelService {

    private final VacationCancelMapper vacationCancelMapper;
}
