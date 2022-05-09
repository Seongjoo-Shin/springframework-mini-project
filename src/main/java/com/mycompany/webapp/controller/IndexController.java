package com.mycompany.webapp.controller;

import java.util.Random;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	@Resource
	private JavaMailSender mailSender;
	
	@GetMapping("/loginForm")
	public String loginForm() {
		log.info("실행");
		return "/index/loginForm";
	}
	
	/*@PostMapping("/login")
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
	}*/
	
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
			return "/index/signupForm";
		} else {
			return "/index/signupForm";
		}
		
	}
	
	@RequestMapping(value = "/checkId", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String checkId(String id) {
		LoginResult result = userService.checkId(id);
		JSONObject jsonObject = new JSONObject();
		if(result == LoginResult.SUCCESS) {
			jsonObject.put("result", "가입가능");
		} else {
			jsonObject.put("result", "가입불가");
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
	
	@PostMapping(value = "/checkEmail", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String checkEmail(String email) {
		int num;
		LoginResult result = userService.checkEmail(email);
		JSONObject jsonObject = new JSONObject();
		if(result == LoginResult.FAIL) {
			jsonObject.put("result", "success");
			//인증번호 생성
			Random r = new Random();
			num = r.nextInt(999999);
			//인증번호 쿠키에 저장
			
			
			//인증메일 보낸사람
			String setfrom = "ssj980204@gmail.com";
			//인증메일 받는사람
			String tomail = email;
			//메일 제목
			String title = "[회원가입 이메일인증]메일입니다.";
			//메일내용 인증번호 포함
			String content = System.getProperty("line.separator") + "인증번호는 " + num + " 입니다." + System.getProperty("line.separator");
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
			
				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); 
				messageHelper.setSubject(title);
				messageHelper.setText(content); 
			
				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			jsonObject.put("num", num);
			
		} else {
			jsonObject.put("result", "fail");
		}
		
		String json = jsonObject.toString();
		return json; 
	}
	
	@PostMapping(value = "/findEmail", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String findEmail(String emailValue) {
		log.info(emailValue);
		int num;
		LoginResult result = userService.checkEmail(emailValue);
		JSONObject jsonObject = new JSONObject();
		if(result == LoginResult.SUCCESS) {
			jsonObject.put("result", "success");
			
			//인증번호 생성
			Random r = new Random();
			num = r.nextInt(999999);
			//인증번호 쿠키에 저장
			
			
			//인증메일 보낸사람
			String setfrom = "ssj980204@gmail.com";
			//인증메일 받는사람
			String tomail = emailValue;
			//메일 제목
			String title = "[아이디찾기]인증번호 메일입니다.";
			//메일내용 인증번호 포함
			String content = System.getProperty("line.separator") + "인증번호는 " + num + " 입니다." + System.getProperty("line.separator");
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
			
				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); 
				messageHelper.setSubject(title);
				messageHelper.setText(content); 
			
				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			jsonObject.put("num", num);
			
		} else {
			jsonObject.put("result", "fail");
		}
		
		String json = jsonObject.toString();
		return json;
	}
	
	
	@PostMapping(value = "/findIdByEmail", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String findIdByEmail(String emailValue) {
		log.info(emailValue);
		String result = userService.findIdByEmail(emailValue);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", result);
		String json = jsonObject.toString();
		
		return json;
		
	}
	
	//비밀번호 찾기 아이디, 이메일 확인 후 인증번호 전송
	@PostMapping(value = "/findPasswordByEmail", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String findPasswordByEmail(String idValue, String passwordEmail) {
		log.info(idValue);
		log.info(passwordEmail);
		LoginResult resultId = userService.checkId(idValue);
		JSONObject jsonObject = new JSONObject();
		if(resultId == LoginResult.FAIL_USERID) {
			UserDto result = userService.findPasswordByEmail1(passwordEmail);
			if(result != null) {
				//인증번호 생성
				Random r = new Random();
				int num = r.nextInt(999999);
				//인증번호 쿠키에 저장
				
				
				//인증메일 보낸사람
				String setfrom = "ssj980204@gmail.com";
				//인증메일 받는사람
				String tomail = passwordEmail;
				//메일 제목
				String title = "[비밀번호찾기]인증번호 메일입니다.";
				//메일내용 인증번호 포함
				String content = System.getProperty("line.separator") + "인증번호는 " + num + " 입니다." + System.getProperty("line.separator");
				
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
				
					messageHelper.setFrom(setfrom); 
					messageHelper.setTo(tomail); 
					messageHelper.setSubject(title);
					messageHelper.setText(content); 
				
					mailSender.send(message);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				
				jsonObject.put("num", num);
				jsonObject.put("result", "successAll");
			} else {
				jsonObject.put("result", "noEmail");
			}
		} else {
			jsonObject.put("result", "noId");
		}
		
		String json = jsonObject.toString();
		return json;
	}
	
	//비밀번호 찾기 기능시 비밀번호는 디코딩 기능을 제공하지 않기 때문에 새로운 비밀번호를 메일로 보내준다.
	@PostMapping(value = "/sendNewPassword", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String sendNewPassword(String idValue, String toEamil) {
		UserDto user = new UserDto();
		user.setUserId(idValue);
		user.setUserEmail(toEamil);
		JSONObject jsonObject = new JSONObject();
		//4자리비밀번호 생성
		Random r = new Random();
		int num = r.nextInt(9999);
		//인증메일 보낸사람
		String setfrom = "ssj980204@gmail.com";
		//인증메일 받는사람
		String tomail = toEamil;
		//메일 제목
		String title = "[임시비밀번호]메일입니다.";
		//메일내용 인증번호 포함
		String content = System.getProperty("line.separator") + "임시비밀번호는 " + num + " 입니다." + System.getProperty("line.separator");
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
		
			messageHelper.setFrom(setfrom); 
			messageHelper.setTo(tomail); 
			messageHelper.setSubject(title);
			messageHelper.setText(content); 
		
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		//새로운 비밀번호 인코딩
		String newPassword = Integer.toString(num);
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		user.setUserPassword(passwordEncoder.encode(newPassword));
		
		int result = userService.updateNewPassword(user);
		
		jsonObject.put("result", "update");
		
		String json = jsonObject.toString();
		return json; 
	}
	
}
