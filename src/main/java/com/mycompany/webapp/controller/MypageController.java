package com.mycompany.webapp.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.aspect.mypageLoginCheck;
import com.mycompany.webapp.dto.BuildingDto;
import com.mycompany.webapp.dto.BuildingFileDto;
import com.mycompany.webapp.dto.FreeBoardDto;
import com.mycompany.webapp.dto.LikeListDto;
import com.mycompany.webapp.dto.MarketBoardDto;
import com.mycompany.webapp.dto.MarketFileDto;
import com.mycompany.webapp.dto.MessageDto;
import com.mycompany.webapp.dto.PagerDto;
import com.mycompany.webapp.dto.UserDto;
import com.mycompany.webapp.service.MypageService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/mypage")
@Log4j2
public class MypageController {
	
	// MypageService 객체 주입
	@Resource
	private MypageService mypageService;
	
	// modify 매핑
	@RequestMapping("/modify")
	@mypageLoginCheck
	public String modify(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sessionUserId"); // sessionUserId에 값을 userId에 저장
		UserDto user = mypageService.getUser(userId); // userId를 통해 db에 저장되어있는 유저 정보를 얻어온다
		model.addAttribute("user", user); // 검색된 유저정보를 model에 담는다
		return "/mypage/modify"; // mypage/modify로 리턴
	}
	
	// 비밀번호 수정
	@PostMapping(value="/updatepassword", produces="application/json; charset=UTF-8") // json형태로 리턴해주기 위해 produces를 설정
	@ResponseBody // json형태로 리턴해주기 위해 ResponseBody어노테이션 작성
	@mypageLoginCheck
	public String updatePassword(@RequestBody String sendData, HttpSession session, UserDto user, Model model, HttpServletRequest request) {
		String userId = (String) session.getAttribute("sessionUserId");
		JSONObject jjson = new JSONObject(sendData);
		UserDto dbUser = mypageService.getUser(userId);
		
		// ajax의 data로 넘어온 현재 패스워드와, 새롭게 바뀔 패스워드를 pwd, newpwd로 저장
		String pwd = jjson.getString("pwd");
		String newpwd = jjson.getString("newPwd");
		
		JSONObject jsonObject = new JSONObject();
		
		// 패스워드 인코더 사용
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		if(passwordEncoder.matches(pwd, dbUser.getUserPassword())) { // ajax로 넘어온 비밀번호와, db에 저장되어 있는 비밀번호가 일치한다면
			dbUser.setUserPassword(passwordEncoder.encode(newpwd)); // 새로운 비밀번호를 패스워드 인코딩하여 
			mypageService.changePassword(dbUser); // 비밀번호를 변경한다
			jsonObject.put("message", "비밀번호를 변경하였습니다.");
		} else {
			jsonObject.put("message", "비밀번호가 일치하지 않습니다.");
		}
	
		String json = jsonObject.toString();
		return json;
	}
	
	// 마이페이지 본인이 쓴 자유 게시물
	@GetMapping("/myboard/board")
	@mypageLoginCheck
	public String myboardBoard(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, HttpServletRequest request, Model model) {
		String userId = (String) session.getAttribute("sessionUserId");
		int totalCnt = mypageService.getTotalFreeboardCount(userId); // userId로 작성된 자유게시판 게시물의 총 개수를 totalCnt에 저장
		PagerDto pager = new PagerDto(10, 10, totalCnt, pageNo); // 페이징 처리를위한 pager 설정
		pager.setUserId(userId);
		model.addAttribute("pager", pager); // pager를 모델에 담는다
		List<FreeBoardDto> boards = mypageService.getMyFreeBoardList(pager); // pager에 저장된 정보를 바탕으로 자유게시판 게시물을 가져와 List에 담는다
		model.addAttribute("total", totalCnt);
		model.addAttribute("boards", boards);
		return "/mypage/myboard/board";
	}
	
