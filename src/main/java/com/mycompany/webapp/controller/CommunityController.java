package com.mycompany.webapp.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dao.MarketBoardDao;
import com.mycompany.webapp.dto.BuildingDto;
import com.mycompany.webapp.dto.BuildingFileDto;
import com.mycompany.webapp.dto.CommentDto;
import com.mycompany.webapp.dto.FreeBoardDto;
import com.mycompany.webapp.dto.LikeListDto;
import com.mycompany.webapp.dto.MarketBoardDto;
import com.mycompany.webapp.dto.MarketFileDto;
import com.mycompany.webapp.dto.PagerDto;
import com.mycompany.webapp.service.CommentService;
import com.mycompany.webapp.service.FreeBoardService;
import com.mycompany.webapp.service.MarketBoardService;
import com.mycompany.webapp.service.TakeService;
import com.mycompany.webapp.service.UserService;

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
	@Resource
	private MarketBoardService marketBoardService;
	@Resource
	private TakeService takeService; //insertlikeLists 사용하기 위해 Resource


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
	@PostMapping("/board/insertContent")
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
		
		log.info(session.getAttribute("sessionUserId"));
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		}

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
	
	// 댓글 ---------------------------------------------------------------------------------------------------------------------------------------------
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

	@PostMapping("/board/commentDelete")
	public String commentDelete(
			@RequestParam("freeNo") int freeNo,
			@RequestParam("commentNo") int commentNo) {
		commentService.deleteComment(commentNo);
		log.info("commentDelete 실행, commentNo: "+commentNo);
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
	
	@PostMapping(value = "/board/bringReplyJson", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String bringReplyJson(int upperNo, String userId, int commentDepth, int freeNo, Model model, HttpServletRequest request, HttpSession session) {
		
		//1. 닉네임 얻기
		String userNickname = userService.getNickname(userId);
		
		log.info("@@@@@@@@@@@@@@@@@@@@ " + request.getParameter("upperNo"));
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("sessionUserNickname", userNickname);
		jsonObject.put("upperNo", upperNo);
		jsonObject.put("userId", userId);
		jsonObject.put("commentDepth", commentDepth);
		jsonObject.put("freeNo", freeNo);
		
		session.setAttribute("upperNo", upperNo);
		
		
		String json = jsonObject.toString();
		return json; 
	}
	
	
	@PostMapping(value="/board/registReply", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String replyComment(
			@RequestParam("upperNo") int upperNo,
			@RequestParam("freeNo") int freeNo,
			@RequestParam("commentContext") String commentContent,
			@RequestParam("userId") String sessionUserId,
			@RequestParam("commentDepth") int commentDepth, HttpSession session){
		
		log.info("/board/registReply");
		
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
		log.info(commentNo + "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
		commentDto.setCommentNo(commentNo);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("commentDto", commentDto);
		
		String json = jsonObject.toString();
		log.info(json.toString());
		
		return "json";
	}


	// 거래게시판 - market ---------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping("/market/list")
	public String marketList(@RequestParam(defaultValue = "1") int pageNo,  Model model, HttpSession session) {
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		}

		log.info("실행");
		//market 게시물 개수 가져오기
		int totalBoardNum = marketBoardService.getTotalMarketBoardCount(); // 전체 개수 가져오기
		PagerDto pager = new PagerDto(16, 10, totalBoardNum, pageNo);
		model.addAttribute("pager", pager);
		
		//페이지 정보
		List<MarketBoardDto> marketboards = marketBoardService.getMarketBoards(pager);
		model.addAttribute("marketBoards", marketboards);
		log.info("marketList페이지");
		
		//사용자 정보
		model.addAttribute("sessionUserId", session.getAttribute("sessionUserId"));
		
		return "/community/market/list";
	}
	
	//리스트에서 대표사진 보여줌
	@RequestMapping("/market/getMarketImage")
	public void getMarketImage(HttpServletRequest req, HttpServletResponse res, int marketNo, String img) throws IOException {
		List<MarketFileDto> files = marketBoardService.selectImageFileByMarketNo(marketNo);
   	    	
		int num = Integer.parseInt(img);
		byte[] temp = files.get(num).getImageFileData();
		InputStream is = new ByteArrayInputStream(temp);
		IOUtils.copy(is, res.getOutputStream());
   	    
	}
	
   @RequestMapping(value="/market/setLikeLists", produces = "application/json; charset=UTF-8")
   @ResponseBody
   public String setLikeLists(String check, String id, String type, int marketNo, String likeCnt) {
	   log.info("type : " + type);
	   log.info("id : " + id);
	   log.info("marketNo : " + marketNo);
	   LikeListDto lld = new LikeListDto();
	   
	   lld.setLikeListNo(marketNo);
	   lld.setLikeType(type);
	   lld.setLikeUserId(id);
	   
	   //누르지 않은 상태일 경우
	   if(check.equals("before")) {
		   takeService.insertLikeLists(lld);
	   }else { //클릭한 것을 취소할 경우
		   takeService.deleteLikeLists(lld);
	   }
			   
	   MarketBoardDto mdt = new MarketBoardDto();
	   mdt.setMarketLikeCount(Integer.parseInt(likeCnt));
	   mdt.setMarketNo(marketNo);

	   //좋아요 수 업데이트
	   marketBoardService.updateLikeCount(mdt);
			   
	   String json;
	   JSONObject jsonObject = new JSONObject();
	   
	   json = jsonObject.toString();
	   return json;
   }

	// 게시판 상세 페이지
	@GetMapping("/market/marketDetail")
	public String marketDetail(HttpSession session, int marketNo, Model model) {	
		log.info(session.getAttribute("sessionUserId"));
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		}

		//조회수 증가
		marketBoardService.setUpdateHitCount(marketNo);
		
		//marketBoardDto 내용 가져오기
		MarketBoardDto marketBoardDto = marketBoardService.getMarketBoard(marketNo); 
		log.info(marketBoardDto.toString());
		
		//게시물 내용 개행 처리 
		String tempContent = marketBoardDto.getMarketContent();
		tempContent = org.springframework.web.util.HtmlUtils.htmlEscape(tempContent);
		tempContent = tempContent.replaceAll("\n", "<br/>");
		marketBoardDto.setMarketContent(tempContent);
		
		//가격에 , 처리
		String price = marketBoardDto.getMarketPrice();
		DecimalFormat formatter = new DecimalFormat("###,###");
		price = formatter.format(Integer.parseInt(price));
		marketBoardDto.setMarketPrice(price);
		
		//marketBoardDto 내용 model에 싣기
		model.addAttribute("marketBoardDto", marketBoardDto);
		
		//marketFileDto 내용 model에 싣기
		List<MarketFileDto> marketFileList = marketBoardService.selectImageFileByMarketNo(marketNo);
		model.addAttribute("marketFileList", marketFileList);
		
		//현재 로그인한 사용자 id 얻기
		
		
		return "/community/market/view";
	}

	//게시판 목록에서 글쓰기 버튼 눌렀을 때
	@RequestMapping("/market/gotoInsert")
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
	public String insertMarketContent(HttpServletRequest request,
    		HttpSession session,
    		@RequestPart("attach_file") List<MultipartFile> files,
 		    Model model) throws IOException {
		
	   log.info("/market/insertMarketContent 실행");
	   log.info("id : " + session.getAttribute("sessionUserId"));
	   String userId = (String)session.getAttribute("sessionUserId");
	   String category = request.getParameter("category");
	   
	   MarketBoardDto marketBoardDto = new MarketBoardDto();
	   marketBoardDto.setMarketCategory(category);
	   marketBoardDto.setMarketContent(request.getParameter("content"));
	   marketBoardDto.setMarketPrice(request.getParameter("price"));
	   marketBoardDto.setMarketTitle(request.getParameter("title"));
	   marketBoardDto.setMarketWriter(userId);
	   
	   int marketNo = marketBoardService.insertMarket(marketBoardDto);
	   log.info("---------marketNo-----------------" + marketNo);
	   //첨부파일 추가
	   if(files.size() != 0) {
		   for(MultipartFile m : files) {
			   String saveFilename = new Date().getTime()+"-"+m.getOriginalFilename();

			   MarketFileDto marketFileDto = new MarketFileDto();
			   marketFileDto.setAttachOriginalName(m.getOriginalFilename());			   
			   marketFileDto.setAttachSaveName(saveFilename);
			   marketFileDto.setAttachType(m.getContentType());
			   marketFileDto.setMarketNo(marketNo);
			   marketFileDto.setImageFileData(m.getBytes());
			   
			   marketBoardService.insertMarketFile(marketFileDto);
		   }
	   }
	   return "redirect:/community/market/list";
	}
	
	// 글쓰기 취소 버튼
    @RequestMapping("/market/marketInsertCancle")
    public String marketInsertCancle() {
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
