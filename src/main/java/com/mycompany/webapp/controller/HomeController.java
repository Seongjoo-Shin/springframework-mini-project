package com.mycompany.webapp.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/")
	public String home() {
		logger.info("실행");
		return "home";
	}
	
	@RequestMapping("/message")
	public String message(HttpServletRequest request, Model model) {
		model.addAttribute("sender", request.getParameter("sender"));
		return "common/message";
	}
	
	@RequestMapping("/messageView")
	public String messageView() {
		return "common/messageView";
	}
	
	@PostMapping("/message/send")
	public String messageSend() {
		
		return "mypage/message/send";
	}
}
