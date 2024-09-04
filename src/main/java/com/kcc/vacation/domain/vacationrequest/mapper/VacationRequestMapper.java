package com.kcc.vacation.domain.vacationrequest.mapper;

import com.kcc.vacation.domain.vacationrequest.dto.request.MyVacationApprover;
import com.kcc.vacation.domain.vacationrequest.dto.request.MyVacationRequest;
import com.kcc.vacation.domain.vacationrequest.dto.response.MyVacation;
import com.kcc.vacation.domain.vacationrequest.dto.response.VacationRequestDetail;
import com.kcc.vacation.domain.vacationrequest.dto.response.VacationRequestList;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface VacationRequestMapper {

    // 관리자용 휴가 신청 자세히 보기
    VacationRequestDetail getVacationRequestDetail(int vacationRequestId);
    // 관리자용 휴가 신청 목록 보기
    List<VacationRequestList> getVacationRequestListByApproverId(int approverId);
    // 관리자용 승인 버튼 눌렀을 때
    int updateApproverStatus(int requestId, int approverId);

    List<MyVacation> getMyVacations(int employeeId);
    int insertVacationRequest(MyVacationRequest myVacationRequest);

    int insertApprover(MyVacationApprover myVacationApprover);

}
