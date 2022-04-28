package com.mycompany.webapp.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dao.FreeBoardDao;
import com.mycompany.webapp.dto.FreeBoardDto;
import com.mycompany.webapp.dto.PagerDto;

import com.mycompany.webapp.service.FreeBoardService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/community")
public class CommunityController {

	@Resource
	private FreeBoardService freeBoardService;


	// ****자유게시판 - board****
	@GetMapping("/board/list")
	public String boardList(@RequestParam(defaultValue = "1") int pageNo,  Model model) { //페이지는 1페이지부터 넘어오기!
		//게시판에 데이터 넣어놓기
		/*		for(int i=101; i<=10000; i++) {
					FreeBoardDto freeBoardDto = new FreeBoardDto();
					freeBoardDto.setFreeNo(i) ;
					freeBoardDto.setFreeTitle("제목"+i);
					freeBoardDto.setFreeContent("내용"+i);
					freeBoardDto.setFreeWriter("test");
					Date sampledate = new Date();
					long sampledateinsert = sampledate.getTime();
					java.sql.Date date1 = new java.sql.Date(sampledateinsert);
					freeBoardDto.setFreeRegistDate(date1);
					freeBoardDto.setFreeModifyDate(date1);
					freeBoardDto.setFreeUseYN(1);
					freeBoardDto.setFreeHitCount(0);
					freeBoardDao.insert(freeBoardDto);
				}*/
		
		//Board 게시물 개수 가져오기
		int totalBoardNum = freeBoardService.getTotalFreeBoardNum(); // 전체 개수 가져오기
		PagerDto pager = new PagerDto(10, 10, totalBoardNum, pageNo);
		model.addAttribute("pager", pager);
		
		//페이지 정보
		List<FreeBoardDto> freeboards = freeBoardService.getFreeBoards(pager);
		model.addAttribute("freeboards", freeboards);
		log.info(freeboards.toString());
		log.info("boardList페이지");
		
		return "/community/board/list";
	}

	// board/list에서 글쓰기 버튼 눌렀을 때
	@GetMapping("/board/insert")
	public String boardInsertBtn(HttpSession session) {
		log.info(session.getAttribute("sessionUserId"));
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		}else {
			return "/community/board/insert";
		}
	}

	// 글쓰기 등록 버튼
	@PostMapping("/board/insertContent") //@RequestParam(value="currp",required=false)String currp,@RequestParam(value="pname",required=false)String pname
	public String insertContent(
			@RequestParam("title") String title,
			@RequestParam("content") String content,
			HttpSession session) {
		log.info("insertContentBtn 클릭");
		log.info("아이디 정보"+session.getAttribute("sessionUserId"));
		String SessionUserid = (String) session.getAttribute("sessionUserId");
		
		//freeDto정보와 user정보를 같이 전달
		FreeBoardDto freeBoardDto = new FreeBoardDto();
		freeBoardDto.setFreeTitle(title);
		freeBoardDto.setFreeContent(content);
		freeBoardDto.setFreeWriter(SessionUserid);

		freeBoardService.insertFreeBoard(freeBoardDto);
		return "redirect:/community/board/list";
	}

	// 글쓰기 취소 버튼
	@RequestMapping("/board/insertCancle")
	public String insertCancle() {
		return "redirect:/community/board/list";
	}

	// 게시판 상세 페이지
	@GetMapping("/board/boardDetail")
	public String boardDetail(int freeNo, Model model, HttpSession session) {
		FreeBoardDto freeBoardDto = freeBoardService.getFreeBoardsContent(freeNo);
		model.addAttribute("freeBoardDto", freeBoardDto);
		String SessionUserid = (String) session.getAttribute("sessionUserId");
		model.addAttribute("seesionUserid", SessionUserid);
		if(freeBoardDto.getFreeWriter() == SessionUserid) {
			model.addAttribute("sameId", true);
		}else {
			model.addAttribute("sameId", false);
		}
		
		log.info("boardDetail 실행");
		return "/community/board/view";
	}
	
	@GetMapping("/board/freeBoardPostingDelete")
	public String freeBoardPostingDelete(int freeNo) {
		freeBoardService.deleteFreeBoard(freeNo);
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

	// 거래게시판 - market
	@RequestMapping("/market/list")
	public String marketList() {
		return "/community/market/list";
	}

	// 게시판 상세 페이지
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

	// 글쓰기 등록 버튼
	@PostMapping("/market/insertMarketContent")
	public String insertMarketContent() {
		return "redirect:/community/market/list";
	}

	// 글쓰기 취소 버튼
	@RequestMapping("/market/insertMarketCancle")
	public String insertMarketCancle() {
		return "redirect:/community/market/list";
	}

	// 공지게시판 - list
	@RequestMapping("/notice/list")
	public String noticeList() {
		return "/community/notice/list";
	}

	// 공지 상세 페이지
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

	// 글쓰기 등록 버튼
	@PostMapping("/notice/insertNoticeContent")
	public String insertNoticeContent() {
		return "redirect:/community/notice/list";
	}

	// 글쓰기 취소 버튼
	@RequestMapping("/notice/insertNoticeCancle")
	public String insertNoticeCancle() {
		return "redirect:/community/notice/list";
	}

	// 목록 버튼
	@GetMapping("/notice/noticeViewtoList")
	public String noticeViewToList() {
		return "redirect:/community/notice/list";
	}

}
