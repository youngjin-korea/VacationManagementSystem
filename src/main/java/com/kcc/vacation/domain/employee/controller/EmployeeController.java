package com.kcc.vacation.domain.employee.controller;

import com.kcc.vacation.domain.employee.dto.request.UpdateMyInfo;
import com.kcc.vacation.domain.employee.dto.response.MyInfo;
import com.kcc.vacation.domain.employee.service.EmployeeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class EmployeeController {

    private final EmployeeService employeeService;

    @GetMapping("/client/my-page/{employeeId}")
    public String myPage(@PathVariable int employeeId, Model model) {
        MyInfo myInfo = employeeService.getMyInfo(employeeId);
        model.addAttribute("myInfo", myInfo);
        return "/client/my-page";
    }

    @PostMapping("/client/my-page")
    public String updateMyInfo(@ModelAttribute UpdateMyInfo updateMyInfo) {
        employeeService.updateMyInfo(updateMyInfo);
        return "redirect:/client/my-page/"+updateMyInfo.getId()+"?updateSuccess=true";
    }

}
