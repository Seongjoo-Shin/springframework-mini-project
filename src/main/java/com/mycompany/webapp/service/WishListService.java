package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.WishListDao;
import com.mycompany.webapp.dto.WishListDto;

@Service
public class WishListService {

	@Resource
	private WishListDao wishListDao;
	
	public WishListDto findPictureById(String pictureName) {
		WishListDto dbWishList = wishListDao.selectByPicturName(pictureName);
		
		return dbWishList;
	}
	
	public List<WishListDto> getWishList(String userId) {
		return wishListDao.selectByUserId(userId);
	}

	public void addItemToWishList(WishListDto wishList) {
		int row = wishListDao.insertItem(wishList);
	}

	public int deleteItem(int wishListNo) {
		int row = wishListDao.deleteByWishListNo(wishListNo);
		
		return row;
	}

	

}
