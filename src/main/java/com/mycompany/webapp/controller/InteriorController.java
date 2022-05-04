package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.WishListDto;
import com.mycompany.webapp.service.UserService;
import com.mycompany.webapp.service.WishListService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/interior")
public class InteriorController {
	
	@Resource
	private WishListService wishListService;
	private UserService userService;
	
	@RequestMapping("/example")
	public String example() {
		log.info("실행");
		return "/interior/example";
	}
	
	@RequestMapping("/example50")
	public String example50() {
		log.info("실행");
		return "/interior/example50";
	}
	
	@RequestMapping("/example65")
	public String example65() {
		log.info("실행");
		return "/interior/example65";
	}
	
	@RequestMapping("/example100")
	public String example100() {
		log.info("실행");
		return "/interior/example100";
	}
	
	@RequestMapping("/simulator")
	public String simulator(@RequestParam(defaultValue ="0") int buildingNo, Model model, HttpSession session) {
		log.info("실행");
		String userId = (String)session.getAttribute("sessionUserId");
		String buildingNo1 = buildingNo + "";
		WishListDto wishlist=new WishListDto();
		wishlist.setUserId(userId);
		wishlist.setBuildingNo(buildingNo);
		log.info(userId);
		log.info(buildingNo);
		model.addAttribute("modelId", userId);
		model.addAttribute("buildingNo", buildingNo);
		
		if(userId!=null) {
			List<WishListDto> wishLists = wishListService.getWishList(wishlist);
			model.addAttribute("wishLists",wishLists);
			log.info("55");
			log.info(wishLists.toString());
		}
		
		return "/interior/simulator";
	}
	
	@PostMapping(value = "/addWishList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String addWishList(WishListDto wishList, HttpSession session) {
		log.info(session.getAttribute("sessionUserId"));
		log.info(wishList);
		String userId = (String)session.getAttribute("sessionUserId");
		JSONObject jsonObject = new JSONObject();
		
		if(userId==null||userId.equals("")) {
			jsonObject.put("result", "noId");
		} else {
			log.info(wishList);
			wishList.setUserId(userId);
			WishListDto item = wishListService.findPictureById(wishList.getPictureName()); 
			if(item == null) {
				log.info("1");
				wishListService.addItemToWishList(wishList);
				jsonObject.put("result", "success");
			} else {
				jsonObject.put("result", "hasItem");
			}
			
		}
		
		
		String json = jsonObject.toString();
		return json;
	}
	
	@PostMapping(value = "/deleteItem", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String deleteItem(int wishListNo) {
		int result = wishListService.deleteItem(wishListNo);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", result);
		
		
		String json = jsonObject.toString();
		return json;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
