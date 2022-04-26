package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
		List<KeyWordDto> listKeyword = openingService.getKeywordPlace();
		model.addAttribute("keywords", listKeyword);
		return "opening/opening";
	}
	
	@RequestMapping(value="/keyword", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String keyword(@RequestBody KeyWordDto keyword) {
		log.info("실행");
		log.info("name: " + keyword);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		
		return json;
	}
}
