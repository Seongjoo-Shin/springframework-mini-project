package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/modify")
	public String modify() {
		logger.info("실행");
		return "/mypage/modify";
	}
	
	@RequestMapping("/prefer")
	public String prefer() {
		logger.info("실행");
		return "/mypage/prefer";
	}
	
	@RequestMapping("/withdrawl")
	public String withdrawl() {
		logger.info("실행");
		return "/mypage/withdrawl";
	}
	
	@RequestMapping("/myboard/board")
	public String myboardBoard() {
		logger.info("실행");
		return "/mypage/myboard/board";
	}
	
	@RequestMapping("/myboard/building")
	public String myboardBuilding() {
		logger.info("실행");
		return "/mypage/myboard/building";
	}
	
	@RequestMapping("/myboard/market")
	public String myboardMarket() {
		logger.info("실행");
		return "/mypage/myboard/market";
	}
	
	@RequestMapping("/message/receive")
	public String messageReceive() {
		logger.info("실행");
		return "/mypage/message/receive";
	}
	
	@RequestMapping("/message/send")
	public String messageSend() {
		logger.info("실행");
		return "/mypage/message/send";
	}
	
	@RequestMapping("/message/messageForm")
	public String messageForm() {
		logger.info("실행");
		return "/mypage/message/messageForm";
	}
	
}
