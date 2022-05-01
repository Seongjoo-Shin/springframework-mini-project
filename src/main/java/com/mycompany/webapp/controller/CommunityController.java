package com.mycompany.webapp.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.CommentDto;
import com.mycompany.webapp.dto.FreeBoardDto;
import com.mycompany.webapp.dto.PagerDto;
import com.mycompany.webapp.service.CommentService;
import com.mycompany.webapp.service.FreeBoardService;
import com.mycompany.webapp.service.UserService;
import com.mycompany.webapp.service.UserService.LoginResult;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/community")
public class CommunityController {

	@Resource
	private FreeBoardService freeBoardService;
	@Resource
	private UserService userService;
	@Resource
	private CommentService commentService;


	// 자유게시판 - board -------------------------------------------------------------------------------------------------------------------
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
	public String boardDetail(int freeNo, Model model, HttpSession session, HttpServletRequest request) {
		
 		//freeBoardDto 내용 model에 싣기
		FreeBoardDto freeBoardDto = freeBoardService.getFreeBoard(freeNo);
		freeBoardService.setupdateHitCount(freeNo);
		model.addAttribute("freeBoardDto", freeBoardDto);
		
		//게시물 내용 개행 처리
		String tempContent = freeBoardDto.getFreeContent();
		tempContent = org.springframework.web.util.HtmlUtils.htmlEscape(tempContent);
		tempContent = tempContent.replaceAll("\n", "<br/>");
		freeBoardDto.setFreeContent(tempContent);
		
		//현재 로그인한 사용자 id model에 싣기
		String SessionUserid = (String) session.getAttribute("sessionUserId");
		model.addAttribute("seesionUserid", SessionUserid);		
		log.info("boardDetail 실행");
		
		//현재 로그인한 사용자 닉네임 댓글에 보여주기
		String nickname = userService.getNickname(SessionUserid);
		model.addAttribute("sessionUserNickname", nickname);
		model.addAttribute("from", request.getParameter("from"));
		model.addAttribute("pageNo", request.getParameter("pageNo"));
		
		//등록된 댓글 보여주기----------------------------
		CommentDto commentDto = new CommentDto();
		//댓글 개수 가져오기
		int totalCommentNum = commentService.totalCountwhenFreeNo(freeNo);
		PagerDto pager = new PagerDto(50,10,totalCommentNum,1);
		pager.setFreeNo(freeNo);
		model.addAttribute("pager",pager); //jsp에서 페이지 만들 때 사용하려고 model로 보내줌.
		
		//페이지 정보
		List<CommentDto> comments = commentService.getselectByFreeNo(pager);
		model.addAttribute("comments", comments);
		
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

	@GetMapping("/board/update")
	public String boardUpdate(int freeNo, Model model, HttpSession session) {
		FreeBoardDto freeBoardDto = freeBoardService.getFreeBoard(freeNo);
		model.addAttribute("freeBoardDto", freeBoardDto);
		return "/community/board/update";
	}
	
	@PostMapping("/board/updateForm")
	public String boardUpdateFrom(
			@RequestParam("title") String title,
			@RequestParam("content") String content,
			HttpSession session,
			@RequestParam("freeNo") int freeNo) {

		log.info("수정페이지에서 boardUpdateForm 클릭");

		//먼저 저장되 있던 정보 불러오기
		FreeBoardDto freeBoardDto = freeBoardService.getFreeBoard(freeNo);
		freeBoardDto.setFreeTitle(title);
		freeBoardDto.setFreeContent(content);

		freeBoardService.updateFreeBoard(freeBoardDto);
		return "redirect:/community/board/boardDetail?freeNo="+freeBoardDto.getFreeNo();
	}
	
	// 댓글 -------------------------------------------------------------------------------------------------------------------
	@PostMapping("/board/insertComment")
	public String insertComment(
			int freeNo,
			@RequestParam("commentContent") String commentContent,
			HttpSession session) {
		String SessionUserid = (String) session.getAttribute("sessionUserId");
		log.info(SessionUserid);
		CommentDto commentDto = new CommentDto();
		commentDto.setCommentContent(commentContent);
		commentDto.setFreeNo(freeNo);
		commentDto.setCommentWriter(SessionUserid);
		
		commentService.insertComment(commentDto);
		
		return "redirect:/community/board/boardDetail?freeNo="+freeNo;
	}
	
	/*	@RequestMapping(value="/board/commentDelete", produces="application/json; charset=UTF-8")
		@ResponseBody
		public void commentDelete(int commentNo) {
			commentService.deleteComment(commentNo);
		}*/
	
	@PostMapping("/board/commentDelete")
	public String commentDelete(
			@RequestParam("freeNo") int freeNo,
			@RequestParam("commentNo") int commentNo) {
		commentService.deleteComment(commentNo);
		log.info("commentDelete 실행, commentNo: "+commentNo);
		return "redirect:/community/board/boardDetail?freeNo="+freeNo;
	}
	
	//수정 하고 수정버튼 눌렀을 때
	@PostMapping("/board/updateComment")
	public String updateContent(
			@RequestParam("freeNo") int freeNo,
			@RequestParam("commentContent") String commentContent,
			@RequestParam("commentNo") int commentNo) {
		CommentDto commentDto = new CommentDto();
		commentDto.setCommentContent(commentContent);
		commentDto.setCommentNo(commentNo);
		commentService.updateComment(commentDto);
		return "redirect:/community/board/boardDetail?freeNo="+freeNo;
	}
	
	//댓글 수정 html 조각 가져오기
	@PostMapping("/board/updateContent")
	public String updateContent(String commentContent, int commentNo, String userNickname, int freeNo, Model model) {
		model.addAttribute("commentContent", commentContent);
		model.addAttribute("commentNo", commentNo);
		model.addAttribute("userNickname", userNickname);
		model.addAttribute("freeNo", freeNo);
		return "/community/board/commentModify";
	}
	
	//답글달기 버튼 클릭했을 때 -> 조각 html 리턴
	@PostMapping("/board/bringReplyForm")
	public String bringReplyForm(int upperNo, String userId, int commentDepth, int freeNo, Model model) {
		//1. 닉네임 얻기
		String userNickname = userService.getNickname(userId);
		
		model.addAttribute("sessionUserNickname", userNickname);
		model.addAttribute("upperNo", upperNo);
		model.addAttribute("userId", userId);
		model.addAttribute("commentDepth", commentDepth);
		model.addAttribute("freeNo", freeNo);

		return "/community/board/commentReplyForm";
	}
	
	@PostMapping(value = "/board/bringReplyJson", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String bringReplyJson(int upperNo, String userId, int commentDepth, int freeNo, Model model) {
		
		//1. 닉네임 얻기
		String userNickname = userService.getNickname(userId);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("sessionUserNickname", userNickname);
		jsonObject.put("upperNo", upperNo);
		jsonObject.put("userId", userId);
		jsonObject.put("commentDepth", commentDepth);
		jsonObject.put("freeNo", freeNo);

		jsonObject.put("result", "success");
		
		String json = jsonObject.toString();
		return json; 
	}
	
	
	@PostMapping("/board/registReply")
	public String replyComment(
			@RequestParam("upperNo") int upperNo,
			@RequestParam("freeNo") int freeNo,
			@RequestParam("commentContent") String commentContent,
			@RequestParam("sessionUserId") String sessionUserId,
			@RequestParam("commentDepth") int commentDepth){
		
		//댓글 등록 시간
		Date utilDate = new Date();
		long timeInMilliSeconds = utilDate.getTime();
		java.sql.Date sqlDate = new java.sql.Date(timeInMilliSeconds);
		
		CommentDto commentDto = new CommentDto();
		commentDto.setUpperNo(upperNo);
		commentDto.setFreeNo(freeNo);
		commentDto.setCommentContent(commentContent);
		commentDto.setCommentWriter(sessionUserId);
		commentDto.setCommentDepth(commentDepth+1);
		commentDto.setCommentModifyDate(sqlDate);
		commentDto.setCommentRegistDate(sqlDate);

		
		int commentNo = commentService.insertReplyComment(commentDto);
		commentDto.setCommentNo(commentNo);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("commentDto", commentDto);
		
		String json = jsonObject.toString();
		log.info(json.toString());
		
		return "json";
	}


	// 거래게시판 - market -------------------------------------------------------------------------------------------------------
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

	// 공지게시판 - list ---------------------------------------------------------------------------------------------------------
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
