package com.kcc.vacation.domain.employee.controller;

import com.kcc.vacation.domain.employee.dto.response.Employee;
import com.kcc.vacation.domain.employee.service.EmployeeService;
import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import org.apache.coyote.BadRequestException;
import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequiredArgsConstructor
public class EmployeeRestController {

    private final EmployeeService employeeService;

    @GetMapping("api/auth/employees/{id}")
    public Employee getById(@PathVariable(value = "id") int id) {
        return employeeService.getById(id);
    }

    @PatchMapping("api/employees/{id}/mail-send")
    public void sendEmail(@PathVariable(value = "id") int id) {
        employeeService.handleSendMail(id);
    }
    @PatchMapping("api/employees/certificate")
    public void certificate(@RequestParam(value = "email") String email, @RequestParam(value = "authenticationCode")String authenticationCode) {
        employeeService.certificate(email, authenticationCode);
    }
}
