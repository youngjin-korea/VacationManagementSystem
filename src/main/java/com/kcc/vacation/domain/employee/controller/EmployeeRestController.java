package com.kcc.vacation.domain.employee.controller;

import com.kcc.vacation.domain.employee.dto.request.*;
import com.kcc.vacation.domain.employee.dto.response.EmployeeDetail;
import com.kcc.vacation.domain.employee.service.EmployeeService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequiredArgsConstructor
public class EmployeeRestController {

    private final EmployeeService employeeService;

    @GetMapping("api/auth/employees/{id}")
    public EmployeeDetail getById(@PathVariable(value = "id") int id) {

        EmployeeDetail employeeDetail = employeeService.getById(id);
        employeeDetail.convertStatusAndAuthority();
        return employeeDetail;
    }

    @PostMapping("api/employees/mail-send")
    public void sendEmail(MailRequest mailRequest) {
        List<Integer> empIds = mailRequest.getEmpIds();
        employeeService.handleSendMail(empIds);
    }
    @PatchMapping("api/employees/mail-resend")
    public void sendEmail() {
        employeeService.resendMail();
    }

    @PatchMapping("api/employees/certificate")
    public void certificate(@RequestParam(value = "email") String email, @RequestParam(value = "authenticationCode")String authenticationCode) {
        employeeService.certificate(email, authenticationCode);
    }
    @PostMapping("api/employees")
    public String create(@RequestBody EmployeeCreateRequest employeeCreateRequest) {

        EmployeeCreate employeeCreate = EmployeeCreate.of(employeeCreateRequest);

        employeeService.add(employeeCreate);
        return "/admin/employee-management?addedEmployeeId=" + employeeCreate.getId();
    }
    @PutMapping("api/employees/{id}")
    public String update(@RequestBody EmployeeUpdateRequest employeeUpdateRequest, @PathVariable(value = "id") int id) {

        EmployeeUpdate employeeUpdate = EmployeeUpdate.of(employeeUpdateRequest, id);

        employeeService.update(employeeUpdate);
        return "/admin/employee-management?addedEmployeeId=" + id;
    }

    @DeleteMapping("api/employees/{id}")
    public String delete(@PathVariable(value = "id") int id) {
        employeeService.delete(id);
        return "/admin/employee-management";
    }
}
