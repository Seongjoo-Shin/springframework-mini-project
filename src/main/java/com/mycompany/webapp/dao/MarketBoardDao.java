package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.mycompany.webapp.dto.MarketBoardDto;
import com.mycompany.webapp.dto.MarketFileDto;
import com.mycompany.webapp.dto.PagerDto;

@Mapper
public interface MarketBoardDao {
	
	//페이지당 가져오는 marketboardDto
	public List<MarketBoardDto> selectByPage(PagerDto pagerDto);
	
	//거래게시판 전체 게시물 개수
	public int totalCount();
	
	//리스트에서 대표사진 보여줌.
	public List<MarketFileDto> selectImageFileByMarketNo(int marketNo);
	
	//like count update
	public void updateLikeCount(MarketBoardDto marketBoardDto);
	
	//게시글 등록
	public int insertMarket(MarketBoardDto marketBoardDto);

	//게시물의 파일 등록
	public void insertMarketFile(MarketFileDto marketFileDto);
	
	//view 페이지에 들어갈 marketBord정보 가져오기
	public MarketBoardDto selectMarketBoardByMarketNo(int marketNo);

	public int updateHitCount(int marketNo);	
	
}
