package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeBoardDto {
	private int noticeNo;
	private String noticeWriter;
	private String noticeTitile;
	private String noticeContent;
	private String noticeFileSeq;
	private Date noticeRegistDate;
	private Date noticeModifyDate;
	private int noticeUseYN;
	private int noticeHitCount;
}
