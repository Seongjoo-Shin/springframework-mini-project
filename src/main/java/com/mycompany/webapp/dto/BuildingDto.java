package com.mycompany.webapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BuildingDto {
	private int buildingNo; //PK
	private String buildingName;
	private String buildingAddr;
	private String buildingAddrDetail;
	private String buildingLatitude;
	private String buildingLongitude;
	private String buildingTradeInfo;
	private String buildingTakeoverPrice;
	private String buildingDepositPrice;
	private String buildingMonthRent;
	private String buildingPrice;
	private Date buildingAvailableDate;
	private String buildingDetailContent;
	private int buildingUseYN;
	private String buildingWriter; //users의 userid와 연결되는 FK
	private String buildingSupplyArea; //공급 면적
	private String buildingDedicatedArea; // 전용 면적
	private int buildingTotalFloor;
	private int buildingFloor;
	private String buildingOption;
	private Date buildingRegistDate;
	private int buildingLikeCount;
	
}
