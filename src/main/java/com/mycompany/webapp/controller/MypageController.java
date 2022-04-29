package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.FreeBoardDto;
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
			log.info("userId : " + user.getUserId());
			model.addAttribute("user", user);
			return "/mypage/modify";	
		}
	}
	// 비밀번호 수정
	@PostMapping("/updatepassword")
	public String updatePassword(HttpSession session, @ModelAttribute("userNewPassword") String newPwd, UserDto user, Model model) {
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			// spring security 처리 들어가야함
			String userId = (String) session.getAttribute("sessionUserId");
			UserDto dbUser = mypageService.getUser(userId);
			
			PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			if(passwordEncoder.matches(user.getUserPassword(), dbUser.getUserPassword())) {
				dbUser.setUserPassword(passwordEncoder.encode(newPwd));
				int cnt = mypageService.changePassword(dbUser);
				model.addAttribute("user", dbUser);
				return "mypage/modify";
			} else {
				model.addAttribute("user", dbUser);
				return "mypage/modify";
			}
		}
	}
	
	// 마이페이지 본인이 쓴 자유 게시물
	@GetMapping("/myboard/board")
	public String myboardBoard(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, HttpServletRequest request, Model model) {
		log.info("실행");
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			String userId = (String) session.getAttribute("sessionUserId");
			int totalCnt = mypageService.getTotalFreeboardCount(userId);
			PagerDto pager = new PagerDto(10, 10, totalCnt, pageNo);
			pager.setUserId(userId);
			model.addAttribute("pager", pager);
			List<FreeBoardDto> boards = mypageService.getMyFreeBoardList(pager);
			model.addAttribute("boards", boards);
			return "/mypage/myboard/board";
		} 
	}
	
	// 마이페이지 본인이 쓴 인수/매물
	@RequestMapping("/myboard/building")
	public String myboardBuilding(HttpSession session) {
		log.info("실행");
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			return "/mypage/myboard/building";
		} 
	}
	
	// 마이페이지 본인이 쓴 거래 게시물
	@RequestMapping("/myboard/market")
	public String myboardMarket(HttpSession session) {
		log.info("실행");
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			return "/mypage/myboard/market";
		} 
	}
	
	@PostMapping("/myboard/delete")
	@ResponseBody
	public String myboardDelete(@RequestParam(value="delArr[]") List<String> delArr, HttpServletRequest request, HttpSession session, Model model) throws Exception {
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			int cnt = mypageService.deleteMyPosting(delArr);
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("message", cnt + "개를 삭제하였습니다");
			String json = jsonObject.toString();
			
			return json;
		}
	}
	
	// 찜목록 페이지 이동
	@RequestMapping("/prefer")
	public String prefer(HttpSession session) {
		log.info("실행");
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			
			return "/mypage/prefer";
		}
	}

	@RequestMapping("/prefer/buildingprefer")
	public String buildingprefer(HttpSession session) {
		log.info("실행");
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			return "/mypage/prefer/buildingprefer";			
		} 
	}
	
	@RequestMapping("/prefer/marketprefer")
	public String marketprefer(HttpSession session) {
		log.info("실행");
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} 
		return "/mypage/prefer/marketprefer";
	}
		
	
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
			int cnt = mypageService.deleteMyMessage(delArr);
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
			int cnt = mypageService.deleteMyMessage(delArr);
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("message", cnt + "개를 삭제하였습니다");
			String json = jsonObject.toString();
			
			return json;
		}
	}
	
	@PostMapping("/message/send")
	public void messageSend(MessageDto message, HttpSession session, HttpServletRequest request, @RequestParam("changeMsgNo") int changeNo) {
		String userId = (String) session.getAttribute("sessionUserId");
		int result = mypageService.sendMessage(message);
		int res = mypageService.checkReceivedMsg(changeNo);
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
	@PostMapping("/userWithdrawal")
	public String userWithdrawal(HttpSession session, UserDto user, HttpServletRequest request, Model model) {
		if(session.getAttribute("sessionUserId") == null) {
			return "redirect:/index/loginForm";
		} else {
			log.info("user.getUserId() : " + user.getUserId());
			UserDto chkPwd = mypageService.getPassword(user.getUserId());
			PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			log.info("user.getUserPassword() : " + user.getUserPassword());
			log.info(chkPwd);
			if(passwordEncoder.matches(user.getUserPassword(), chkPwd.getUserPassword())) {
				int cnt = mypageService.userWithdrawal(user);
				session.removeAttribute("sessionUserId");
				return "redirect:/";
			} else {
				model.addAttribute("message", "비밀번호를 확인해주세요");
				return "mypage/withdrawal";
			}			
		}
	}
}
