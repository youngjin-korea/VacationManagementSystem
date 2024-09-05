package com.kcc.vacation.domain.grantedvacation.mapper;
import com.kcc.vacation.domain.grantedvacation.dto.request.GrantedVacationEmpInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GrantedVacationAddModalMapper {


    // 1.  부서 정보 전체 조회
    List<GrantedVacationEmpInfo> getDepartmentByDepartmentId();

    // 2. 부서 번호로 사원 조회
    List<GrantedVacationEmpInfo> getEmployeesByDepartment(int departmentId);

    // 3. 휴가유형 전체조회
    List<GrantedVacationEmpInfo> getVacationTypes();

}
