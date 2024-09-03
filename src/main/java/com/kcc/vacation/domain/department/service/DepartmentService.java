package com.kcc.vacation.domain.department.service;

import com.kcc.vacation.domain.department.dto.request.DepartmentCreate;
import com.kcc.vacation.domain.department.dto.request.DepartmentUpdate;
import com.kcc.vacation.domain.department.dto.request.UpperDepartmentIdUpdate;
import com.kcc.vacation.domain.department.dto.response.DepartmentDetail;
import com.kcc.vacation.domain.department.mapper.DepartmentMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor
@Service
public class DepartmentService {

    private final DepartmentMapper departmentMapper;

    public DepartmentDetail getDepartment(int departmentId) {
        return departmentMapper.findDepartment(departmentId);
    }
    public List<DepartmentDetail> getDepartments() {
        return departmentMapper.findAllDepartment();
    }
    public void updateDepartment(DepartmentUpdate departmentUpdate) {
        departmentMapper.updateDepartment(departmentUpdate);
    }


    /**
     * @Description
     * 1. 삭제 대상 부서 조회
     * 2. 하위 부서들의 ID를 조회
     * 3. 하위 부서가 없다면 즉시 삭제
     * 4.
     */
    @Transactional
    public void deleteDepartment(int id) {
        DepartmentDetail deleteTarget = departmentMapper.findDepartment(id);



        List<Integer> updateTargetIds = departmentMapper.findUpdateTargetIds(deleteTarget.getId());
        if(updateTargetIds.isEmpty()) {
            departmentMapper.deleteDepartment(id);
        }
        else
        {
            departmentMapper.updateUpperDepartmentId(
                    UpperDepartmentIdUpdate.builder()
                            .updateTargetIds(updateTargetIds)
                            .upperDeptId(deleteTarget.getUpperDeptId())
                            .build()
            );

            departmentMapper.deleteDepartment(id);
        }



    }

    public void createDepartment(DepartmentCreate departmentCreate) {
        departmentMapper.createDepartment(departmentCreate);
    }
}

