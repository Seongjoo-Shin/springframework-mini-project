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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.BuildingFileDto;
import com.mycompany.webapp.dto.WishListDto;
import com.mycompany.webapp.service.TakeService;
import com.mycompany.webapp.service.UserService;
import com.mycompany.webapp.service.WishListService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/interior")
public class InteriorController {
	
	@Resource
	private WishListService wishListService;
	@Resource
	private UserService userService;
	@Resource
	private TakeService takeService;
	
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
		WishListDto wishlist=new WishListDto();
		wishlist.setUserId(userId);
		wishlist.setBuildingNo(buildingNo);
		List<BuildingFileDto> fileDto = takeService.selectImageFileByBuildingNo(buildingNo+"");
		model.addAttribute("modelId", userId);
		model.addAttribute("buildingNo", buildingNo);
		model.addAttribute("imageFiles", fileDto);
		
		if(userId!=null) {
			List<WishListDto> wishLists = wishListService.getWishList(wishlist);
			model.addAttribute("wishLists",wishLists);
			log.info(wishLists);
		}
		
		return "/interior/simulator";
	}
	
	 @RequestMapping("/getBuildingImage")
	   public void getBuildingImage(HttpServletRequest req, HttpServletResponse res, String buildingNo, String type, String img) throws IOException {
		   System.out.println(buildingNo);
		   List<BuildingFileDto> files = takeService.selectImageFileByBuildingNo(buildingNo);
		   
		   log.info("type : " + type);
		   
		   if(type.equals("nomal")) { //일반 사진만 가져와!
			   int num = Integer.parseInt(img);
			   if(files.get(num).getPanoramaCheck() == 1) {
				   return;
			   }
			   byte[] temp = files.get(num).getImageFileData();
			   InputStream is = new ByteArrayInputStream(temp);
			   IOUtils.copy(is, res.getOutputStream());
		   }else {
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
	
	@PostMapping(value = "/addWishList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String addWishList(WishListDto wishList, HttpSession session) {
		log.info(wishList);
		String userId = (String)session.getAttribute("sessionUserId");
		JSONObject jsonObject = new JSONObject();
		
		if(userId==null||userId.equals("")) {
			jsonObject.put("result", "noId");
		} else {
			wishList.setUserId(userId);
			WishListDto item = wishListService.findPictureById(wishList); 
			if(item == null) {
				log.info("추가성공");
				wishListService.addItemToWishList(wishList);
				jsonObject.put("result", "success");
			} else {
				log.info("추가실패");
				jsonObject.put("result", "hasItem");
			}
			
		}
		
		
		String json = jsonObject.toString();
		return json;
	}
	
	@PostMapping(value = "/deleteItem", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String deleteItem(WishListDto wishList) {
		int result = wishListService.deleteItem(wishList);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", result);
		
		
		String json = jsonObject.toString();
		return json;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
