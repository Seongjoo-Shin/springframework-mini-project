package com.mycompany.webapp.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeFileDto {
	private String attachOriginalName;
	private String attachSaveName;
	private String attachType;
	private int noticeNo;
	private int noticeFileNo;
	private MultipartFile fileAttach;
}
