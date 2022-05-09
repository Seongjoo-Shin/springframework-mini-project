package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MarketBoardDao;
import com.mycompany.webapp.dto.MarketBoardDto;
import com.mycompany.webapp.dto.MarketFileDto;
import com.mycompany.webapp.dto.MarketPagerDto;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class MarketBoardService {
	@Resource
	private MarketBoardDao marketBoardDao;
	
	//전체 게시물 갯수 가져오기
	public int getTotalMarketBoardCount() {
		log.info("실행");
		int total =  marketBoardDao.totalCount();
		return total;
	}
	
	//페이지당 가져오는 marketboardDto 정보 
	public List<MarketBoardDto> getMarketBoards(MarketPagerDto pagerDto) {
		return marketBoardDao.selectByPage(pagerDto);
	}
	
	//리스트에서 대표사진 보여줄 때, view 페이지에서 marketfile정보 가져올 때
	public List<MarketFileDto> selectImageFileByMarketNo(int marketNo) {
		return marketBoardDao.selectImageFileByMarketNo(marketNo);
	}
	
	//update like count
	public void updateLikeCount(int marketNo) {
		marketBoardDao.updateLikeCount(marketNo);
	}
	
	//update like count
	public void updateLikeCountDown(int marketNo) {
		marketBoardDao.updateLikeCountDown(marketNo);
	}	
	
	//insertMarket
	public int insertMarket(MarketBoardDto marketBoardDto) {
		return marketBoardDao.insertMarket(marketBoardDto);
	}
	
	//insertMarketFile
	public void insertMarketFile(MarketFileDto marketFileDto) {
		marketBoardDao.insertMarketFile(marketFileDto);
	}
	
	//view 페이지에 들어갈 marketBord정보 가져오기
	public MarketBoardDto getMarketBoard(int marketNo) {
		// TODO Auto-generated method stub
		return marketBoardDao.selectMarketBoardByMarketNo(marketNo);
	}

	public int setUpdateHitCount(int marketNo) {
		// TODO Auto-generated method stub
		return marketBoardDao.updateHitCount(marketNo);
	}

	//수정내용 업데이트(아직 파일은 업데이트 되지 않음.)
	public void updateMarketBoard(MarketBoardDto marketBoardDto) {
		// TODO Auto-generated method stub
		marketBoardDao.updateMarketBoard(marketBoardDto);
	}

	public void deleteImageByFileNo(int marketFileNo) {
		// TODO Auto-generated method stub
		marketBoardDao.deleteImageByFileNo(marketFileNo);
		
	}

	public void updateSaleYn(int marketNo) {
		// TODO Auto-generated method stub
		marketBoardDao.updateSaleYn(marketNo);
	}
	
	public void deleteMarketBoardByMarketNo(int marketNo) {
		marketBoardDao.deleteMarketBoardByMarketNo(marketNo);
	}

}
