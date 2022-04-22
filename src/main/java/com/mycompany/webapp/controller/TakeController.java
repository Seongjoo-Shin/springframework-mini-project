package com.mycompany.webapp.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
   public String enroll() {
      return "take/enroll";
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
}