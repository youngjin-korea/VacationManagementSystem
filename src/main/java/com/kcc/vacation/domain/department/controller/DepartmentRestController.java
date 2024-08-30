package com.kcc.vacation.domain.department.controller;

import com.kcc.vacation.domain.department.dto.response.DepartmentDetail;
import com.kcc.vacation.domain.department.service.DepartmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
public class DepartmentRestController {

    private final DepartmentService departmentService;

    @GetMapping("/api/departments/{departmentId}")
    public DepartmentDetail getDepartmentDetail(@PathVariable(value = "departmentId") int departmentId) {
        return departmentService.getDepartment(departmentId);
    }
}
