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

	public int insert(FreeBoardDto freeBoardDto);	//작성
	//자유게시판 게시물 삭제 (본인의 게시물을 자유게시판에서 삭제하는 것임.) -> 나중에 댓글 지우는것 까지 연계
	public int deleteByFreeNo(int bno);

	//view에서 활용
	public FreeBoardDto selectByFreeNo(int freeNo);
	
	//자유게시판 내용 작성하고 insert
	public int freeboardInsert(FreeBoardDto freeBoardDto);
	
	//자유게시판 내용 수정
	public void update(FreeBoardDto freeBoardDto);
	
	//자유게시판 조회수 증가
	public void updateHitCount(int freeNo);
}
