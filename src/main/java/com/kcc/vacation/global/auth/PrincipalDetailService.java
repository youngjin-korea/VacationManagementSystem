package com.kcc.vacation.global.auth;


import com.kcc.vacation.domain.employee.mapper.EmployeeMapper;
import com.kcc.vacation.domain.employee.dto.response.Employee;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PrincipalDetailService implements UserDetailsService {

    private final EmployeeMapper employeeMapper;

    @Override
    public UserDetails loadUserByUsername(String email) {
        Employee employee = employeeMapper.findByEmail(email);

        if (employee == null) {
            throw new UsernameNotFoundException("UserNotFound");
        }

        return new PrincipalDetail(employee);



    }
}
