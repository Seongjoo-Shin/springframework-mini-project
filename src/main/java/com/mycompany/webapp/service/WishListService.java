package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.WishListDao;
import com.mycompany.webapp.dto.WishListDto;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class WishListService {

	@Resource
	private WishListDao wishListDao;
	
	public WishListDto findPictureById(String pictureName) {
		WishListDto dbWishList = wishListDao.selectByPicturName(pictureName);
		
		return dbWishList;
	}
	
	public List<WishListDto> getWishList(WishListDto wishlist) {
		return wishListDao.selectByUserIdAndBuildingNo(wishlist);
	}

	public void addItemToWishList(WishListDto wishList) {
		int row = wishListDao.insertItem(wishList);
	}

	public int deleteItem(int wishListNo) {
		int row = wishListDao.deleteByWishListNo(wishListNo);
		
		return row;
	}

	

}
