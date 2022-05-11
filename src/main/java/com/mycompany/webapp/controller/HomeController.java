package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.FreeBoardDto;
import com.mycompany.webapp.dto.MarketBoardDto;
import com.mycompany.webapp.dto.MessageDto;
import com.mycompany.webapp.dto.NoticeBoardDto;
import com.mycompany.webapp.service.HomeService;
import com.mycompany.webapp.service.MypageService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class HomeController {
	
	@Resource
	private MypageService mypageService;
	
	@Resource
	private HomeService homeService;
	
	@RequestMapping("/")
	public String home(Model model) {
		List<FreeBoardDto> freeboards = homeService.getFreeBoards();
		List<MarketBoardDto> marketboards = homeService.getMarketBoards();
		List<NoticeBoardDto> noticeboards = homeService.getNoticeBoards();
		model.addAttribute("freeboards", freeboards);
		model.addAttribute("marketboards", marketboards);
		model.addAttribute("noticeboards", noticeboards);
		return "home";
	}
	
	@RequestMapping("/message")
	public String message(HttpServletRequest request, Model model, HttpSession session) {
		String userId = (String) session.getAttribute("sessionUserId");
		String receiver = request.getParameter("receiver");
		if(userId.equals(receiver)){
			return "common/nomessage";
		} else {
			model.addAttribute("receiver", receiver);
			return "common/message";	
		}
	}
	
	@RequestMapping("/messageSend")
	public String messageSend(HttpServletRequest request, Model model, HttpSession session) {
		String userId = (String) session.getAttribute("sessionUserId");
		String receiver = request.getParameter("receiver");
		if(userId.equals(receiver)){
			return "common/nomessage";
		} else {
			model.addAttribute("receiver", receiver);
			return "common/messageSend";	
		}
	}
	
	@GetMapping("/messageView")
	public String messageView(HttpSession session, HttpServletRequest request, Model model) {
		List<MessageDto> message = mypageService.getMessageByNo(Integer.parseInt(request.getParameter("messageNo")));
		model.addAttribute("message", message.get(0));
		return "common/messageView";
	}
}

