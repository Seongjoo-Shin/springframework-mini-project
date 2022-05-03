package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class WishListDto {
	private int wishListNo;
	private String userId;
	private int buildingNo;
	private String interiorName;
	private String interiorPrice;
	private String pictureName;
}
