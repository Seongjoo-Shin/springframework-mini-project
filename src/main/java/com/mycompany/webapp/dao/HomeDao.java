package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.FreeBoardDto;
import com.mycompany.webapp.dto.MarketBoardDto;
import com.mycompany.webapp.dto.NoticeBoardDto;

@Mapper
public interface HomeDao {

	public List<FreeBoardDto> selectFreeAll();

	public List<MarketBoardDto> selectMarketAll();

	public List<NoticeBoardDto> selectNoticeAll();

}
