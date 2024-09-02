package com.kcc.vacation.domain.employee.mapper;

import com.kcc.vacation.domain.employee.dto.request.UpdateMyInfo;
import com.kcc.vacation.domain.employee.dto.response.MyInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface EmployeeMapper {
    MyInfo getMyInfo(int employeeId);
    int updateMyInfo(@Param("updateMyInfo") UpdateMyInfo updateMyInfo);
}
