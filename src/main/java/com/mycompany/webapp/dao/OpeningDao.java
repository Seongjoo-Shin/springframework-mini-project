package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.KeyWordDto;

@Mapper
public interface OpeningDao {
	
	public List<KeyWordDto> selectKeyword(); // 키워드 
	
}