	@PostMapping(value="/myboard/delete", produces = "application/json; charset=UTF-8")
	@ResponseBody
	@mypageLoginCheck
	public String myboardDelete(@RequestBody String arr, HttpServletRequest request, HttpSession session, Model model) throws Exception {
		int cnt = mypageService.deleteMyPosting(arr); // List를 통째로 Service로 넘겨 처리한다
		JSONObject jsonObject = new JSONObject();
		if(cnt > 0) {
			jsonObject.put("message", cnt + "개를 삭제하였습니다.");	
		} else {
			jsonObject.put("message", "게시물 삭제에 실패하였습니다.");
		}
		
		String json = jsonObject.toString();
		return json;
	}
	
	
	// 마이페이지 본인이 쓴 인수/매물
	@RequestMapping("/myboard/building")
	@mypageLoginCheck
	public String myboardBuilding(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, HttpServletRequest request, Model model) {
		LocalDateTime now = LocalDateTime.now();
		
		String userId = (String) session.getAttribute("sessionUserId");
		int totalCnt = mypageService.getTotalBuildingCount(userId); 
		PagerDto pager = new PagerDto(10 , 10, totalCnt, pageNo);
		pager.setUserId(userId);
		model.addAttribute("pager", pager);
		List<BuildingDto> buildings = mypageService.getMyBuildingList(pager);
		
		for(BuildingDto b : buildings) {
			b.setBuildingEndBtn(Date.from(now.atZone(ZoneId.systemDefault()).toInstant()));
		}
		
		model.addAttribute("total", totalCnt);
		model.addAttribute("buildings", buildings);
		return "/mypage/myboard/building";
	}
	
	@PostMapping(value="/mybuilding/delete", produces="application/json; charset=UTF-8")
	@ResponseBody
	@mypageLoginCheck
	public String mybuildingDelete(@RequestBody String arr, HttpServletRequest request, HttpSession session, Model model) throws Exception {
		int cnt = mypageService.deleteMyBuilding(arr);
		JSONObject jsonObject = new JSONObject();
		if(cnt > 0) {
			jsonObject.put("message", cnt + "개를 삭제하였습니다");	
		} else {
			jsonObject.put("message", "게시물 삭제에 실패하였습니다.");
		}
		String json = jsonObject.toString();
		return json;
	}
	
	@PostMapping(value="/mybuilding/prolongDate", produces="application/json; charset=UTF-8")
	@ResponseBody
	@mypageLoginCheck
	public String prolongDate(@RequestBody String buildingNo) {
		int no = Integer.parseInt(buildingNo);
		int cnt = mypageService.prolongEndDate(no);
		JSONObject jsonObject = new JSONObject();
		if(cnt > 0) {
			jsonObject.put("message", "게시종료날짜가 연장되엇습니다.");
			jsonObject.put("status", "success");
		} else {
			jsonObject.put("message", "게시종료날짜가 연장되지 않았습니다.");
			jsonObject.put("status", "fail");
		}
		
		String json = jsonObject.toString();
		return json;
	}
	
	// 마이페이지 본인이 쓴 거래 게시물
	@RequestMapping("/myboard/market")
	@mypageLoginCheck
	public String myboardMarket(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, HttpServletRequest request, Model model) {
		String userId = (String) session.getAttribute("sessionUserId");
		int totalCnt = mypageService.getTotalMarketboardCount(userId);
		log.info(totalCnt);
		PagerDto pager = new PagerDto(6, 10, totalCnt, pageNo);
		pager.setUserId(userId);
		model.addAttribute("pager", pager);
		List<MarketBoardDto> markets = mypageService.getMyMarketBoardList(pager); 
		model.addAttribute("total", totalCnt);
		model.addAttribute("markets", markets);
		return "/mypage/myboard/market";
	}
	
	@PostMapping(value="/mymarket/delete", produces="application/json; charset=UTF-8")
	@ResponseBody
	@mypageLoginCheck
	public String mymarketDelete(@RequestBody String marketNo, HttpServletRequest request, HttpSession session, Model model) throws Exception {
		int cnt = mypageService.deleteMyMarket(Integer.parseInt(marketNo));
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("message", "게시물을 삭제하였습니다");
		String json = jsonObject.toString();
		log.info(json);
		return json;
	}

	@RequestMapping("/getMarketImage")
	public void getMarketImage(HttpServletRequest request, HttpServletResponse response, int marketNo) throws IOException {
		List<MarketFileDto> files = mypageService.selectImageFileByMarketNo(marketNo);
		byte[] temp = files.get(0).getImageFileData();
		InputStream is = new ByteArrayInputStream(temp);
		IOUtils.copy(is, response.getOutputStream());
	}
	
