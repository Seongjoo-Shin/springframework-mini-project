package com.mycompany.webapp.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@Resource
	private MypageService mypageService;
	
	@RequestMapping("/modify")
	public String modify(HttpSession session, Model model) {
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			String userId = (String) session.getAttribute("sessionUserId");
			UserDto user = mypageService.getUser(userId);
			// user가 검색되지 않는 경우 처리
			model.addAttribute("user", user);
			return "/mypage/modify";	
		}
	}
	// 비밀번호 수정
	@PostMapping(value="/updatepassword", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String updatePassword(HttpSession session, UserDto user, Model model, HttpServletRequest request) {
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			String userId = (String) session.getAttribute("sessionUserId");
			UserDto dbUser = mypageService.getUser(userId);
			
			String pwd = request.getParameter("pwd");
			String newpwd = request.getParameter("newPwd");
			
			JSONObject jsonObject = new JSONObject();
			
			PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			if(passwordEncoder.matches(pwd, dbUser.getUserPassword())) {
				dbUser.setUserPassword(passwordEncoder.encode(newpwd));
				int cnt = mypageService.changePassword(dbUser);
				jsonObject.put("message", "비밀번호를 변경하였습니다.");
			} else {
				jsonObject.put("message", "비밀번호가 일치하지 않습니다.");
			}
		
			String json = jsonObject.toString();
			return json;
		}
	}
	
	// 마이페이지 본인이 쓴 자유 게시물
	@GetMapping("/myboard/board")
	public String myboardBoard(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, HttpServletRequest request, Model model) {
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			String userId = (String) session.getAttribute("sessionUserId");
			int totalCnt = mypageService.getTotalFreeboardCount(userId);
			PagerDto pager = new PagerDto(10, 10, totalCnt, pageNo);
			pager.setUserId(userId);
			model.addAttribute("pager", pager);
			List<FreeBoardDto> boards = mypageService.getMyFreeBoardList(pager);
			model.addAttribute("total", totalCnt);
			model.addAttribute("boards", boards);
			return "/mypage/myboard/board";
		} 
	}
	
	@PostMapping(value="/myboard/delete", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String myboardDelete(@RequestParam(value="delArr[]") List<String> delArr, HttpServletRequest request, HttpSession session, Model model) throws Exception {
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			int cnt = mypageService.deleteMyPosting(delArr);
			JSONObject jsonObject = new JSONObject();
			if(cnt > 0) {
				jsonObject.put("message", cnt + "개를 삭제하였습니다.");	
			} else {
				jsonObject.put("message", "게시물 삭제에 실패하였습니다.");
			}
			
			String json = jsonObject.toString();
			
			return json;
		}
	}
	
	
	// 마이페이지 본인이 쓴 인수/매물
	@RequestMapping("/myboard/building")
	public String myboardBuilding(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, HttpServletRequest request, Model model) {
		log.info("실행");
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			String userId = (String) session.getAttribute("sessionUserId");
			int totalCnt = mypageService.getTotalBuildingCount(userId); 
			PagerDto pager = new PagerDto(10 , 10, totalCnt, pageNo);
			pager.setUserId(userId);
			model.addAttribute("pager", pager);
			List<BuildingDto> buildings = mypageService.getMyBuildingList(pager); 
			model.addAttribute("total", totalCnt);
			model.addAttribute("buildings", buildings);
			return "/mypage/myboard/building";
		} 
	}
	
	@PostMapping(value="/mybuilding/delete", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String mybuildingDelete(@RequestParam(value="delArr[]") List<String> delArr, HttpServletRequest request, HttpSession session, Model model) throws Exception {
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			int cnt = mypageService.deleteMyBuilding(delArr);
			JSONObject jsonObject = new JSONObject();
			if(cnt > 0) {
				jsonObject.put("message", cnt + "개를 삭제하였습니다");	
			} else {
				jsonObject.put("message", "게시물 삭제에 실패하였습니다.");
			}
			
			String json = jsonObject.toString();
			
			return json;
		}
	}
	
	// 마이페이지 본인이 쓴 거래 게시물
	@RequestMapping("/myboard/market")
	public String myboardMarket(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, HttpServletRequest request, Model model) {

		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			log.info("실행");
			String userId = (String) session.getAttribute("sessionUserId");
			int totalCnt = mypageService.getTotalMarketboardCount(userId); //
			log.info(totalCnt);
			PagerDto pager = new PagerDto(6, 10, totalCnt, pageNo);
			pager.setUserId(userId);
			model.addAttribute("pager", pager);
			List<MarketBoardDto> markets = mypageService.getMyMarketBoardList(pager); // 
			model.addAttribute("total", totalCnt);
			model.addAttribute("markets", markets);
			return "/mypage/myboard/market";
		} 
	}
	
	@PostMapping(value="/mymarket/delete", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String mymarketDelete(int marketNo, HttpServletRequest request, HttpSession session, Model model) throws Exception {
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			int cnt = mypageService.deleteMyMarket(marketNo);
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("message", cnt + "개를 삭제하였습니다");
			String json = jsonObject.toString();
			log.info(json);
			return json;
		}
	}

	@RequestMapping("/getMarketImage")
	public void getMarketImage(HttpServletRequest req, HttpServletResponse res, String marketNo, String img) throws IOException {
		List<MarketFileDto> files = mypageService.selectImageFileByMarketNo(marketNo);
    	int num = Integer.parseInt(img);
		byte[] temp = files.get(0).getImageFileData();
		InputStream is = new ByteArrayInputStream(temp);
		IOUtils.copy(is, res.getOutputStream());
	}
	
	// ------------------------------- 찜목록 인수 ---------------------------------------
	@RequestMapping("/prefer/buildingprefer")
	public String buildingprefer(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, Model model) {
		log.info("실행");
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
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
	}
	
	@RequestMapping("/getBuildingImage")
	public void getBuildingImage(HttpServletRequest req, HttpServletResponse res, String buildingNo, String type, String img) throws IOException {
		List<BuildingFileDto> files = mypageService.selectImageFileByBuildingNo(buildingNo);
   	    if(type.equals("nomal")) { //일반 사진만 가져와!
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
	public String deleteLikeBuilding(HttpServletRequest request, HttpSession session) {
		
		log.info("실행");
		String userId = (String) session.getAttribute("sessionUserId");
		int buildingNo = Integer.parseInt(request.getParameter("buildingNo"));
		LikeListDto likeList = new LikeListDto();
		likeList.setLikeListNo(buildingNo);
		likeList.setLikeType("building");
		likeList.setLikeUserId(userId);
		
		log.info(likeList);
		
		mypageService.deleteLikeBuilding(likeList);
		mypageService.updateBuildingLikeCount(buildingNo);
		
		return "mypage/prefer/buildingprefer";
	}
	
	// ------------------------------- 찜목록 거래---------------------------------------
	@RequestMapping("/prefer/marketprefer")
	public String marketprefer(HttpSession session) {
		log.info("실행");
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} 
		return "/mypage/prefer/marketprefer";
	}
	
	@PostMapping("/deleteLikeMarket")
	public String deleteLikeMarket(HttpServletRequest request, HttpSession session) {
		
		log.info("실행");
		String userId = (String) session.getAttribute("sessionUserId");
		int marketNo = Integer.parseInt(request.getParameter("marketNo"));
		LikeListDto likeList = new LikeListDto();
		likeList.setLikeListNo(marketNo);
		likeList.setLikeType("market");
		likeList.setLikeUserId(userId);
		
		log.info(likeList);
		
		mypageService.deleteLikeMarket(likeList);
		mypageService.updateMarketLikeCount(marketNo);
		
		return "mypage/prefer/marketprefer";
	}
	
	// ------------------- 쪽지함 ------------------- 
	@RequestMapping("/message/receive")
	public String messageReceive(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, HttpServletRequest request, Model model) {
		log.info("실행");
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
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
	}
	
	@RequestMapping("/message/send")
	public String messageSend(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, HttpServletRequest request, Model model) {
		log.info("실행");
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
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
	}
	
	@PostMapping("/message/rdeleteMsg")
	@ResponseBody
	public String rDeleteMsg(@RequestParam(value="delArr[]") List<String> delArr, HttpServletRequest request, HttpSession session, Model model) throws Exception {
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			log.info(delArr);
			int cnt = mypageService.deleteMyReceiveMessage(delArr);
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("message", cnt + "개를 삭제하였습니다");
			String json = jsonObject.toString();
			
			return json;
		}
	}
	
	@PostMapping("/message/sdeleteMsg")
	@ResponseBody
	public String sDeleteMsg(@RequestParam(value="delArr[]") List<String> delArr, HttpServletRequest request, HttpSession session, Model model) throws Exception {
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			log.info(delArr);
			int cnt = mypageService.deleteMySendMessage(delArr);
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("message", cnt + "개를 삭제하였습니다");
			String json = jsonObject.toString();
			
			return json;
		}
	}
	
	@PostMapping("/message/sending")
	public String messageSend(MessageDto message, HttpSession session, HttpServletRequest request, @RequestParam("changeMsgNo") int changeNo) {
		String userId = (String) session.getAttribute("sessionUserId");
		int result = mypageService.sendMessage(message);
		int res = mypageService.checkReceivedMsg(changeNo);
		
		
		return "redirect:/mypage/message/test";
	}
	
	
	// 회원 탈퇴 페이지 이동
	@RequestMapping("/withdrawl")
	public String withdrawl(HttpSession session) {
		log.info("실행");
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			return "/mypage/withdrawal";
		}
	}
	
	// 회원 탈퇴 action
	@PostMapping(value="/userWithdrawal", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String userWithdrawal(HttpSession session, UserDto user, HttpServletRequest request, Model model) {
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			log.info(user);
			UserDto chkPwd = mypageService.getPassword(user.getUserId());
			PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			log.info("2222");
			JSONObject jsonObject = new JSONObject();
			if(passwordEncoder.matches(user.getUserPassword(), chkPwd.getUserPassword())) {
				log.info("1234");
				int cnt = mypageService.userWithdrawal(user);
				session.removeAttribute("sessionUserId");
				jsonObject.put("message", "회원탈퇴하셨습니다");
				jsonObject.put("status", "success");
			} else {
				log.info("4321");
				jsonObject.put("message", "비밀번호를 확인해주세요");
				jsonObject.put("status", "fail");
			}
			
			String json = jsonObject.toString();
			
			return json;
		}
	}
}
