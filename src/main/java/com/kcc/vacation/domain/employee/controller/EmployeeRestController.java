package com.kcc.vacation.domain.employee.controller;

import com.kcc.vacation.domain.employee.dto.response.Employee;
import com.kcc.vacation.domain.employee.service.EmployeeService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class EmployeeRestController {

    private final EmployeeService employeeService;

    @GetMapping("api/auth/employees/{id}")
    public Employee getById(@PathVariable(value = "id") int id) {
        return employeeService.getById(id);
    }
}
