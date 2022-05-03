package com.mycompany.webapp.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MarketFileDto {
	private String attachOriginalName;
	private String attachSaveName;
	private String attachType;
	private int marketNo;
	private int marketFileNo;
	private byte[] imageFileData; //이미지 데이터를 담기 위한 변수
	private MultipartFile marketFileAttach;
}
