package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/community")
public class CommunityController {
	//자유게시판 - board
	@RequestMapping("/board/list")
	public String boardList() {
		return "/community/board/list";
	}
	
	@RequestMapping("/board/view")
	public String boardView() {
		return "/community/board/view";
	}
	
	@RequestMapping("/board/insert")
	public String boardInsert() {
		return "/community/board/insert";
	}
	
	@RequestMapping("/board/update")
	public String boardUpdate() {
		return "/community/board/update";
	}
	
	//거래게시판 - market
	@RequestMapping("/market/list")
	public String marketList() {
		return "/community/market/list";
	}
	
	@RequestMapping("/market/insert")
	public String marketInsert() {
		return "/community/market/insert";
	}
	
	@RequestMapping("/market/update")
	public String marketUpdate() {
		return "/community/board/update";
	}
	
	//공지게시판 - list
	@RequestMapping("/notice/list")
	public String noticeList() {
		return "/community/notice/list";
	}
	
	@RequestMapping("/notice/insert")
	public String noticeInsert() {
		return "/community/notice/insert";
	}
	
	@RequestMapping("/notice/update")
	public String noticeUpdate() {
		return "/community/board/update";
	}
}
