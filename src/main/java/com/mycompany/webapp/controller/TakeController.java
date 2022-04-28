package com.mycompany.webapp.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dto.BuildingDto;
import com.mycompany.webapp.dto.BuildingFileDto;
import com.mycompany.webapp.dto.EquipmentDto;
import com.mycompany.webapp.service.TakeService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/take")
public class TakeController {
	@Resource
	private TakeService takeService;
	
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
   public String takeoverEnroll(HttpServletRequest request, HttpSession session, @RequestPart("attach_file") List<MultipartFile> files, @RequestPart(value="attach_aroundFile", required=false) MultipartFile aroundFile, Model model) throws IOException {
	   log.info("실행");
	   log.info("id : " + session.getAttribute("sessionUserId"));
	   String option = request.getParameter("optionValueList");
	   
	   BuildingDto bdt = new BuildingDto();
	   bdt.setBuildingName(request.getParameter("buildingName"));
	   bdt.setBuildingAddr(request.getParameter("buildingAddr"));
	   bdt.setBuildingAddrDetail(request.getParameter("buildingAddrDetail"));
	   bdt.setBuildingLatitude(request.getParameter("buildingLatitude"));
	   bdt.setBuildingLongitude(request.getParameter("buildingLongitude"));
	   
	   bdt.setBuildingTradeInfo(request.getParameter("buildingTradeInfo"));
	   bdt.setBuildingTakeoverPrice(request.getParameter("buildingTakeoverPrice"));
	   bdt.setBuildingDepositPrice(request.getParameter("buildingDepositPrice"));
	   bdt.setBuildingMonthRent(request.getParameter("buildingMonthRent"));
	   bdt.setBuildingPrice(request.getParameter("buildingPrice"));
	   bdt.setBuildingAvailableDate(request.getParameter("buildingAvailableDate"));
	   
	   bdt.setBuildingDetailContent(request.getParameter("buildingDetailContent"));
	   bdt.setBuildingWriter(session.getAttribute("sessionUserId").toString());
	   bdt.setBuildingSupplyArea(request.getParameter("buildingSupplyArea"));
	   bdt.setBuildingDedicatedArea(request.getParameter("buildingDedicatedArea"));
	   bdt.setBuildingTotalFloor(Integer.parseInt(request.getParameter("buildingTotalFloor")));
	   bdt.setBuildingFloor(Integer.parseInt(request.getParameter("buildingFloor")));
	   bdt.setBuildingOption(option);
	   model.addAttribute("buildingData", bdt);
	   
	   System.out.println("bdt : " + bdt);
	   
	   model.addAttribute("option", option);
	   
	   List<EquipmentDto> equipmentList = new ArrayList<EquipmentDto>();
	   
	   //buildings 테이블안에 인수 매물 추가
	   int buildingNo = takeService.insertBuilding(bdt);
	   
	   //장비 추가
	   if(option.contains("3")) {
		   String[] equipments = request.getParameterValues("equipList");
		   for(String equip : equipments) {
			   JSONObject jsonObject = new JSONObject(equip);
			   EquipmentDto edo = new EquipmentDto();
			   edo.setBuildingNo(buildingNo);
			   edo.setEquipmentName(jsonObject.getString("name"));
			   edo.setEquipmentCount(jsonObject.getInt("cnt"));
//			   equipmentList.add(edo);
			   takeService.insertEquipments(edo);
		   }
	   }
	   
	   List<BuildingFileDto> mm = new ArrayList<BuildingFileDto>();
	   
	   //첨부파일 추가
	   if(files.size() != 0) {
		   for(MultipartFile m : files) {
			   
			   BuildingFileDto bfd = new BuildingFileDto();
			   bfd.setBuildingNo(buildingNo);
			   bfd.setAttachOriginalName(m.getOriginalFilename());
			   bfd.setAttachType(m.getContentType());
			   bfd.setAttachSaveName(new Date().getTime() + "-" + m.getOriginalFilename());
			   bfd.setImageFileData(m.getBytes());
			   bfd.setPanoramaCheck(0);
			   log.info(bfd);
			   
			   takeService.insertBuildingFile(bfd);
//			   
//			   File file = new File("C:/Temp/uploadfiles/" + bfd.getAttachSaveName());
//			   m.transferTo(file);
		   }

	   }
	   if(aroundFile != null) {
		   
		   BuildingFileDto bfd = new BuildingFileDto();
		   bfd.setBuildingNo(buildingNo);
		   bfd.setAttachOriginalName(aroundFile.getOriginalFilename());
		   bfd.setAttachType(aroundFile.getContentType());
		   bfd.setAttachSaveName(new Date().getTime() + "-" + aroundFile.getOriginalFilename());
		   bfd.setImageFileData(aroundFile.getBytes());
		   bfd.setPanoramaCheck(1);
		   
		   takeService.insertBuildingFile(bfd);
	   }
	   log.info("123(");
	   return "take/list";
   }
}