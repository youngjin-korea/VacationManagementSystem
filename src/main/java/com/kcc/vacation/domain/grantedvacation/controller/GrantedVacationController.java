package com.kcc.vacation.domain.grantedvacation.controller;

import com.kcc.vacation.domain.grantedvacation.dto.request.GrantPagingDTO;
import com.kcc.vacation.domain.grantedvacation.dto.request.GrantSavePagingInfo;
import com.kcc.vacation.domain.grantedvacation.dto.response.GrantedVacationDetail;
import com.kcc.vacation.domain.grantedvacation.dto.response.GrantedVacationList;
import com.kcc.vacation.domain.grantedvacation.service.GrantedVacationService;
import com.kcc.vacation.domain.vacationtype.dto.response.VacationTypeDetail;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class GrantedVacationController {

    private final GrantedVacationService grantedVacationService;
//
//    @GetMapping("/admin/grant-vacation-management")
//    public String grantVacationManagement(Model model) {
//
//        System.out.println("grantVacationManagement");
//        List<GrantedVacationList> GrantedVacationList = grantedVacationService.grantedVacationList();
//
//        for (GrantedVacationList grantedVacationList : GrantedVacationList) {
//            System.out.println(grantedVacationList.getVacation_name());
//        }
//
//        model.addAttribute("GrantedVacationList", GrantedVacationList);
//
//        return "admin/grant-vacation-management";
//    }




    @GetMapping("/admin/grant-vacation-management")
    public String grantVacationManagement(@RequestParam(defaultValue = "1") int pageNum,
                                          @RequestParam(defaultValue = "7") int amount,
                                          Model model) {

        GrantSavePagingInfo pagingInfo = new GrantSavePagingInfo(pageNum, amount);
        GrantPagingDTO gpageDTO = grantedVacationService.getGrantedVacationListPage(pagingInfo);
        model.addAttribute("gpageDTO", gpageDTO);

        return "admin/grant-vacation-management";
    }

}
