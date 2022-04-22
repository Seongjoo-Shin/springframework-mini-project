package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String message() {
		return "common/message";
	}
	
	@RequestMapping("/messageView")
	public String messageView() {
		return "common/messageView";
	}
	
	//게시판 플러스 기호 링크
	@GetMapping("/homeToBoard")
	public String homeToBoard() {
		return "/community/board/list";
	}
	@GetMapping("/homeToMarket")
	public String homeToMarket() {
		return "/community/market/list";
	}
	@GetMapping("/homeToNotice")
	public String homeToNotice() {
		return "/community/notice/list";
	}
	
	//게시판 view페이지 이동
	@GetMapping("/homeToBoardView")
	public String homeToBoardView() {
		return "/community/board/view";
	}
	@GetMapping("/homeToMarketView")
	public String homeToMarketView() {
		return "/community/market/view";
	}
	@GetMapping("/homeToNoticeView")
	public String homeToNoticeView() {
		return "/community/notice/view";
	}
}
