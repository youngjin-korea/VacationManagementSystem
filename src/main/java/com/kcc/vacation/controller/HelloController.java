package com.kcc.vacation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

	@GetMapping("/index")
	public String index(Model model) {
		model.addAttribute("test", "test");
		return "index";
	}

	@GetMapping("/client/request-vacation")
	public String requestVacation() {
		return "client/request-vacation";
	}

//	@GetMapping("/client/my-page")
//	public String myPage() {
//		return "client/my-page";
//	}

	@GetMapping("/organizational-management")
	public String organizationalManagement() {
		return "admin/organizational-management";
	}
	@GetMapping("/employee-management")
	public String employeeManagement() {
		return "admin/employee-management";
	}
	@GetMapping("/client/client-calender")
	public String client_clientcalender() {
		return "/client/client-calender";
	}

}
