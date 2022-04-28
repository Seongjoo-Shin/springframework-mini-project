package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommentDto {
	private int freeNo;
	private int commentNo;
	private String commentWriter;
	private String commentContent;
	private Date commentRegistDate;
	private Date commentModifyDate;
	private int commentUseYN;
	private int upperNo;
	private int commentDepth;
}
