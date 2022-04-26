package com.mycompany.webapp.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String modify() {
		log.info("실행");
		return "/mypage/modify";
	}
	
	@RequestMapping("/prefer")
	public String prefer() {
		log.info("실행");
		return "/mypage/prefer";
	}
	
	@RequestMapping("/withdrawl")
	public String withdrawl() {
		log.info("실행");
		return "/mypage/withdrawal";
	}
	
	@RequestMapping("/myboard/board")
	public String myboardBoard() {
		log.info("실행");
		return "/mypage/myboard/board";
	}
	
	@RequestMapping("/myboard/building")
	public String myboardBuilding() {
		log.info("실행");
		return "/mypage/myboard/building";
	}
	
	@RequestMapping("/myboard/market")
	public String myboardMarket() {
		log.info("실행");
		return "/mypage/myboard/market";
	}
	
	@RequestMapping("/prefer/buildingprefer")
	public String buildingprefer() {
		log.info("실행");
		return "/mypage/prefer/buildingprefer";
	}
	
	@RequestMapping("/prefer/marketprefer")
	public String marketprefer() {
		log.info("실행");
		return "/mypage/prefer/marketprefer";
	}
	
	
	@RequestMapping("/message/receive")
	public String messageReceive() {
		log.info("실행");
		return "/mypage/message/receive";
	}
	
	@RequestMapping("/message/send")
	public String messageSend() {
		log.info("실행");
		return "/mypage/message/send";
	}
	
	// 비밀번호 수정
	@PostMapping("/updatepassword")
	public String updatePassword(@ModelAttribute("userNewPassword") String newPwd, UserDto user, Model model) {
		
		// spring security 처리 들어가야함
		String chkPwd = mypageService.getPassword(user.getUserId());
		if(chkPwd.equals(user.getUserPassword())) {
			user.setUserPassword(newPwd);
			int cnt = mypageService.changePassword(user);
		}
		
		return "mypage/modify";
	}
	
	@PostMapping("/userWithdrawal")
	public String userWithdrawal(UserDto user, HttpServletRequest request, Model model) {
		log.info("id : " + user.getUserId());
		String chkPwd = mypageService.getPassword(user.getUserId());
		log.info("pwd : " + user.getUserPassword());
		if(chkPwd.equals(user.getUserPassword())) {
			int cnt = mypageService.userWithdrawal(user);
			return "redirect:/";
		} else {
			model.addAttribute("message", "비밀번호를 확인해주세요");
			return "mypage/withdrawal";
		}
		
	}
}
