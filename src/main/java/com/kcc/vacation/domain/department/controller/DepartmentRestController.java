package com.kcc.vacation.domain.department.controller;

import com.kcc.vacation.domain.department.service.DepartmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
public class DepartmentRestController {

    private final DepartmentService departmentService;

}
