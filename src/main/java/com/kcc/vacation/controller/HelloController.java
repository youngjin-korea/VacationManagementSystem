package com.kcc.vacation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

	@GetMapping("/main")
	public String main() {
		return "main";
	}

	@GetMapping("/client/request-vacation")
	public String requestVacation(){
		return "client/request-vacation";
	}
	
}
