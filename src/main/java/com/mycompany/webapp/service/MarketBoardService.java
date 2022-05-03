package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MarketBoardDao;
import com.mycompany.webapp.dto.MarketBoardDto;
import com.mycompany.webapp.dto.MarketFileDto;
import com.mycompany.webapp.dto.PagerDto;

import lombok.extern.java.Log;
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
	public List<MarketBoardDto> getMarketBoards(PagerDto pagerDto) {
		return marketBoardDao.selectByPage(pagerDto);
	}
	
	//리스트에서 대표사진 보여줄 때, view 페이지에서 marketfile정보 가져올 때
	public List<MarketFileDto> selectImageFileByMarketNo(int marketNo) {
		return marketBoardDao.selectImageFileByMarketNo(marketNo);
	}
	
	//update like count
	public void updateLikeCount(MarketBoardDto marketBoardDto) {
		marketBoardDao.updateLikeCount(marketBoardDto);
	}
	
	//insertMarket
	public int insertMarket(MarketBoardDto marketBoardDto) {
		int marketNo = marketBoardDao.insertMarket(marketBoardDto);
		return marketNo;
	}
	
	//insertMarketFile
	public void insertMarketFile(MarketFileDto marketFileDto) {
		marketBoardDao.insertMarketFile(marketFileDto);
	}
	
	//view 페이지에 들어갈 marketBord정보 가져오기
	public void getMarketBoard(int marketNo) {
		// TODO Auto-generated method stub
		marketBoardDao.selectMarketBoardByMarketNo(marketNo);
	}

}
