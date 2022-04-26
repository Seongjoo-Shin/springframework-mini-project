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
	private MultipartFile fileAttach;
}
