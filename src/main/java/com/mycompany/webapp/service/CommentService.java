package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CommentDao;
import com.mycompany.webapp.dto.FreeBoardDto;

@Service
public class CommentService {
	@Resource
	private CommentDao commentDao;
	
	public int getCountComments(int freeNo, List<FreeBoardDto> freeboards) {		
		return commentDao.countComment(freeNo);
	}

	
}
