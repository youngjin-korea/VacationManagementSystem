package com.kcc.vacation.domain.vacationcancel.service;

import com.kcc.vacation.domain.employee.dto.response.Employee;
import com.kcc.vacation.domain.employee.mapper.EmployeeMapper;
import com.kcc.vacation.domain.vacationcancel.dto.request.CancelVacation;
import com.kcc.vacation.domain.vacationcancel.dto.response.VacationCancelDetail;
import com.kcc.vacation.domain.vacationcancel.mapper.VacationCancelMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class VacationCancelService {

    private final VacationCancelMapper vacationCancelMapper;
    private final EmployeeMapper employeeMapper;

    public List<VacationCancelDetail> getVacationCancelListByApproverId() {
        //String username = SecurityContextHolder.getContext().getAuthentication().getName();
        //Employee loginUser = employeeMapper.findByEmail(username);
        List<VacationCancelDetail> vacationCancelDetailList = vacationCancelMapper.getVacationCancelListByApproverId(1003);
        return vacationCancelDetailList;
    }

    public boolean cancelApproveVacation(int cancelId) {
        //String username = SecurityContextHolder.getContext().getAuthentication().getName();
        //Employee loginUser = employeeMapper.findByEmail(username);

        int rowsAffected = vacationCancelMapper.approveVacation(cancelId, 1003);
        return rowsAffected > 0;
    }

    public String insertCancelReq(CancelVacation cancelVacation) {
        int result = vacationCancelMapper.insertCancelReq(cancelVacation);

        if (result == 1) {
            return "success";
        }
        return "fail";
    }


    public boolean cancelRejectVacation(int cancelId, String commentsOfApprover) {
        //String username = SecurityContextHolder.getContext().getAuthentication().getName();
        //Employee loginUser = employeeMapper.findByEmail(username);

        // 임시 관리자 로그인 1003
        int rowsStatus = vacationCancelMapper.rejectVacation(cancelId, 1003);
        int rowsComments = vacationCancelMapper.UpdateApproverComments(cancelId, commentsOfApprover);

        return rowsStatus == 1 && rowsComments > 0;
    }
}
