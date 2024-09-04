package com.kcc.vacation.domain.vacationrequest.mapper;

import com.kcc.vacation.domain.vacationrequest.dto.request.MyVacationRequest;
import com.kcc.vacation.domain.vacationrequest.dto.response.MyVacation;
import com.kcc.vacation.domain.vacationrequest.dto.response.VacationRequestDetail;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface VacationRequestMapper {
    VacationRequestDetail getVacationRequestDetail(Long vacationRequestId);
    List<VacationRequestDetail> getVacationList();
    List<MyVacation> getMyVacations(int employeeId);

    int insertVacationRequest(MyVacationRequest myVacationRequest);

}
