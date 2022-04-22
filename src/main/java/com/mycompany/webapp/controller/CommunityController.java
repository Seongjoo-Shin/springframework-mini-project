package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//게시판 상세 페이지
	@GetMapping("/board/boardDetail")
	public String boardDetail() {
		return "/community/board/view";
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
	
	//게시판 상세 페이지
	@GetMapping("/market/marketDetail")
	public String marketDetail() {
		return "/community/market/view";
	}
	
	@RequestMapping("/market/insert")
	public String marketInsert() {
		return "/community/market/insert";
	}
	
	@RequestMapping("/market/update")
	public String marketUpdate() {
		return "/community/market/update";
	}
	
	@RequestMapping("/market/view")
	public String marketView() {
		return "/community/market/view";
	}
	
	@GetMapping("/market/marketViewtoList")
	public String marketViewToList() {
		return "redirect:/community/market/list";
	}
	
	//글쓰기 등록 버튼
	@PostMapping("/market/insertMarketContent")
	public String insertMarketContent() {
		return "redirect:/community/market/list";
	}
	
	//글쓰기 취소 버튼
	@RequestMapping("/market/insertMarketCancle")
	public String insertMarketCancle() {
		return "redirect:/community/market/list";
	}
	
	//공지게시판 - list
	@RequestMapping("/notice/list")
	public String noticeList() {
		return "/community/notice/list";
	}
	
	//공지 상세 페이지
	@GetMapping("/notice/noticeDetail")
	public String noticeDetail() {
		return "/community/notice/view";
	}
	
	@RequestMapping("/notice/insert")
	public String noticeInsert() {
		return "/community/notice/insert";
	}
	
	@RequestMapping("/notice/update")
	public String noticeUpdate() {
		return "/community/board/update";
	}
	
	//글쓰기 등록 버튼
	@PostMapping("/notice/insertNoticeContent")
	public String insertNoticeContent() {
		return "redirect:/community/notice/list";
	}
	
	//글쓰기 취소 버튼
	@RequestMapping("/notice/insertNoticeCancle")
	public String insertNoticeCancle() {
		return "redirect:/community/notice/list";
	}
	
	//목록 버튼
	@GetMapping("/notice/noticeViewtoList")
	public String noticeViewToList() {
		return "redirect:/community/notice/list";
	}
}
