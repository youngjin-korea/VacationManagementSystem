package com.kcc.vacation.domain.grantedvacation.mapper;

import com.kcc.vacation.domain.grantedvacation.dto.request.GrantSavePagingInfo;
import com.kcc.vacation.domain.grantedvacation.dto.response.GrantedVacationList;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GrantedPagingMapper {

    List<GrantedVacationList> getGrantVacationListPaging(GrantSavePagingInfo grantSavePagingInfo);
    int getTotalGrantedVacationCount();
}
