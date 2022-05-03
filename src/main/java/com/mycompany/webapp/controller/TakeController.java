package com.mycompany.webapp.controller;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dto.BuildingDto;
import com.mycompany.webapp.dto.BuildingFileDto;
import com.mycompany.webapp.dto.EquipmentDto;
import com.mycompany.webapp.dto.LikeListDto;
import com.mycompany.webapp.dto.MessageDto;
import com.mycompany.webapp.service.TakeService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/take")
public class TakeController {
	@Resource
	private TakeService takeService;
	
   @RequestMapping("/list")
   public String list(@RequestParam(required = false) String latitude,@RequestParam(required = false) String longitude, Model model) {
	   List<BuildingDto> buildings = takeService.selectBuildingList();
	   
	   List<BuildingDto> buildingInfo = new ArrayList<BuildingDto>();
	   for(BuildingDto b : buildings) {
		   String temp = b.getBuildingDetailContent();
		   temp = temp.replace("\r\n", "<br>");
		   b.setBuildingDetailContent(temp);
		   buildingInfo.add(b);
	   }
	   model.addAttribute("buildings", buildingInfo);
	   
	   List<BuildingFileDto> buildingFiles = takeService.selectBuildingFiles();
	   model.addAttribute("buildingFiles",buildingFiles);
	   
	   if(latitude != null) { //만약, 개원에서 넘어왔다면 null이 아닐 것임!
		   model.addAttribute("latitude", latitude);
		   model.addAttribute("longitude",longitude);
	   }else {
		   model.addAttribute("latitude", "0");
		   model.addAttribute("longitude","0");
	   }
	   return "take/list";
   }
   
   //type에 따라서, nomal :일반사진 / pano : 파노라마 사진
   //img는, 상세보기에서 미리보기로 2개 띄울 때, 넘어오는 파라미터!
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
   
   //바이트배열을 파일로 만들어서 출력해줌!
   @RequestMapping("/getImageByteArrayToFile")
   public void getImageByteArrayToFile(HttpServletRequest req, HttpServletResponse res, String buildingNo, String img, @RequestHeader("User-Agent") String userAgent) throws IOException {
	   System.out.println(buildingNo);
	   List<BuildingFileDto> files = takeService.selectImageFileByBuildingNo(buildingNo);

	   
	   int num = Integer.parseInt(img);
	   
	   String contentType = files.get(num).getAttachType();
	   String originalFilename = files.get(num).getAttachOriginalName();
	   
	   res.setContentType(contentType);
	   
	 //다운로드할 파일명을 헤더에 추가
		if(userAgent.contains("Trident") || userAgent.contains("MSIE")) {
			//IE 브라우저일 경우
			originalFilename = URLEncoder.encode(originalFilename, "UTF-8");
		} else {
			//크롬, 엣지, 사파리일 경우
			originalFilename = new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1");
		}
		res.setHeader("Content-Disposition", "attachment; filename=\"" + originalFilename + "\"");
		
		FileCopyUtils.copy(new ByteArrayInputStream(files.get(num).getImageFileData()), res.getOutputStream());
   }
   
   @GetMapping("/view")
   public String view(String buildingNo, Model model, HttpServletRequest request, HttpSession session) {
	  log.info("실행");
	  log.info(buildingNo);
	  
	  //매물 정보
	  BuildingDto buildingDetailBuildingDto = takeService.selectBuildingByBuildingNo(buildingNo);
	  String temp = buildingDetailBuildingDto.getBuildingDetailContent();
	  temp = temp.replace("\r\n", "<br>");
	  buildingDetailBuildingDto.setBuildingDetailContent(temp);
	  log.info(buildingDetailBuildingDto);
	  
	  //해당 매물의 장비들 가져오기
	  List<EquipmentDto> equipDto = takeService.selectEquipmentByBuildingNo(buildingNo);
	  log.info(equipDto);
	  
	  //매물의 첨부파일에 대한 정보를 가져오기
	  List<BuildingFileDto> fileDto = takeService.selectImageFileByBuildingNo(buildingNo);
	  
	  model.addAttribute("buildingInfo", buildingDetailBuildingDto);
	  model.addAttribute("equipments", equipDto);
	  model.addAttribute("imageFile", fileDto);
	  model.addAttribute("from", request.getParameter("from"));
	  model.addAttribute("pageNo", request.getParameter("pageNo"));
	  
	  model.addAttribute("sessionUserId", session.getAttribute("sessionUserId"));
	  
      return "take/view";
   }
   
   @GetMapping("/viewCancle")
   public String viewCancle() {
	  log.info("실행");
      return "take/list";
   }
   
