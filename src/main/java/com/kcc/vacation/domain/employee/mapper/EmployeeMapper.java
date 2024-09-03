package com.kcc.vacation.domain.employee.mapper;

import com.kcc.vacation.domain.employee.dto.request.*;
import com.kcc.vacation.domain.employee.dto.response.MyInfo;
import com.kcc.vacation.domain.employee.dto.response.Employee;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface EmployeeMapper {

    void save(EmployeeCreate employeeCreate);

    Employee findById(int id);

    Employee findByEmail(String email);

    Employee findByOauthId(String oauthId);

    void updateSocialData(EmployeeSocialDataUpdate socialDataUpdate);
    void updateFormLoginData(EmployeeFormLoginDataUpdate formLoginDataUpdate);
    MyInfo getMyInfo(int employeeId);
    int updateMyInfo(@Param("updateMyInfo") UpdateMyInfo updateMyInfo);

    void updateAuthenticationCode(EmployeeAuthenticationCodeUpdate authenticationData);
    void updateVerified(EmployeeVerifiedUpdate authenticationData);
}
