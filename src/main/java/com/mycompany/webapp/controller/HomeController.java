package com.mycompany.webapp.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.MessageDto;
import com.mycompany.webapp.service.MypageService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class HomeController {
	
	@Resource
	private MypageService mypageService;
	
	@RequestMapping("/")
	public String home() {
		log.info("실행");
		return "home";
	}
	
	@RequestMapping("/message")
	public String message(HttpServletRequest request, Model model) {
		model.addAttribute("receiver", request.getParameter("receiver"));
		return "common/message";
	}
	
	@RequestMapping("/messageSend")
	public String messageSend(HttpServletRequest request, Model model) {
		model.addAttribute("receiver", request.getParameter("receiver"));
		return "common/messageSend";
	}
	
	@GetMapping("/messageView")
	public String messageView(HttpSession session, HttpServletRequest request, Model model) {
		MessageDto message = mypageService.getMessageByNo(Integer.parseInt(request.getParameter("messageNo")));
		log.info(message);
		model.addAttribute("message", message);
		return "common/messageView";
	}
}

