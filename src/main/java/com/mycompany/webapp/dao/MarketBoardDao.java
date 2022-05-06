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
	public void updateLikeCount(int marketNo);
	
	//like count update
	public void updateLikeCountDown(int marketNo);
	
	//게시글 등록
	public int insertMarket(MarketBoardDto marketBoardDto);

	//게시물의 파일 등록
	public void insertMarketFile(MarketFileDto marketFileDto);
	
	//view 페이지에 들어갈 marketBord정보 가져오기
	public MarketBoardDto selectMarketBoardByMarketNo(int marketNo);

	public int updateHitCount(int marketNo);
	
	//판매 완료 표시
	public void updateSaleYn(int marketNo);

	//수정내용 업데이트(아직 파일은 업데이트 되지 않음.)
	public void updateMarketBoard(MarketBoardDto marketBoardDto);
	
	//수정시 사진 지움
	public void deleteImageByFileNo(int marketFileNo);
	
	//MarketNo를 사용하여 글과 사진 삭제
	public void deleteMarketBoardByMarketNo(int marketNo);
	
}
