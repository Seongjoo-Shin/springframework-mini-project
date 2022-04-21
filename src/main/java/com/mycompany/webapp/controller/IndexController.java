package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/index")
public class IndexController {
	@RequestMapping("/login")
	public String example() {
		log.info("실행");
		return "/index/login";
	}
}
