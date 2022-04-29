package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.KeyWordDto;
import com.mycompany.webapp.service.OpeningService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/opening")
public class OpeningController {
	
	@Resource
	private OpeningService openingService;
	
	@RequestMapping("/opening")
	public String opening(Model model) {
		List<KeyWordDto> listKeyword = openingService.getKeywordAllPlace();
		model.addAttribute("keywords", listKeyword);
		return "opening/opening";
	}
	
	@GetMapping(value="/keyword", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String keyword(KeyWordDto keyword, HttpServletRequest request, Model model) {
		log.info("실행");
		List<String> lst = new ArrayList<>();
		lst.add(request.getParameter("value0") == null ? "" : request.getParameter("value0"));
		lst.add(request.getParameter("value1") == null ? "" : request.getParameter("value1"));
		lst.add(request.getParameter("value2") == null ? "" : request.getParameter("value2"));
		lst.add(request.getParameter("value3") == null ? "" : request.getParameter("value3"));
		lst.add(request.getParameter("value4") == null ? "" : request.getParameter("value4"));
		lst.add(request.getParameter("value5") == null ? "" : request.getParameter("value5"));
		lst.add(request.getParameter("value6") == null ? "" : request.getParameter("value6"));
		lst.add(request.getParameter("value7") == null ? "" : request.getParameter("value7"));

		
		for(String key : lst) {
			if(key.equals("keyword1")) {
				keyword.setKeyword1(1);
			} else if(key.equals("keyword2")) {
				keyword.setKeyword2(1);
			} else if(key.equals("keyword3")) {
				keyword.setKeyword3(1);
			} else if(key.equals("keyword4")) {
				keyword.setKeyword4(1);
			} else if(key.equals("keyword5")) {
				keyword.setKeyword5(1);
			} else if(key.equals("keyword6")) {
				keyword.setKeyword6(1);
			} else if(key.equals("keyword7")) {
				keyword.setKeyword7(1);
			} else if(key.equals("keyword8")) {
				keyword.setKeyword8(1);
			}
		}
		
		List<KeyWordDto> res = openingService.getKeywordPlace(keyword);
		
		for(KeyWordDto k : res) {
			log.info(k);
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keywords", res);
		jsonObject.put("keywordsLength", res.size());
		String json = jsonObject.toString();
		
		return json;
	}
}
