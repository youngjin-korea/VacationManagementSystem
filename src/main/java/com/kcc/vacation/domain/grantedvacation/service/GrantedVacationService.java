package com.kcc.vacation.domain.grantedvacation.service;

import com.kcc.vacation.domain.grantedvacation.mapper.GrantedVacationMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class GrantedVacationService {

    private final GrantedVacationMapper grantedVacationMapper;
}
