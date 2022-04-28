package com.mycompany.webapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.mycompany.webapp.dto.FreeBoardDto;
import com.mycompany.webapp.dto.PagerDto;

@Mapper
public interface FreeBoardDao {
	public List<FreeBoardDto> selectByPage(PagerDto pagerDto);
	public int count();
	public FreeBoardDto selectByBno(int bno);
	public int insert(FreeBoardDto freeBoardDto);	//작성
	public int deleteByBno(int bno);
	public int update(FreeBoardDto freeBoardDto);
	
	//view에서 활용
	public FreeBoardDto selectByFreeNo(int freeNo);
	
	public int freeboardInsert(FreeBoardDto freeBoardDto);
}
