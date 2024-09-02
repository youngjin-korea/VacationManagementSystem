package com.kcc.vacation.domain.employee.controller;

import com.kcc.vacation.domain.employee.dto.request.EmployeeCreate;
import com.kcc.vacation.domain.employee.dto.request.EmployeeEmailLogin;
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

    @PostMapping("auth/login")
    public String login(@ModelAttribute EmployeeEmailLogin employeeEmailLogin) {
        //employeeService.login(employeeEmailLogin);
        return "auth/login";
    }
    @GetMapping("auth/logout")
    public @ResponseBody String logout() {
        System.out.println("logout");
        return "auth/logout";
    }


    @GetMapping("auth/login-form")
    public String loginForm(@RequestParam(value = "error", required = false) String error,
                            @RequestParam(value = "exception", required = false) String exception,  Model model) {
        model.addAttribute("error", error);
        model.addAttribute("exception", exception);
        return "auth/login-form";
    }


    @PostMapping("auth/join")
    public String join(@ModelAttribute EmployeeCreate employeeCreate) {
        employeeService.join(employeeCreate);

        return "auth/login-form";
    }


    @GetMapping("auth/join-form")
    public String joinForm() {
        System.out.println("join-form");
        return "auth/join-form";
    }

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
