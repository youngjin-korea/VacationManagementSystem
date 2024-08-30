package com.kcc.vacation.domain.department.mapper;

import com.kcc.vacation.domain.department.dto.response.DepartmentDetail;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DepartmentMapper {
    DepartmentDetail getDepartment(int departmentId);

}
