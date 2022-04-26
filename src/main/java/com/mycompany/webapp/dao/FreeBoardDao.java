package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.mycompany.webapp.dto.FreeBoardDto;
import com.mycompany.webapp.dto.PagerDto;

@Mapper
public interface FreeBoardDao {
	public List<FreeBoardDto> selectByPage(PagerDto pagerDto);
	public int count();
	public FreeBoardDto selectByBno(int bno);
	public int insert(FreeBoardDto freeBoardDto);
	public int deleteByBno(int bno);
	public int update(FreeBoardDto freeBoardDto);
	
	//댓글 수 -> 게시물에 해당하는 댓글 개수
	public int countCommnet(int freeNo);
	
	//view에서 활용
	public FreeBoardDto selectByFreeNo(int freeNo);
}
