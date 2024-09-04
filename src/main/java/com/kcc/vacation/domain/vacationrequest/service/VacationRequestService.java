package com.kcc.vacation.domain.vacationrequest.service;

import com.kcc.vacation.domain.employee.dto.response.Employee;
import com.kcc.vacation.domain.employee.mapper.EmployeeMapper;
import com.kcc.vacation.domain.employee.service.EmployeeService;
import com.kcc.vacation.domain.vacationrequest.dto.request.MyVacationRequest;
import com.kcc.vacation.domain.vacationrequest.dto.response.MyVacation;
import com.kcc.vacation.domain.vacationrequest.dto.response.VacationRequestDetail;
import com.kcc.vacation.domain.vacationrequest.dto.response.VacationRequestList;
import com.kcc.vacation.domain.vacationrequest.mapper.VacationRequestMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class VacationRequestService {

    private final VacationRequestMapper vacationRequestMapper;
    private final EmployeeMapper employeeMapper;

    // 휴가 요청 목록 보기 - 관리자
    // 승인 권한이 있는 목록만 출력
    public List<VacationRequestList> getVacationRequestListByApproverId() {

        // 로그인한 유저 정보
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Employee loginUser = employeeMapper.findByEmail(username);

        // 현재 임의의 인사팀 부서장인 1003 번으로 접속했다고 가정함
//        return vacationRequestMapper.getVacationList(loginUser.getId());
        return vacationRequestMapper.getVacationRequestListByApproverId(1003);
    }

    // 휴가 승인 - 관리자
    public boolean approveVacation(int requestId) {

        // 로그인한 유저 정보
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Employee loginUser = employeeMapper.findByEmail(username);

        //int rowsAffected = vacationRequestMapper.updateApproverStatus(requestId, loginUser.getId());

        // 현재 임의의 인사팀 부서장인 1003 번으로 접속했다고 가정함
        int rowsAffected = vacationRequestMapper.approveVacation(requestId, 1003);

        return rowsAffected > 0; // 업데이트된 행의 수가 0보다 크면 true 리턴
    }

    public boolean rejectVacation(int id, String commentsOfApprover) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Employee loginUser = employeeMapper.findByEmail(username);
        // 현재 임의의 인사팀 부서장인 1003 번으로 접속했다고 가정함
        int rowsAffectedFALSE = vacationRequestMapper.rejectVacationFALSE(id, 1003);
        int rowsAffectedTRUE = vacationRequestMapper.rejectVacationSTATUS(id, commentsOfApprover);
        // 예외처리 추가 예정
        return rowsAffectedFALSE + rowsAffectedTRUE > 1;
    }

    public List<MyVacation> getMyVacationList(int employeeId) {return vacationRequestMapper.getMyVacations(employeeId);}

    @Transactional
    public int insertVacationRequest(MyVacationRequest myVacationRequest) {
        MyVacationRequest mvr = myVacationRequest;
        mvr.setEmpId(1001);
        mvr.setTypeId(1);
        int isSuccess = vacationRequestMapper.insertVacationRequest(mvr);
        System.out.println(mvr.getId()+"=========================================!!!!!");
        return isSuccess;
    }


}
