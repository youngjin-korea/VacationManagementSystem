package com.kcc.vacation.domain.department.controller;

import com.kcc.vacation.domain.department.dto.request.DepartmentCreate;
import com.kcc.vacation.domain.department.dto.request.DepartmentUpdate;
import com.kcc.vacation.domain.department.dto.response.DepartmentDetail;
import com.kcc.vacation.domain.department.service.DepartmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import org.springframework.web.servlet.view.RedirectView;

@RequiredArgsConstructor
@RestController
public class DepartmentRestController {

    private final DepartmentService departmentService;

    @GetMapping("/api/departments/{departmentId}")
    public DepartmentDetail getDepartmentDetail(@PathVariable(value = "departmentId") int departmentId) {
        return departmentService.getDepartment(departmentId);
    }
    @GetMapping("/api/departments")
    public List<DepartmentDetail> getDepartments() {
        return departmentService.getDepartments();
    }
    @PostMapping("/api/departments")
    public String createDepartment(@RequestBody DepartmentCreate departmentCreate) {
        departmentService.createDepartment(departmentCreate);
        return "/admin/department-management?addedDepartmentId=" + departmentCreate.getId();
    }

    @PutMapping("/api/departments/{id}")
    public String updateDepartment(@RequestBody DepartmentUpdate departmentUpdate, @PathVariable(value = "id") int id) {
        departmentUpdate.setId(id);
        departmentService.updateDepartment(departmentUpdate);

        return "/admin/department-management";
    }
    @DeleteMapping("/api/departments/{id}")
    public String  deleteDepartment(@PathVariable(value = "id") int id) {
        departmentService.deleteDepartment(id);

        return "/admin/department-management";
    }


}
