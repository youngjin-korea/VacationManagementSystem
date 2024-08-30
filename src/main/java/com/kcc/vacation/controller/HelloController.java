package com.kcc.vacation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

	@GetMapping("/index")
	public String index(Model model) {
		model.addAttribute("test", "Hello, Spring Boot!"); // PR Test
		return "index";
	}
	
}
