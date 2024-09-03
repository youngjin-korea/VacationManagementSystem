package com.kcc.vacation.domain.department.mapper;

import com.kcc.vacation.domain.department.dto.request.DepartmentCreate;
import com.kcc.vacation.domain.department.dto.request.DepartmentUpdate;
import com.kcc.vacation.domain.department.dto.request.UpperDepartmentIdUpdate;
import com.kcc.vacation.domain.department.dto.response.DepartmentDetail;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DepartmentMapper {
    DepartmentDetail findDepartment(int departmentId);
    List<DepartmentDetail> findAllDepartment();
    void updateDepartment(DepartmentUpdate departmentUpdate);

    void deleteDepartment(int id);


    List<Integer> findUpdateTargetIds(int deleteTargetId);

    void updateUpperDepartmentId(UpperDepartmentIdUpdate upperDepartmentIdUpdate);

    void createDepartment(DepartmentCreate departmentCreate);
}
