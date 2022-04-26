package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MarketBoardDto {
	private int marketNo;
	private String marketTitle;
	private String marketContent;
	private String marketWriter;
	private String marketCategory;
	private Date marketRegistDate;
	private Date marketModifyDate;
	private int marketUseYN;
	private int marketHitCount;
	private String marketPrice;
	private int marketLikeCount;
}
