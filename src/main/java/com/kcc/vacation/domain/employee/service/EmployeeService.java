package com.kcc.vacation.domain.employee.service;

import com.kcc.vacation.domain.employee.dto.request.UpdateMyInfo;
import com.kcc.vacation.domain.employee.dto.response.MyInfo;
import com.kcc.vacation.domain.employee.mapper.EmployeeMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class EmployeeService {

    private final EmployeeMapper employeeMapper;

    public MyInfo getMyInfo(int employeeId) {
        return employeeMapper.getMyInfo(employeeId);
    }

    public int updateMyInfo(UpdateMyInfo updateMyInfo) {
        return employeeMapper.updateMyInfo(updateMyInfo);
    }
}
