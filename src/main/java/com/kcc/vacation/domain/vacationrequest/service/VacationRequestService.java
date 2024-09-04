package com.kcc.vacation.domain.vacationrequest.service;

import com.kcc.vacation.domain.vacationrequest.dto.request.MyVacationApprover;
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
    public String insertVacationRequest(MyVacationRequest myVacationRequest, MyVacationApprover myVacationApprover) {

        // 휴가 추가
        MyVacationRequest mvr = myVacationRequest;
        int isSuccess1 = vacationRequestMapper.insertVacationRequest(mvr);
        // 휴가 승인자 추가
        MyVacationApprover approver = myVacationApprover;
        approver.setId(mvr.getId());
        int isSucess2 = vacationRequestMapper.insertApprover(approver);

        if(isSuccess1 == 1 && isSucess2 == 1){
            return "success";
        }
        return "fail";
    }
}
