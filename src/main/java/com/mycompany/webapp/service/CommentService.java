package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CommentDao;
import com.mycompany.webapp.dto.CommentDto;
import com.mycompany.webapp.dto.PagerDto;

@Service
public class CommentService {
	@Resource
	private CommentDao commentDao;
	
	//전체 게시물 개수 가져오기
	public int totalCountwhenFreeNo(int freeNo) {
		if(commentDao.count(freeNo)==null) {
			return 0;
		}else {
			return commentDao.count(freeNo);
		}
	}
	
	public List<CommentDto> getselectByFreeNo(PagerDto pagerDto){
		return commentDao.selectByFreeNo(pagerDto);
	}
	
	//댓글 등록 <upperNo가 null 이고, depth가 0일 때>
	public void insertComment(CommentDto commentDto) {
		commentDao.insertComment(commentDto);
	}
	
	//댓글 삭제
	public void deleteComment(CommentDto commentNo) {
		commentDao.deleteComment(commentNo);
	}
	
	//댓글 수정
	public void updateComment(CommentDto commentDto) {
		commentDao.updateComment(commentDto);
	}
	
	//대댓글 등록
	public int insertReplyComment(CommentDto commentDto) {
		return commentDao.insertReplyComment(commentDto);
	}
}
