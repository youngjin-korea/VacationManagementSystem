package com.kcc.vacation.domain.vacationtype.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.kcc.vacation.domain.vacationtype.dto.response.VacationTypeDetail;

import java.util.List;

@Mapper
public interface VacationTypeMapper {
   //VacationTypeDetail getVacationType(String vacationName);

   List<VacationTypeDetail> getAllVacationTypes();
   VacationTypeDetail getVacationById(int id);

}
