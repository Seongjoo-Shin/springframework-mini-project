package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/mypage")
public class MypageController {
	
	@RequestMapping("/modify")
	public String modify() {
		
		return "/mypage/modify";
	}
	
	@RequestMapping("/prefer")
	public String prefer() {
		
		return "/mypage/prefer";
	}
	
	@RequestMapping("/withdrawl")
	public String withdrawl() {
		
		return "/mypage/withdrawl";
	}
	
	@RequestMapping("/myboard/board")
	public String myboardBoard() {
		
		return "/mypage/myboard/board";
	}
	
	@RequestMapping("/myboard/building")
	public String myboardBuilding() {
		
		return "/mypage/myboard/building";
	}
	
	@RequestMapping("/myboard/market")
	public String myboardMarket() {
		
		return "/mypage/myboard/market";
	}
	
	@RequestMapping("/message/receive")
	public String messageReceive() {
		
		return "/mypage/message/receive";
	}
	
	@RequestMapping("/message/send")
	public String messageSend() {
		
		return "/mypage/message/send";
	}
	
	
}
