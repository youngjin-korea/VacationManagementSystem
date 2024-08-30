package com.kcc.vacation.domain.department.service;

import com.kcc.vacation.domain.department.dto.response.DepartmentDetail;
import com.kcc.vacation.domain.department.mapper.DepartmentMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class DepartmentService {

    private final DepartmentMapper departmentMapper;

    public DepartmentDetail getDepartment(int departmentId) {
        return departmentMapper.getDepartment(departmentId);
    }
}
