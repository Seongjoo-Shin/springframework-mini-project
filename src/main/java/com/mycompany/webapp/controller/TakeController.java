package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
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
   
   @RequestMapping("/view")
   public String view() {
      return "take/view";
   }
   
   @RequestMapping("/enroll")
   public String enroll() {
      return "take/enroll";
   }
   
   @RequestMapping("/popUpImg")
   public String popUpImg() {
      return "take/popUpImg";
   }
   
   @RequestMapping("/popUp360Img")
   public String popUp360Img() {
      return "take/popUp360Img";
   }
}