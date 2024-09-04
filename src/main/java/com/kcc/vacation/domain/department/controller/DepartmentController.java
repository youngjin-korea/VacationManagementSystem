package com.kcc.vacation.domain.department.controller;

import com.kcc.vacation.domain.department.dto.response.DepartmentDetail;
import com.kcc.vacation.domain.department.service.DepartmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class DepartmentController {
    private final DepartmentService departmentService;


    @GetMapping("admin/department-management")
    public String getDepartments(Model model, @RequestParam(value = "addedDepartmentId",defaultValue = "0") String addedDepartmentId) {

        model.addAttribute("departments", departmentService.getDepartments());
        model.addAttribute("addedDepartmentId", addedDepartmentId);
        return "admin/department-management";
    }
}
