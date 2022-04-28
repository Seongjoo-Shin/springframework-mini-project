package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.CommentDto;
import com.mycompany.webapp.dto.PagerDto;

@Mapper
public interface CommentDao {
	//댓글 전체 요청
	public List<CommentDto> selectByFreeNo(PagerDto pagerDto);
	//댓글 등록 <upperNo가 null 이고, depth가 0일 때>
	public void insertComment(CommentDto commentDto);
	//댓글 삭제
	public void deleteComment(int commentNo);
}
