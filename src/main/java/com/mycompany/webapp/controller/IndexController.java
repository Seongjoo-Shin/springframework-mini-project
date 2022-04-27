package com.mycompany.webapp.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.UserDto;
import com.mycompany.webapp.service.UserService;
import com.mycompany.webapp.service.UserService.LoginResult;
import com.mycompany.webapp.service.UserService.SignUpResult;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/index")
public class IndexController {
	@Resource
	private UserService userService;
	
	@GetMapping("/loginForm")
	public String loginForm() {
		log.info("실행");
		return "/index/loginForm";
	}
	
	@PostMapping("/login")
	public String login(UserDto user, HttpSession session, Model model) {
		log.info(user);
		LoginResult result = userService.login(user);
		log.info(result);
		
		if(result == LoginResult.SUCCESS) {
			session.setAttribute("sessionUserId", user.getUserId());
			return "redirect:/";
		} else if (result == LoginResult.FAIL_USERID) {
			model.addAttribute("error", "아이디가 존재하지 않습니다.");
			return "/index/loginForm";
		}else {
			model.addAttribute("error", "패스워드가 틀립니다.");
			return "/index/loginForm";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("sessionUserId");
		return "redirect:/";
	}
	
	@RequestMapping("/findAccount")
	public String findAccount() {
		log.info("실행");
		return "/index/findIDPWForm";
	}
	
	@RequestMapping("/signUpForm")
	public String signUpForm() {
		log.info("실행");
		return "/index/signupForm";
	}
	
	@PostMapping("/signUp")
	public String signUp(UserDto user) {
		user.setUserEnabled(1);
		user.setUserRole("USER_ROLE");
		log.info(user);
		SignUpResult result = userService.signUp(user);
		if(result == SignUpResult.SUCCESS) {
			return "redirect:/index/loginForm";
		} else {
			return "/index/signupForm";
		}
		
	}
	
	@PostMapping(value = "/checkId", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String checkId(String id) {
		LoginResult result = userService.checkId(id);
		JSONObject jsonObject = new JSONObject();
		if(result == LoginResult.SUCCESS) {
			jsonObject.put("result", "fail");
		} else {
			jsonObject.put("result", "success");
		}
		
		String json = jsonObject.toString();
		return json;
	}
	
	@PostMapping(value = "/checkNickname", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String checkNickname(String nickname) {
		LoginResult result = userService.checkNickname(nickname);
		JSONObject jsonObject = new JSONObject();
		if(result == LoginResult.SUCCESS) {
			jsonObject.put("result", "fail");
		} else {
			jsonObject.put("result", "success");
		}
		
		String json = jsonObject.toString();
		return json; 
	}
	
	
}
