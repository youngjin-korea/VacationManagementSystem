package com.kcc.vacation.domain.employee.service;

import com.kcc.vacation.domain.employee.dto.request.EmployeeCreate;
import com.kcc.vacation.domain.employee.dto.request.EmployeeEmailLogin;
import com.kcc.vacation.domain.employee.dto.request.EmployeeFormLoginDataUpdate;
import com.kcc.vacation.domain.employee.dto.response.Employee;
import com.kcc.vacation.domain.employee.dto.request.UpdateMyInfo;
import com.kcc.vacation.domain.employee.dto.response.MyInfo;
import com.kcc.vacation.domain.employee.mapper.EmployeeMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class EmployeeService {

    private final EmployeeMapper employeeMapper;
    private final PasswordEncoder passwordEncoder;
    private final AuthenticationManagerBuilder authenticationManagerBuilder;

    public void join(EmployeeCreate employeeCreate) {
        if(!employeeCreate.getPassword().equals(employeeCreate.getPasswordCheck()))
            System.out.println("비밀번호확인 오류");

        Employee employee = employeeMapper.findByEmail(employeeCreate.getEmail());

        /**
         *  @Description
         *  사원이 없다면 -> 회원가입 진행
         *
         *  사원은 존재하지만 합류여부 'TRUE'인 상태
         *  -> 소셜회원가입을 진행한 상태
         *  -> 비밀번호 등의 계정정보를 추가로 채운다.
         *
         *
         */
        if(employee == null)
        {
            employeeCreate.setPassword(passwordEncoder.encode(employeeCreate.getPassword()));
            employeeCreate.setAuthority("ROLE_USER");
            employeeMapper.save(employeeCreate);
        }
        else {
            employeeMapper.updateFormLoginData(
                    EmployeeFormLoginDataUpdate.builder()
                            .id(employee.getId())
                            .phoneNumber(employeeCreate.getPhoneNumber())
                            .password(passwordEncoder.encode(employeeCreate.getPassword()))
                            .build()
            );
        }

    }

    public Employee getById(int id) {
        return employeeMapper.findById(id);
    }


    public MyInfo getMyInfo(int employeeId) {
        return employeeMapper.getMyInfo(employeeId);
    }

    public int updateMyInfo(UpdateMyInfo updateMyInfo) {
        return employeeMapper.updateMyInfo(updateMyInfo);
    }
}
