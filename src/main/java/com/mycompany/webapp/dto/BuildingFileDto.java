package com.mycompany.webapp.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BuildingFileDto {
	private int buildingNo; //buildings의 buildingNo와 연결되는 FK
	private int buildingFileNo; //빌딩 파일의 PK
	private String attachOriginalName;
	private String attachSaveName;
	private String attachType;
	private int panoramaCheck;
	
	//이미지 데이터를 담기 위한 변수
	private byte[] imageFileData;
}
