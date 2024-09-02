package com.kcc.vacation.domain.employee.mapper;

import com.kcc.vacation.domain.employee.dto.response.MyInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeMapper {
    MyInfo getMyInfo(int employeeId);
}