   @RequestMapping("/enroll")
   public String enroll(HttpSession session, String type, String buildingNo, Model model) throws IOException {
	  log.info(session.getAttribute("sessionUserId"));
	  if(session.getAttribute("sessionUserId") == null) {
		  return "redirect:/index/loginForm";
	  }else {
		  model.addAttribute("type", type);
		  
		  //업데이트일 경우!
		  if(type.equals("updateEnroll")) {
			  log.info("update : " + buildingNo);
			  
			  BuildingDto buildingDetailBuildingDto = takeService.selectBuildingByBuildingNo(buildingNo);
			  List<EquipmentDto> equipDto = takeService.selectEquipmentByBuildingNo(buildingNo);
			  List<BuildingFileDto> fileDto = takeService.selectImageFileByBuildingNo(buildingNo);
			  
			  int panoCnt = 0;
			  int nomalCnt = 0;
			  for(BuildingFileDto f : fileDto) {
				  if(f.getPanoramaCheck() == 1) {
					  panoCnt++;
				  }else {
					  nomalCnt++;
				  }
			  }
			  panoCnt--;
			  nomalCnt--;
			  
			  log.info(panoCnt + nomalCnt);
			  
			  model.addAttribute("buildingInfo", buildingDetailBuildingDto);
			  model.addAttribute("equipments", equipDto);
			  
			  model.addAttribute("imageFile", fileDto);
			  model.addAttribute("panoCnt", panoCnt);
			  model.addAttribute("nomalCnt", nomalCnt);
		  }
		  return "take/enroll";
	  }
      
   }
   
   @RequestMapping("/enrollCancle")
   public String enrollCancle() {
      return "redirect:/take/list";
   }
   
   @RequestMapping("/popUpImg")
   public String popUpImg(String buildingNo, Model model) {
	  log.info("실행");
	  model.addAttribute("buildingNo", buildingNo);
	  
	  int filesCnt = takeService.buildingFilesCount(buildingNo);
	  filesCnt--;
	  model.addAttribute("filesCnt", filesCnt);
      return "take/popUpImg";
   }
   
   @RequestMapping("/popUp360Img")
   public String popUp360Img(String buildingNo, Model model) {
	   log.info("실행");
	   model.addAttribute("buildingNo", buildingNo);
	   
	   
      return "take/popUp360Img";
   }
   
   @RequestMapping("/takeoverEnroll")
   public String takeoverEnroll(HttpServletRequest request, 
		   HttpSession session, 
		   @RequestPart("attach_file") List<MultipartFile> files, 
		   @RequestPart(value="attach_aroundFile", required=false) MultipartFile aroundFile, 
		   Model model) throws IOException {
	   
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
	   bdt.setBuildingAvailableDate(new Date(request.getParameter("buildingAvailableDate")));
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
   
   @PostMapping("/message/sending")
  	public void messageSend(MessageDto message, HttpSession session, HttpServletRequest request) {
  	    String userId = (String) session.getAttribute("sessionUserId");
  		int result = takeService.sendMessage(message);
  	}
   
   @RequestMapping(value="/checkLike", produces = "application/json; charset=UTF-8")
   @ResponseBody
   public String checkLike(String id, String type, String buildingNo) {
	   log.info("type : " + type);
	   log.info("id : " + id);
	   log.info("bn : " + buildingNo);
	   LikeListDto lld = new LikeListDto();
	   
	   lld.setLikeListNo(Integer.parseInt(buildingNo));
	   lld.setLikeType(type);
	   lld.setLikeUserId(id);
	   
	   String json;
	   JSONObject jsonObject = new JSONObject();
	   int check = takeService.selectLikeListByBuildingNo(lld);
	   if(check == 1) {
		   jsonObject.put("likeCheck", "like");
	   }else {
		   jsonObject.put("likeCheck", "noLike");
	   }
	   json = jsonObject.toString();
	   return json;
   }
   
   @RequestMapping(value="/setLikeLists", produces = "application/json; charset=UTF-8")
   @ResponseBody
   public String setLikeLists(String check, String id, String type, String buildingNo, String likeCnt) {
	   log.info("type : " + type);
	   log.info("id : " + id);
	   log.info("bn : " + buildingNo);
	   LikeListDto lld = new LikeListDto();
	   
	   lld.setLikeListNo(Integer.parseInt(buildingNo));
	   lld.setLikeType(type);
	   lld.setLikeUserId(id);
	   
	   //누르지 않은 상태일 경우
	   if(check.equals("before")) {
		   takeService.insertLikeLists(lld);
	   }else { //클릭한 것을 취소할 경우
		   takeService.deleteLikeLists(lld);
	   }
	   
	   BuildingDto bdt = new BuildingDto();
	   bdt.setBuildingLikeCount(Integer.parseInt(likeCnt));
	   bdt.setBuildingNo(Integer.parseInt(buildingNo));
	   
	   
	   // 좋아요 수 업데이트
	   takeService.updateLikeCount(bdt);
	   
	   String json;
	   JSONObject jsonObject = new JSONObject();
	   
	   json = jsonObject.toString();
	   return json;
   }
}