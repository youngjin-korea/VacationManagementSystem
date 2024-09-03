package com.kcc.vacation.domain.vacationtype.service;

import com.kcc.vacation.domain.vacationtype.dto.response.VacationTypeDetail;
import com.kcc.vacation.domain.vacationtype.mapper.VacationTypeMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class VacationTypeService {
    private final VacationTypeMapper vacationTypeMapper;
//
//    public VacationTypeDetail getVacationType(String vactionName) {
//        return vacationTypeMapper.getVacationType(vactionName);
//    }

    public List<VacationTypeDetail> getAllVacationTypes() {
        return vacationTypeMapper.getAllVacationTypes();
    }


    public VacationTypeDetail getVacationTypeById(int id) {
        System.out.println( "VacationTypeDetail"+ id);
        System.out.println( "VacationTypeDetail >>>>>>>>>>>>>"+vacationTypeMapper.getVacationById(id).getMax_days());
        return vacationTypeMapper.getVacationById(id);
    }
}
