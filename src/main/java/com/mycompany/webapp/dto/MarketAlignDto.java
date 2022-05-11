package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class MarketAlignDto {
	//검색 조건
	private String category;
	private String align;
	
	private String searchType;
	private String searchContent;
}
