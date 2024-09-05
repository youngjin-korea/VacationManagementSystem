package com.kcc.vacation.domain.vacationcancel.mapper;

import com.kcc.vacation.domain.vacationcancel.dto.request.CancelVacation;
import com.kcc.vacation.domain.vacationcancel.dto.response.VacationCancelDetail;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface VacationCancelMapper {
    int insertCancelReq(CancelVacation cancelVacation);

    // 관리자용 취소 휴가 신청 보기
    List<VacationCancelDetail> getVacationCancelListByApproverId(int approverId);

    // 관리자용 취소 휴가 승인
    int approveVacation(int cancelId, int approverId);
}
