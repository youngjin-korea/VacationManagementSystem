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
	@GetMapping("/client/client-calender")
	public String client_clientcalender() {
		return "/client/client-calender";
	}

}
