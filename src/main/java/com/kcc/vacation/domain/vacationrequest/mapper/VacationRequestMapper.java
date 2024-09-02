package com.kcc.vacation.domain.vacationrequest.mapper;

import com.kcc.vacation.domain.vacationrequest.dto.response.VacationRequestDetail;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface VacationRequestMapper {
    VacationRequestDetail getVacationRequestDetail(Long vacationRequestId);
    List<VacationRequestDetail> getVacationList();
}
