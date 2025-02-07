package com.mycompany.webapp.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dto.CommentDto;
import com.mycompany.webapp.dto.FreeBoardDto;
import com.mycompany.webapp.dto.LikeListDto;
import com.mycompany.webapp.dto.MarketAlignDto;
import com.mycompany.webapp.dto.MarketBoardDto;
import com.mycompany.webapp.dto.MarketFileDto;
import com.mycompany.webapp.dto.MarketPagerDto;
import com.mycompany.webapp.dto.NoticeBoardDto;
import com.mycompany.webapp.dto.PagerDto;
import com.mycompany.webapp.security.UserCustom;
import com.mycompany.webapp.service.CommentService;
import com.mycompany.webapp.service.FreeBoardService;
import com.mycompany.webapp.service.MarketBoardService;
import com.mycompany.webapp.service.NoticeService;
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
	private CommentService CommentService;
	@Resource
	private MarketBoardService marketBoardService;
	@Resource
	private TakeService takeService; //insertlikeLists 사용하기 위해 Resource
	@Resource
	private NoticeService noticeService;

	// 자유게시판 - board -------------------------------------------------------------------------------------------------------------------
	@GetMapping("/board/list")
	public String boardList(@RequestParam(value="pageNo", defaultValue = "1") int pageNo,  Model model, HttpServletRequest request) { //페이지는 1페이지부터 넘어오기!
		
		String searchType = (String) request.getParameter("searchType");
		String searchContent = (String) request.getParameter("searchContent");
		
		//Board 게시물 개수 가져오기
		int totalBoardNum = freeBoardService.getTotalFreeBoardNum(); // 전체 개수 가져오기
		PagerDto pager = new PagerDto(10, 10, totalBoardNum, pageNo);
		
		if(searchType != null) {
			pager.setSearchType(searchType);
		}
		if(searchContent != null) {
			pager.setSearchContent(searchContent);
		}
		
		model.addAttribute("pager", pager);
		
		//페이지 정보
		List<FreeBoardDto> freeboards = freeBoardService.getFreeBoards(pager);
		model.addAttribute("freeboards", freeboards);
		model.addAttribute("searchType", pager.getSearchType());
		model.addAttribute("searchContent", pager.getSearchContent());
		model.addAttribute("totalBoardNum", totalBoardNum);
		return "/community/board/list";
	}

	// board/list에서 글쓰기 버튼 눌렀을 때
	@GetMapping("/board/insert")
	public String boardInsertBtn(HttpSession session) {
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		}else {
			return "/community/board/insert";
		}
	}

	// 글쓰기 등록 버튼
	@PostMapping("/board/insertContent")
	public String insertContent(@RequestParam("title") String title, @RequestParam("content") String content, HttpSession session) {
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

		//조회수 먼저 올리기!
		freeBoardService.setupdateHitCount(freeNo);
		
 		//freeBoardDto 내용 model에 싣기
		FreeBoardDto freeBoardDto = freeBoardService.getFreeBoard(freeNo);
		model.addAttribute("freeBoardDto", freeBoardDto);
		
		//게시물 내용 개행 처리
		String tempContent = freeBoardDto.getFreeContent();
		tempContent = org.springframework.web.util.HtmlUtils.htmlEscape(tempContent);
		tempContent = tempContent.replaceAll("\n", "<br/>");
		freeBoardDto.setFreeContent(tempContent);
		
		//현재 로그인한 사용자 id model에 싣기
		String SessionUserid = (String) session.getAttribute("sessionUserId");
		model.addAttribute("seesionUserid", SessionUserid);		
		
		if(SessionUserid!=null) {
			//현재 로그인한 사용자 닉네임 댓글에 보여주기
			String nickname = userService.getNickname(SessionUserid);
			model.addAttribute("sessionUserNickname", nickname);
			model.addAttribute("from", request.getParameter("from"));
			model.addAttribute("pageNo", request.getParameter("pageNo"));			
		}

		
		//등록된 댓글 보여주기----------------------------
		//댓글 개수 가져오기
		int totalCommentNum = CommentService.totalCountwhenFreeNo(freeNo);
		PagerDto pager = new PagerDto(50,10,totalCommentNum,1);
		pager.setFreeNo(freeNo);
		model.addAttribute("pager",pager); //jsp에서 페이지 만들 때 사용하려고 model로 보내줌.
		
		//페이지 정보
		List<CommentDto> comments = CommentService.getselectByFreeNo(pager);
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
	public String boardUpdate(int freeNo, Model model, HttpServletRequest request) {
		String mypage = (String) request.getParameter("from");
		log.info(mypage);
		FreeBoardDto freeBoardDto = freeBoardService.getFreeBoard(freeNo);
		if(mypage != null) {
			model.addAttribute("from", mypage);
		} 
		model.addAttribute("freeBoardDto", freeBoardDto);
		return "/community/board/update";
	}
	
	@PostMapping("/board/updateForm")
	public String boardUpdateFrom(@RequestParam("title") String title, @RequestParam("content") String content, @RequestParam("freeNo") int freeNo, @RequestParam("from") String mypage) {

		//먼저 저장되 있던 정보 불러오기
		FreeBoardDto freeBoardDto = freeBoardService.getFreeBoard(freeNo);
		freeBoardDto.setFreeTitle(title);
		freeBoardDto.setFreeContent(content);
		
		log.info(mypage);
		
		freeBoardService.updateFreeBoard(freeBoardDto);
		if(mypage != null) {
			return "redirect:/community/board/boardDetail?freeNo="+freeBoardDto.getFreeNo()+"&from=mypage";
		} else {
			return "redirect:/community/board/boardDetail?freeNo="+freeBoardDto.getFreeNo();	
		}
	}
	
	// 댓글 ---------------------------------------------------------------------------------------------------------------------------------------------
	@PostMapping("/board/insertComment")
	public String insertComment(int freeNo, @RequestParam("commentContent") String commentContent, HttpSession session) {
		String SessionUserid = (String) session.getAttribute("sessionUserId");

		CommentDto commentDto = new CommentDto();
		commentDto.setCommentContent(commentContent);
		commentDto.setFreeNo(freeNo);
		commentDto.setCommentWriter(SessionUserid);
		
		CommentService.insertComment(commentDto);
		
		return "redirect:/community/board/boardDetail?freeNo="+freeNo;
	}

	@PostMapping("/board/commentDelete")
	public String commentDelete(CommentDto commentDto) {
		CommentService.deleteComment(commentDto);
		return "redirect:/community/board/boardDetail?freeNo="+commentDto.getFreeNo();
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
	public String updateContent(@RequestParam("freeNo") int freeNo, @RequestParam("commentContent") String commentContent, @RequestParam("commentNo") int commentNo) {
		CommentDto commentDto = new CommentDto();
		commentContent = org.springframework.web.util.HtmlUtils.htmlEscape(commentContent);
		commentContent = commentContent.replaceAll("<br/>", "\n");
		commentDto.setCommentContent(commentContent);
		commentDto.setCommentNo(commentNo);
		CommentService.updateComment(commentDto);
		
		return "redirect:/community/board/boardDetail?freeNo="+freeNo;
	}
	
	@PostMapping(value = "/board/bringReplyJson", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String bringReplyJson(int upperNo, String userId, int commentDepth, int freeNo, HttpSession session) {
		
		//1. 닉네임 얻기
		String userNickname = userService.getNickname(userId);

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
	public String replyComment(@RequestParam("upperNo") int upperNo, @RequestParam("freeNo") int freeNo, @RequestParam("commentContext") String commentContent, @RequestParam("userId") String sessionUserId, @RequestParam("commentDepth") int commentDepth){
		
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

		int commentNo = CommentService.insertReplyComment(commentDto);
		commentDto.setCommentNo(commentNo);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("commentDto", commentDto);
		
		String json = jsonObject.toString();
		
		return json;
	}


	// 거래게시판 - market ---------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping("/market/list")
	public String marketList(Model model, HttpServletRequest request) {
		
		//가져온 marketAlign 정보 담아주기
		MarketAlignDto marketAlign = new MarketAlignDto();
		marketAlign.setAlign(request.getParameter("align")==null?"":request.getParameter("align"));
		marketAlign.setCategory(request.getParameter("category")==null?"":request.getParameter("category"));
		marketAlign.setSearchContent(request.getParameter("searchContent")==null?"":request.getParameter("searchContent"));
		marketAlign.setSearchType(request.getParameter("searchType")==null?"":request.getParameter("searchType"));
		
		log.info("ccc: " +marketAlign.getCategory());
		
		if(marketAlign.getCategory().equals("0")) {
			marketAlign.setCategory("");
		}
		
		if(marketAlign.getAlign().equals("a0")) {
			marketAlign.setAlign("");
		}
		
		//가져온 정보 토대로 전체 개수
		int totalBoardNum = marketBoardService.getTotalMarketBoardCount(marketAlign); // 전체 개수 가져오기
		log.info("tt : " + totalBoardNum);
		
		int pageNo = 1;
		
		log.info("r : " + request.getParameter("pageNo"));
		
		
		if(request.getParameter("pageNo") != null) {
			if(!request.getParameter("pageNo").equals("")) {
				pageNo = Integer.parseInt(request.getParameter("pageNo"));
			}
		}
		
		//pager 만들어주기
		MarketPagerDto pager = new MarketPagerDto(8, 10, totalBoardNum, pageNo);
		if(marketAlign != null) {
			pager.setAlign(marketAlign.getAlign());
			pager.setCategory(marketAlign.getCategory());
			pager.setSearchContent(marketAlign.getSearchContent());
			pager.setSearchType(marketAlign.getSearchType());
		}
		
		//market 게시물 개수 가져오기
		model.addAttribute("pager", pager);
		
		log.info("pn : " + pageNo);

		//페이지 정보
		List<MarketBoardDto> marketboards = marketBoardService.getMarketBoards(pager);
		log.info("-------------------");
		log.info(marketboards);
		model.addAttribute("marketBoards", marketboards);
		
		//페이지 정보 가져가기
		model.addAttribute("pageNo", pageNo);
		
		return "/community/market/list";
	}
	
	//리스트에서 대표사진 보여줌, 리스트의 index에 해당하는 사진 불러와줌
	@RequestMapping("/market/getMarketImage")
	public void getMarketImage(HttpServletResponse res, int marketNo, String img) throws IOException {
		List<MarketFileDto> files = marketBoardService.selectImageFileByMarketNo(marketNo);
		int num = Integer.parseInt(img);
		byte[] temp = files.get(num).getImageFileData();
		InputStream is = new ByteArrayInputStream(temp);
		IOUtils.copy(is, res.getOutputStream());
   	    
	}
	
	//view페이지에서 하트 개수 불러옴.
   @RequestMapping(value="/market/checkLike", produces = "application/json; charset=UTF-8")
   @ResponseBody
   public String checkLike(String id, String type, String marketNo) {
	   LikeListDto lld = new LikeListDto();
	   
	   lld.setLikeListNo(Integer.parseInt(marketNo));
	   lld.setLikeType(type);
	   lld.setLikeUserId(id);
	   
	   String json;
	   JSONObject jsonObject = new JSONObject();
	   int check = takeService.selectLikeListByBuildingNo(lld);
	   
	   if(check == 1) {
		   jsonObject.put("likeCheck", "like");
	   }else {
		   jsonObject.put("likeCheck", "noLike");
	   }
	   json = jsonObject.toString();
	   return json;
   }
   
	
   //하트 누르거나 취소했을 때 수정됨. 
   @RequestMapping(value="/market/setLikeLists", produces = "application/json; charset=UTF-8")
   @ResponseBody
   public void setLikeLists(String check, String id, String type, int marketNo, String likeCnt) {
	   LikeListDto lld = new LikeListDto();
	   
	   lld.setLikeListNo(marketNo);
	   lld.setLikeType(type);
	   lld.setLikeUserId(id);
	   
	   MarketBoardDto mdt = new MarketBoardDto();
	   mdt.setMarketLikeCount(Integer.parseInt(likeCnt));
	   mdt.setMarketNo(marketNo);
	   
	   //누르지 않은 상태일 경우
	   if(check.equals("before")) {
		   takeService.insertLikeLists(lld);
		   marketBoardService.updateLikeCount(marketNo); //좋아요 수 업데이트
		   
	   }else { //클릭한 것을 취소할 경우
		   takeService.deleteLikeLists(lld);
		   marketBoardService.updateLikeCountDown(marketNo); //좋아요 수 업데이트
	   }
   }

	// 게시판 상세 페이지
	@RequestMapping("/market/marketDetail")
	public String marketDetail(
			HttpSession session, 
			int marketNo, 
			Model model,
			@RequestParam(value="pageNo", required=false) String pageNo,
			@RequestParam(value="category", required=false) String category,
			@RequestParam(value="align", required=false) String align,
			@RequestParam(value="searchContent", required=false) String searchContent,
			@RequestParam(value="searchType", required=false) String searchType) {	

		//조회수 증가
		marketBoardService.setUpdateHitCount(marketNo);
		
		//marketBoardDto 내용 가져오기
		MarketBoardDto marketBoardDto = marketBoardService.getMarketBoard(marketNo); 
		
		//게시물 내용 개행 처리 
		String tempContent = marketBoardDto.getMarketContent();
		tempContent = org.springframework.web.util.HtmlUtils.htmlEscape(tempContent);
		tempContent = tempContent.replaceAll("<br/>", "\n");
		marketBoardDto.setMarketContent(tempContent);
		
		//가격에 , 처리
		String price = marketBoardDto.getMarketPrice();
		DecimalFormat formatter = new DecimalFormat("###,###");
		price = formatter.format(Long.parseLong(price));
		marketBoardDto.setMarketPrice(price);
		
		//marketBoardDto 내용 model에 싣기
		model.addAttribute("marketBoardDto", marketBoardDto);
		model.addAttribute("pageNo",pageNo);
		
		log.info("dpn : " + pageNo);
		log.info("mn : " + marketNo);
		
		//marketFileDto 내용 model에 싣기
		List<MarketFileDto> marketFileList = marketBoardService.selectImageFileByMarketNo(marketNo);
		model.addAttribute("marketFileList", marketFileList);
		
		//현재 로그인한 사용자 id model에 싣기
		String SessionUserid = (String) session.getAttribute("sessionUserId");
		model.addAttribute("sessionUserId", SessionUserid);
		
		//카테고리, 인기순, 검색내용 model에 싣기
		model.addAttribute("category", category);
		model.addAttribute("align", align);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchContent", searchContent);

		return "/community/market/view";
	}
	
	

	//게시판 목록에서 글쓰기 버튼 눌렀을 때
	@RequestMapping("/market/gotoInsert")
	public String marketInsert(HttpSession session) {
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			return "/community/market/insert";			
		}
	}
	
	@GetMapping("/market/update")
	public String marketUpdate(int marketNo, Model model) {
		//수정 할 마켓 정보 가져오기
		MarketBoardDto marketBoardDto = marketBoardService.getMarketBoard(marketNo);
		List<MarketFileDto> marketFiles = marketBoardService.selectImageFileByMarketNo(marketNo);
		
		//가져온 데이터 model에 넣어서 jsp에서 활용
		model.addAttribute("marketBoardDto", marketBoardDto);
		model.addAttribute("marketFiles", marketFiles);
		model.addAttribute("marketFilesSize", marketFiles.size());
		
		return "/community/market/update";
	}

	//바이트배열을 파일로 만들어서 출력해줌!
	@RequestMapping("/market/getImageByteArrayToFile")
	public void getImageByteArrayToFile(HttpServletResponse res, int marketNo, int img, 
			@RequestHeader("User-Agent") String userAgent) throws IOException {
		List<MarketFileDto> marketFiles = marketBoardService.selectImageFileByMarketNo(marketNo);
		
		//img는 marketFiles의 index이다.
		
		String contentType = marketFiles.get(img).getAttachType();
		String originalFilename = marketFiles.get(img).getAttachOriginalName();
		
		res.setContentType(contentType);
		
		//다운로드할 파일명을 헤더에 추가
		if(userAgent.contains("Trident") || userAgent.contains("MSIE")) {
			//IE 브라우저일 경우
			originalFilename = URLEncoder.encode(originalFilename, "UTF-8");
		} else {
			//크롬, 엣지, 사파리일 경우
			originalFilename = new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1");
		}
		res.setHeader("Content-Disposition", "attachment; filename=\"" + originalFilename + "\"");
		
		FileCopyUtils.copy(new ByteArrayInputStream(marketFiles.get(img).getImageFileData()), res.getOutputStream());		
	}
	
	@RequestMapping("/market/view")
	public String marketView() {
		return "/community/market/view";
	}

	@GetMapping("/market/marketViewtoList")
	public String marketViewToList(int marketNo) {
		return "redirect:/community/market/list";
	}

	// 글쓰기 등록 버튼
	@PostMapping("/market/insertMarketContent")
	public String insertMarketContent(HttpServletRequest request,
    		HttpSession session,
    		@RequestPart("attach_file") List<MultipartFile> files,
 		    Model model) throws IOException {
		
	   String userId = (String)session.getAttribute("sessionUserId");
	   String category = request.getParameter("category");
	   
	   MarketBoardDto marketBoardDto = new MarketBoardDto();
	   marketBoardDto.setMarketCategory(category);
	   marketBoardDto.setMarketContent(request.getParameter("content"));
	   marketBoardDto.setMarketPrice(request.getParameter("price"));
	   marketBoardDto.setMarketTitle(request.getParameter("title"));
	   marketBoardDto.setMarketWriter(userId);
	   
	    int cnt = marketBoardService.insertMarket(marketBoardDto);
	    
	    //첨부파일 추가
	    if(cnt > 0) {
	       if(files.size() != 0) {
	          for(MultipartFile m : files) {
	             String saveFilename = new Date().getTime()+"-"+m.getOriginalFilename();

	             MarketFileDto marketFileDto = new MarketFileDto();
	             marketFileDto.setAttachOriginalName(m.getOriginalFilename());            
	             marketFileDto.setAttachSaveName(saveFilename);
	             marketFileDto.setAttachType(m.getContentType());
	             marketFileDto.setImageFileData(m.getBytes());
	             marketFileDto.setMarketNo(marketBoardDto.getMarketNo());
	             marketBoardService.insertMarketFile(marketFileDto);
	             
	          }
	       }   
	    }
	   return "redirect:/community/market/list";
	}
	
	// 글쓰기 수정 버튼
    @RequestMapping("/market/updateMarketContent")
    @ResponseBody
	public String updateMarketContent(HttpServletRequest request,
			@RequestPart(value="attach_file", required=false) List<MultipartFile> files,
 		    @RequestParam(value="deleteDBImgBySeq") String deleteDb) throws IOException {
	   
	   		String result ="판매 상품이 수정되었습니다.";
		
		   String category = request.getParameter("category");
		   int marketNo = Integer.parseInt(request.getParameter("marketNo"));
		   MarketBoardDto marketBoardDto = new MarketBoardDto();
		   marketBoardDto.setMarketCategory(category);
		   marketBoardDto.setMarketNo(marketNo);
		   marketBoardDto.setMarketTitle(request.getParameter("title"));
		   marketBoardDto.setMarketPrice(request.getParameter("price"));
		   marketBoardDto.setMarketContent(request.getParameter("content"));
		   
		   String[] deleteImgNoList = deleteDb.split(",");
		   log.info("deleteDb"+deleteDb);
		   log.info("deleteImgNoList: " + deleteImgNoList.length);
		   	   
		   if((!deleteDb.equals(""))) {
			   for(String deleteImgNo : deleteImgNoList) {
				   log.info("deleteImgNoList요소: "+deleteImgNo);
				   int imgNo = Integer.parseInt(deleteImgNo);
				   marketBoardService.deleteImageByFileNo(imgNo);
			   }
		   }

		   //수정내용 업데이트(아직 파일은 업데이트 되지 않음.)
		   marketBoardService.updateMarketBoard(marketBoardDto);
		   
			//첨부파일 추가
			if(files != null) {
			   for(MultipartFile m : files) {
			      String saveFilename = new Date().getTime()+"-"+m.getOriginalFilename();
			
			      MarketFileDto marketFileDto = new MarketFileDto();
			      marketFileDto.setAttachOriginalName(m.getOriginalFilename());            
			      marketFileDto.setAttachSaveName(saveFilename);
			      marketFileDto.setAttachType(m.getContentType());
			      marketFileDto.setImageFileData(m.getBytes());
			      marketFileDto.setMarketNo(marketNo);
			      
			      //DB marketFiles에 file 추가
			      marketBoardService.insertMarketFile(marketFileDto);
			   }
			}
		return result;
	}

	// 글쓰기 취소 버튼
    @RequestMapping("/market/marketInsertCancle")
    public String marketInsertCancle() {
       return "redirect:/community/market/list";
    }
    
	//글 삭제 버튼 
	@GetMapping(value="/market/deleteMarketBaord", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String deleteMarketBaord(int marketNo) {
		//cascade 설정으로 market에서 글 지우면 첨부파일도 같이 없어짐!
		marketBoardService.deleteMarketBoardByMarketNo(marketNo);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString(); //json 얻는 방법.
		
		return json;
	}
	
	//판매완료
	@GetMapping(value="/market/updateSaleYn", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String updateSaleYn(int marketNo) {
		marketBoardService.updateSaleYn(marketNo);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString(); //json 얻는 방법.
		
		return json;
	}
 
	// 공지게시판 - list ---------------------------------------------------------------------------------------------------------
	@GetMapping("/notice/list")
	//@mypageLoginCheck
	public String noticeList(@RequestParam(value="pageNo", defaultValue = "1") int pageNo, Model model, HttpSession session) { //페이지는 1페이지부터 넘어오기!
		
		//Notice 게시판 게시물 개수 가져오기
		int totalBoardNum = noticeService.totalCount();
		PagerDto pager = new PagerDto(10, 10, totalBoardNum, pageNo);
		model.addAttribute("pager", pager);
		if(session.getAttribute("sessionUserId") != null) {
			model.addAttribute("sessionMid", session.getAttribute("sessionUserId").toString());
		}		
		
		//페이지 정보
		List<NoticeBoardDto> noticeboards = noticeService.getNoticeBoardByPage(pager);
		model.addAttribute("noticeboards", noticeboards);
		
		return "/community/notice/list";
	}

	// 공지 상세 페이지
	@GetMapping("/notice/noticeDetail")
	public String noticeDetail(int noticeNo, Model model, HttpSession session) {
		
		//조회수 1 올리기
		noticeService.updateHitCount(noticeNo);
		
		//noticeBoardDto 내용 DB에서 가져오기
		NoticeBoardDto noticeBoardDto = noticeService.getNoticeBoardByNoticeNo(noticeNo);
		
		//게시물 내용 개행 처리
		String tempContent = noticeBoardDto.getNoticeContent();
		tempContent = org.springframework.web.util.HtmlUtils.htmlEscape(tempContent);
		tempContent = tempContent.replaceAll("\n", "<br/>");
		noticeBoardDto.setNoticeContent(tempContent);
		
		//noticeBoardDto 내용 model에 싣기
		model.addAttribute("noticeboard", noticeBoardDto);
		if(session.getAttribute("sessionUserId") != null) {
			model.addAttribute("sessionMid", session.getAttribute("sessionUserId").toString());
		}		
		
		return "/community/notice/view";
	}
	
	//목록에서 글쓰기 페이지로 이동
	@GetMapping("/notice/insert")
	public String noticeInsert(Authentication authentication) {
		String userId;
		
		//인증 객체의 존재 여부 확인 >> 존재하지 않을 경우 로그인폼으로 이동
		if(authentication != null) {
			UserCustom userCustom = (UserCustom)authentication.getPrincipal();
			userId = userCustom.getUsername();
		}else {	
			userId = null;
			return "redirect:/index/loginForm";
		}
		return "/community/notice/insert";
	}

	@RequestMapping("/notice/update")
	public String noticeUpdate(int noticeNo, HttpSession session, HttpServletRequest request, Model model) {
		NoticeBoardDto noticeBoardDto = noticeService.getNoticeBoardByNoticeNo(noticeNo);
		
		//noticeBoardDto 내용 model에 싣기
		model.addAttribute("noticeboard", noticeBoardDto);
		model.addAttribute("sessionMid", session.getAttribute("sessionUserId").toString());
		model.addAttribute("referer", request.getHeader("Referer"));
		return "/community/notice/update";
	}
	
	@RequestMapping("/notice/updateSave")
	public String updateSave(NoticeBoardDto notice, String referer) {
		noticeService.updateNoticeBoard(notice);
		return "redirect:"+referer;
	}

	// 글쓰기 등록 버튼
	@PostMapping("/notice/insertNoticeContent")
	public String insertNoticeContent(HttpServletRequest request,
    		@RequestPart(value="attach_file", required=false) List<MultipartFile> files,
 		    Authentication authentication) {
		
		//인증 객체 생성해 아이디 가져옴
		String userId;
		UserCustom userCustom = (UserCustom)authentication.getPrincipal();
		userId = userCustom.getUsername();

		NoticeBoardDto noticeBoardDto = new NoticeBoardDto();
		noticeBoardDto.setNoticeTitle(request.getParameter("title"));
		noticeBoardDto.setNoticeContent(request.getParameter("content"));
		noticeBoardDto.setNoticeWriter(userId);
		
		noticeService.noticeBoardInsert(noticeBoardDto);

		return "redirect:/community/notice/list";
	}

	// 글쓰기 취소 버튼
	@RequestMapping("/notice/insertNoticeCancle")
	public String insertNoticeCancle() {
		return "redirect:/community/notice/list";
	}
	
	@RequestMapping("/notice/deleteNoticeBoard")
	@ResponseBody
	public String deleteNoticeBoard(int noticeNo) {
		noticeService.deleteNoticeBoard(noticeNo);
		return "success";
	}	
}