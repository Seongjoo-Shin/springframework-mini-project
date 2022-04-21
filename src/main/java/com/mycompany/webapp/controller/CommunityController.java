package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/community")
public class CommunityController {
	//****자유게시판 - board****
	@RequestMapping("/board/list")
	public String boardList() {
		log.info("실행");
		return "/community/board/list";
	}
	
	//board/list에서 글쓰기 버튼 눌렀을 때
	@GetMapping("/board/insert")
	public String boardInsertBtn() {
		log.info("실행");
		return "/community/board/insert";
	}
	
	//글쓰기 등록 버튼
	@PostMapping("/board/insertContent")
	public String insertContent() {
		return "redirect:/community/board/list";
	}
	
	//글쓰기 취소 버튼
	@RequestMapping("/board/insertCancle")
	public String insertCancle() {
		return "redirect:/community/board/list";
	}
	
	@RequestMapping("/board/view")
	public String boardView() {
		return "/community/board/view";
	}
	
	@RequestMapping("/board/insert")
	public String boardInsert1() {
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
	
	@RequestMapping("/notice/list2")
	public String noticeList2() {
		return "/community/notice/list2";
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
