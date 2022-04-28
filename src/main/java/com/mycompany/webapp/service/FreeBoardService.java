package com.mycompany.webapp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CommentDao;
import com.mycompany.webapp.dao.FreeBoardDao;

import com.mycompany.webapp.dto.FreeBoardDto;

import com.mycompany.webapp.dto.PagerDto;

@Service
public class FreeBoardService {
	
	@Resource
	private FreeBoardDao freeBoardDao;
	@Resource
	private CommentDao commentDao;
	
	//게시물 --------------------------------------------------------------------------------
	//전체 게시물 갯수 가져오기
	public int getTotalFreeBoardNum() {
		return freeBoardDao.count();
	}
	
	public List<FreeBoardDto> getFreeBoards(PagerDto pagerDto) {
		return freeBoardDao.selectByPage(pagerDto);
	}
	
	public FreeBoardDto getFreeBoard(int freeNo) {
		return freeBoardDao.selectByFreeNo(freeNo);
	}
	
	public void insertFreeBoard(FreeBoardDto freeBoardDto) {
		freeBoardDao.freeboardInsert(freeBoardDto);
	}
	
	public void deleteFreeBoard(int freeNo) {
		freeBoardDao.deleteByFreeNo(freeNo);
	}
	
	public void updateFreeBoard(FreeBoardDto freeBoardDto) {
		freeBoardDao.update(freeBoardDto);
	}
	
	public void setupdateHitCount(int freeNo) {
		freeBoardDao.updateHitCount(freeNo);
	}
	
	//댓글 --------------------------------------------------------------------------------
	
}
