package com.kcc.vacation.domain.vacationcancel.mapper;

import com.kcc.vacation.domain.vacationcancel.dto.request.CancelVacation;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VacationCancelMapper {
    int insertCancelReq(CancelVacation cancelVacation);
}