	@PostMapping(value="/mymarket/saleComplete", produces="application/json; charset=UTF-8")
	@ResponseBody
	@mypageLoginCheck
	public String saleComplete(@RequestBody String marketNo) {
		int cnt = mypageService.changeSalesStatus(Integer.parseInt(marketNo));
		JSONObject jsonObject = new JSONObject();
		if(cnt > 0) {
			jsonObject.put("message", "판매완료");
		} else {
			jsonObject.put("message", "데이터베이스 문제");
		}
		String json = jsonObject.toString();
		return json;
	}
	// ------------------------------- 찜목록 인수 ---------------------------------------
	@RequestMapping("/prefer/buildingprefer")
	@mypageLoginCheck
	public String buildingprefer(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sessionUserId");
		int totalCnt = mypageService.getLikeBuildingCnt(userId);
		PagerDto pager = new PagerDto(8, 10, totalCnt, pageNo);
		pager.setUserId(userId);
		model.addAttribute("pager", pager);
		List<BuildingDto> buildings = mypageService.getLikeBuilding(pager);
		model.addAttribute("total", totalCnt);
		model.addAttribute("buildings", buildings);
		return "/mypage/prefer/buildingprefer";			
	}
	
	@RequestMapping("/getBuildingImage")
	public void getBuildingImage(HttpServletRequest req, HttpServletResponse res, String buildingNo, String type, String img) throws IOException {
		List<BuildingFileDto> files = mypageService.selectImageFileByBuildingNo(buildingNo);
   	    if(type.equals("nomal")) {
   	    	int num = Integer.parseInt(img);
			if(files.get(num).getPanoramaCheck() == 1) {
				num++;
			}
			byte[] temp = files.get(num).getImageFileData();
			InputStream is = new ByteArrayInputStream(temp);
			IOUtils.copy(is, res.getOutputStream());
   	    } else {
			   //files안에 있는 파노라마 이미지를 찾기 위함
   	    	for(BuildingFileDto f : files) {
   	    		if(f.getPanoramaCheck() == 1) { //파노라마 사진이라면...!
   	    			byte[] temp = f.getImageFileData();
					InputStream is = new ByteArrayInputStream(temp);
					IOUtils.copy(is, res.getOutputStream());
				}
			}
		}
	}
	
	@PostMapping("/deleteLikeBuilding")
	@mypageLoginCheck
	public String deleteLikeBuilding(@RequestBody String bNo, HttpServletRequest request, HttpSession session) {
		
		String userId = (String) session.getAttribute("sessionUserId");
		LikeListDto likeList = new LikeListDto();
		likeList.setLikeListNo(Integer.parseInt(bNo));
		likeList.setLikeType("building");
		likeList.setLikeUserId(userId);
		
		mypageService.deleteLikeBuilding(likeList);
		mypageService.updateBuildingLikeCount(Integer.parseInt(bNo));
		
		return "mypage/prefer/buildingprefer";
	}
	
	// ------------------------------- 찜목록 거래---------------------------------------
	@RequestMapping("/prefer/marketprefer")
	@mypageLoginCheck
	public String marketprefer(HttpSession session, Model model, @RequestParam(defaultValue = "1") int pageNo) {
		String userId = (String) session.getAttribute("sessionUserId");
		int totalCnt = mypageService.getLikeMarketCnt(userId);
		PagerDto pager = new PagerDto(8, 10, totalCnt, pageNo);
		pager.setUserId(userId);
		model.addAttribute("pager", pager);
		List<MarketBoardDto> markets = mypageService.getLikeMarket(pager);
		model.addAttribute("total", totalCnt);
		model.addAttribute("markets", markets);
		return "/mypage/prefer/marketprefer";			
	}
	// ------------------------------
	@PostMapping("/deleteLikeMarket")
	@mypageLoginCheck
	public String deleteLikeMarket(@RequestBody String mNo, HttpServletRequest request, HttpSession session) {
		String userId = (String) session.getAttribute("sessionUserId");
		LikeListDto likeList = new LikeListDto();
		likeList.setLikeListNo(Integer.parseInt(mNo));
		likeList.setLikeType("market");
		likeList.setLikeUserId(userId);
		
		mypageService.deleteLikeMarket(likeList);
		mypageService.updateMarketLikeCount(Integer.parseInt(mNo));
		
		return "mypage/prefer/marketprefer";
	}
	
