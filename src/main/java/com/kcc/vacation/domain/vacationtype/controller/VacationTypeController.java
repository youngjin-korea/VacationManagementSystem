package com.kcc.vacation.domain.vacationtype.controller;

import com.kcc.vacation.domain.department.dto.response.DepartmentDetail;
import com.kcc.vacation.domain.vacationtype.dto.response.VacationTypeDetail;
import com.kcc.vacation.domain.vacationtype.service.VacationTypeService;

import lombok.RequiredArgsConstructor;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
@RequiredArgsConstructor
public class VacationTypeController {

    private final VacationTypeService vacationTypeService;

//    @GetMapping("admin/vacation-type-management")
//    public String vacationtype(){
//        return "admin/vacation-type-management";
//    }

    @GetMapping("admin/vacation-type-management")
    public String getVacationType(Model model) {
        // 샘플 데이터 가져오기, 실제 서비스 메소드로 대체
        System.out.println("getVacationType");
        List<VacationTypeDetail> vacationTypeList = vacationTypeService.getAllVacationTypes();
        model.addAttribute("vacationTypeList", vacationTypeList);
        return "admin/vacation-type-management";
    }



}
