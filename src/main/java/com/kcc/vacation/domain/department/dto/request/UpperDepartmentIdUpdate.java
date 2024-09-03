package com.kcc.vacation.domain.department.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

@NoArgsConstructor
@Getter
public class UpperDepartmentIdUpdate {

    private List<Integer> updateTargetIds;
    private int upperDeptId;

    @Builder
    public UpperDepartmentIdUpdate(List<Integer> updateTargetIds, int upperDeptId) {
        this.updateTargetIds = updateTargetIds;
        this.upperDeptId = upperDeptId;
    }
}
