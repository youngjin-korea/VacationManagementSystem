package com.kcc.vacation.domain.grantedvacation.service;

import com.kcc.vacation.domain.grantedvacation.dto.request.*;
import com.kcc.vacation.domain.grantedvacation.dto.response.GrantedVacationDetail;
import com.kcc.vacation.domain.grantedvacation.dto.response.GrantedVacationList;
import com.kcc.vacation.domain.grantedvacation.mapper.GrantedPagingMapper;
import com.kcc.vacation.domain.grantedvacation.mapper.GrantedVacationAddModalMapper;
import com.kcc.vacation.domain.grantedvacation.mapper.GrantedVacationMapper;
import com.kcc.vacation.domain.vacationtype.dto.request.VacationTypeCreate;
import com.kcc.vacation.domain.vacationtype.dto.request.VacationTypeUpdateDTO;
import com.kcc.vacation.domain.vacationtype.dto.response.VacationTypeDetail;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class GrantedVacationService {

    private final GrantedVacationMapper grantedVacationMapper;
    private final GrantedVacationAddModalMapper grantedVacationAddModalMapper;
    private final GrantedPagingMapper grantedPagingMapper;

    public List<GrantedVacationList> grantedVacationSearchList(String dept, String type, String empname){
        return grantedVacationMapper.grantVacationSearch(dept,type, empname);
    }

    public List<GrantedVacationList> grantedVacationList(){
        return grantedVacationMapper.grantAllVacationsList();
    }

    public GrantedVacationDetail grantedVacationDetail(int vacationId){
        return grantedVacationMapper.grantVacationById(vacationId);
    }


    public int insertGrantedVacation(GrantedVacationCreate grantedVacationCreate ) {
        return  grantedVacationMapper.insertGrantVacation(grantedVacationCreate);

    }

    public void deleteGrantedVacation(List<Integer> ids) {
        if (ids != null && !ids.isEmpty()) {
            grantedVacationMapper.deleteGrantedVacation(ids);
        }
    }

    public void updateGrantedVacation(GrantVacationUpdateDTO grantedDto) {
        grantedVacationMapper.updateGrantedVacation(grantedDto);
    }

    public List<GrantedVacationEmpInfo> getAllDepartments() {
        return grantedVacationAddModalMapper.getDepartmentByDepartmentId();
    }

    public List<GrantedVacationEmpInfo> getAllEmployees(int departmentId) {
        return grantedVacationAddModalMapper.getEmployeesByDepartment(departmentId);
    }

    public List<GrantedVacationEmpInfo> getAllVacationType() {
        return grantedVacationAddModalMapper.getVacationTypes();
    }

    public GrantPagingDTO getGrantedVacationListPage(GrantSavePagingInfo grantSavePagingInfo) {

        int total = grantedPagingMapper.getTotalGrantedVacationCount();

        // 페이징된 데이터를 가져옴
        List<GrantedVacationList> grantedVacationPageList = grantedPagingMapper.getGrantVacationListPaging(grantSavePagingInfo);
        return new GrantPagingDTO(grantSavePagingInfo, total, grantedVacationPageList);
    }

}
