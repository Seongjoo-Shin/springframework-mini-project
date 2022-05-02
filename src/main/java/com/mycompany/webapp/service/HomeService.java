package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.HomeDao;
import com.mycompany.webapp.dto.FreeBoardDto;
import com.mycompany.webapp.dto.MarketBoardDto;
import com.mycompany.webapp.dto.NoticeBoardDto;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class HomeService {
	
	@Resource
	private HomeDao homeDao;

	public List<FreeBoardDto> getFreeBoards() {
		return homeDao.selectFreeAll();
	}

	public List<MarketBoardDto> getMarketBoards() {
		return homeDao.selectMarketAll();
	}

	public List<NoticeBoardDto> getNoticeBoards() {
		return homeDao.selectNoticeAll();
	}
}
