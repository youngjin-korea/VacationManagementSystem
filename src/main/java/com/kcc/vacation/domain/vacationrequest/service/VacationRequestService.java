package com.kcc.vacation.domain.vacationrequest.service;

import com.kcc.vacation.domain.vacationrequest.dto.request.MyVacationRequest;
import com.kcc.vacation.domain.vacationrequest.dto.response.MyVacation;
import com.kcc.vacation.domain.vacationrequest.dto.response.VacationRequestDetail;
import com.kcc.vacation.domain.vacationrequest.mapper.VacationRequestMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class VacationRequestService {

    private final VacationRequestMapper vacationRequestMapper;


    public List<VacationRequestDetail> getVacationList() {
        return vacationRequestMapper.getVacationList();
    }

    public List<MyVacation> getMyVacationList(int employeeId) {return vacationRequestMapper.getMyVacations(employeeId);}

    @Transactional
    public int insertVacationRequest(MyVacationRequest myVacationRequest) {
        MyVacationRequest mvr = myVacationRequest;
        int isSuccess = vacationRequestMapper.insertVacationRequest(mvr);

        return isSuccess;
    }
}
