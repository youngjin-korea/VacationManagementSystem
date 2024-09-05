package com.kcc.vacation.domain.grantedvacation.mapper;

import com.kcc.vacation.domain.grantedvacation.dto.request.GrantVacationUpdateDTO;
import com.kcc.vacation.domain.grantedvacation.dto.request.GrantedVacationCreate;
import com.kcc.vacation.domain.grantedvacation.dto.response.GrantedVacationDetail;
import com.kcc.vacation.domain.grantedvacation.dto.response.GrantedVacationList;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GrantedVacationMapper {

    List<GrantedVacationList> grantAllVacationsList();
    GrantedVacationDetail grantVacationById(int id);
    int insertGrantVacation(GrantedVacationCreate grantedVacationCreate);
    void deleteGrantedVacation(List<Integer> ids);
    void updateGrantedVacation(GrantVacationUpdateDTO grantedDto);

    List<GrantedVacationList> grantVacationSearch(String dept_name,String vacation_name,String emp_name);
}
