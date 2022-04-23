package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/interior")
public class InteriorController {
	@RequestMapping("/example")
	public String example() {
		log.info("실행");
		return "/interior/example";
	}
	
	@RequestMapping("/example50")
	public String example50() {
		log.info("실행");
		return "/interior/example50";
	}
	
	@RequestMapping("/example65")
	public String example65() {
		log.info("실행");
		return "/interior/example65";
	}
	
	@RequestMapping("/example100")
	public String example100() {
		log.info("실행");
		return "/interior/example100";
	}
	
	@RequestMapping("/simulator")
	public String simulator() {
		log.info("실행");
		return "/interior/simulator";
	}
}
