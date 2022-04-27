package com.mycompany.webapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/take")
public class TakeController {
   @RequestMapping("/list")
   public String list() {
      return "take/list";
   }
   
   @GetMapping("/view")
   public String view() {
	  log.info("실행");
      return "take/view";
   }
   
   @GetMapping("/viewCancle")
   public String viewCancle() {
	  log.info("실행");
      return "take/list";
   }
   
   @RequestMapping("/enroll")
   public String enroll(HttpSession session) {
	  log.info(session.getAttribute("sessionUserId"));
	  if(session.getAttribute("sessionUserId") == null) {
		  return "redirect:/index/loginForm";
	  }else {
		  return "take/enroll";
	  }
      
   }
   
   @RequestMapping("/enrollCancle")
   public String enrollCancle() {
      return "redirect:/take/list";
   }
   
   @RequestMapping("/popUpImg")
   public String popUpImg() {
	  log.info("실행");
      return "take/popUpImg";
   }
   
   @RequestMapping("/popUp360Img")
   public String popUp360Img() {
      return "take/popUp360Img";
   }
   
   @RequestMapping("/takeoverEnroll")
   public String takeoverEnroll(HttpServletRequest request, HttpSession session, @RequestPart("attach_file") List<MultipartFile> files, @RequestPart(value="attach_aroundFile", required=false) MultipartFile aroundFile) {
	   log.info("실행");
	   log.info("id : " + session.getAttribute("sessionUserId"));
	   log.info(request.getParameter("attach_aroundFile"));
	   log.info(request.getParameter("buildingName"));
	   log.info(files.get(0).getOriginalFilename());
	   log.info(files.size());
	   log.info(aroundFile);
	   String[] equip = request.getParameterValues("equipList");
	   for(int i=0; i<equip.length; i++) {
		   log.info(i + equip[i]);
	   }
	   
	   return "take/list";
   }
}