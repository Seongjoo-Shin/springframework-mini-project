package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
		return "opening/opening";
	}
	
	@RequestMapping(value="/keyword", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String keyword(@RequestBody String keyword, HttpServletRequest request, Model model) {
		JSONObject jjson = new JSONObject(keyword);
		List<String> lst = new ArrayList<>();
		
		if(jjson.has("value0")) {
			lst.add(jjson.getString("value0"));
		}
		if(jjson.has("value1")) {
			lst.add(jjson.getString("value1"));
		}
		if(jjson.has("value2")) {
			lst.add(jjson.getString("value2"));
		}
		if(jjson.has("value3")) {
			lst.add(jjson.getString("value3"));
		}
		if(jjson.has("value4")) {
			lst.add(jjson.getString("value4"));
		}
		if(jjson.has("value5")) {
			lst.add(jjson.getString("value5"));
		}
		if(jjson.has("value6")) {
			lst.add(jjson.getString("value6"));
		}
		if(jjson.has("value7")) {
			lst.add(jjson.getString("value7"));
		}
		
		KeyWordDto keyword1 = new KeyWordDto();
		
		for(String key : lst) {
			if(key.equals("keyword1")) {
				keyword1.setKeyword1("1");
			} else if(key.equals("keyword2")) {
				keyword1.setKeyword2("1");
			} else if(key.equals("keyword3")) {
				keyword1.setKeyword3("1");
			} else if(key.equals("keyword4")) {
				keyword1.setKeyword4("1");
			} else if(key.equals("keyword5")) {
				keyword1.setKeyword5("1");
			} else if(key.equals("keyword6")) {
				keyword1.setKeyword6("1");
			} else if(key.equals("keyword7")) {
				keyword1.setKeyword7("1");
			} else if(key.equals("keyword8")) {
				keyword1.setKeyword8("1");
			}
		}
		
		List<KeyWordDto> res = openingService.getKeywordPlace(keyword1);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keywords", res);
		jsonObject.put("keywordsLength", res.size());
		String json = jsonObject.toString();
		
		return json;
	}
	
	@RequestMapping(value="/oneKeyword", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String oneKeyword(@RequestBody String kNo) {
		int no = Integer.parseInt(kNo);
		KeyWordDto keyword = openingService.getKeyword(no);
		JSONObject jsonObject = new JSONObject();
		if(keyword.getKeyword1() != null) {
			jsonObject.put("keyword1", keyword.getKeyword1());
		}
		if(keyword.getKeyword2() != null) {
			jsonObject.put("keyword2", keyword.getKeyword2());
		}
		if(keyword.getKeyword3() != null) {
			jsonObject.put("keyword3", keyword.getKeyword3());
		}
		if(keyword.getKeyword4() != null) {
			jsonObject.put("keyword4", keyword.getKeyword4());
		}
		if(keyword.getKeyword5() != null) {
			jsonObject.put("keyword5", keyword.getKeyword5());
		}
		if(keyword.getKeyword6() != null) {
			jsonObject.put("keyword6", keyword.getKeyword6());
		}
		if(keyword.getKeyword7() != null) {
			jsonObject.put("keyword7", keyword.getKeyword7());
		}
		if(keyword.getKeyword8() != null) {
			jsonObject.put("keyword8", keyword.getKeyword8());
		}
		jsonObject.put("current_use", keyword.getCurrent_use());
		jsonObject.put("latitude", keyword.getLatitude());
		jsonObject.put("longitude", keyword.getLongitude());
		
		String json = jsonObject.toString();
		log.info(json);
		return json;
	}
}