	// ------------------- 쪽지함 ------------------- 
	@RequestMapping("/message/receive")
	@mypageLoginCheck
	public String messageReceive(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, HttpServletRequest request, Model model) {
		String userId = (String) session.getAttribute("sessionUserId");
		int totalCnt = mypageService.getTotalReceiveMessage(userId);
		PagerDto pager = new PagerDto(10, 10, totalCnt, pageNo);
		pager.setUserId(userId);
		model.addAttribute("pager", pager);
		List<MessageDto> rmessages = mypageService.getMessageReceiveList(pager);
		model.addAttribute("total", totalCnt);
		model.addAttribute("messages", rmessages);
		return "/mypage/message/receive";
	}
	
	@RequestMapping("/message/send")
	@mypageLoginCheck
	public String messageSend(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, HttpServletRequest request, Model model) {
		String userId = (String) session.getAttribute("sessionUserId");
		int totalCnt = mypageService.getTotalSendMessage(userId);
		PagerDto pager = new PagerDto(10, 10, totalCnt, pageNo);
		pager.setUserId(userId);
		model.addAttribute("pager", pager);
		List<MessageDto> smessages = mypageService.getMessageSendList(pager);
		model.addAttribute("total", totalCnt);
		model.addAttribute("messages", smessages);
		return "/mypage/message/send";
	}
	
	@PostMapping(value="/message/rdeleteMsg", produces="application/json; charset=UTF-8")
	@ResponseBody
	@mypageLoginCheck
	public String rDeleteMsg(@RequestBody String arr, HttpServletRequest request, HttpSession session, Model model) throws Exception {
		int cnt = mypageService.deleteMyReceiveMessage(arr);
		JSONObject jsonObject = new JSONObject();
		if(cnt > 0 ) {
			jsonObject.put("message", cnt + "개를 삭제하였습니다");	
		} else {
			jsonObject.put("message", "삭제에 실패하였습니다.");
		}
		String json = jsonObject.toString();
		return json;
	}
	
	@PostMapping(value="/message/sdeleteMsg", produces="application/json; charset=UTF-8")
	@ResponseBody
	@mypageLoginCheck
	public String sDeleteMsg(@RequestBody String arr, HttpServletRequest request, HttpSession session, Model model) throws Exception {
		int cnt = mypageService.deleteMySendMessage(arr);
		JSONObject jsonObject = new JSONObject();
		if(cnt > 0 ) {
			jsonObject.put("message", cnt + "개를 삭제하였습니다");	
		} else {
			jsonObject.put("message", "삭제에 실패하였습니다.");
		}
		String json = jsonObject.toString();
		return json;
	}
	
	@PostMapping("/message/sending")
	@mypageLoginCheck
	public String messageSend(MessageDto message, HttpSession session, HttpServletRequest request, @RequestParam("changeMsgNo") int changeNo) {
		mypageService.sendMessage(message);
		mypageService.checkReceivedMsg(changeNo);
		return "redirect:/mypage/message/test";
	}
	
	
	// 회원 탈퇴 페이지 이동
	@RequestMapping("/withdrawl")
	@mypageLoginCheck
	public String withdrawl(HttpSession session) {
		return "/mypage/withdrawal";
	}
	
	// 회원 탈퇴 action
	@PostMapping(value="/userWithdrawal", produces="application/json; charset=UTF-8")
	@ResponseBody
	@mypageLoginCheck
	public String userWithdrawal(@RequestBody String sendData, UserDto user, HttpSession session, HttpServletRequest request, Model model) {
		JSONObject jsonObject = new JSONObject();
		JSONObject jjson = new JSONObject(sendData);
		String userId = (String) jjson.get("userId");
		user.setUserId((String)jjson.get("userId"));
		user.setUserPassword((String)jjson.get("userPassword"));
		UserDto chkPwd = mypageService.getPassword(user.getUserId());
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		
		if(passwordEncoder.matches(user.getUserPassword(), chkPwd.getUserPassword())) {
			mypageService.userWithdrawal(user);
			session.removeAttribute("sessionUserId");
			jsonObject.put("message", "회원탈퇴하셨습니다");
			jsonObject.put("status", "success");
		} else {
			jsonObject.put("message", "비밀번호를 확인해주세요");
			jsonObject.put("status", "fail");
		}
		String json = jsonObject.toString();
		
		return json;
	}
}
