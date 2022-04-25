package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/mypage")
@Log4j2
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
	
	@RequestMapping("/prefer/buildingprefer")
	public String buildingprefer() {
		logger.info("실행");
		return "/mypage/prefer/buildingprefer";
	}
	
	@RequestMapping("/prefer/marketprefer")
	public String marketprefer() {
		logger.info("실행");
		return "/mypage/prefer/marketprefer";
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
	
	@GetMapping("/messageForm")
	public void messageForm() {
		logger.info("실행messageForm");
	}
	
}
