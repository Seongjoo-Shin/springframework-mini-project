package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.WishListDto;

@Mapper
public interface WishListDao {
	public WishListDto selectByPicturName(WishListDto wishList);

	public int insertItem(WishListDto wishList);

	public List<WishListDto> selectByUserIdAndBuildingNo(WishListDto wishlist);

	public int deleteByWishListNo(WishListDto wishList);

	public void updateCount(WishListDto item);
}
