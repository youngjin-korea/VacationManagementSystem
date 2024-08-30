package com.kcc.vacation.domain.vacationtype.service;

import com.kcc.vacation.domain.vacationtype.mapper.VacationTypeMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class VacationTypeService {
    private final VacationTypeMapper vacationTypeMapper;
}
