package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.NoticeBoardDao;
import com.mycompany.webapp.dto.NoticeBoardDto;
import com.mycompany.webapp.dto.PagerDto;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class NoticeService {
	@Resource
	NoticeBoardDao noticeBoardDao;
	
	public int totalCount() {
		int num = noticeBoardDao.count();
		log.info("totalCount: " + num);
		return num;
	}

	public List<NoticeBoardDto> getNoticeBoardByPage(PagerDto pager) {
		return noticeBoardDao.selectByPage(pager);
	}

	public NoticeBoardDto getNoticeBoardByNoticeNo(int noticeNo) {	
		return noticeBoardDao.selectByNoticeNo(noticeNo);
	}

	public void updateHitCount(int noticeNo) {
		noticeBoardDao.updateHitCount(noticeNo);
	}
	
	public void noticeBoardInsert(NoticeBoardDto noticeBoardDto) {
		noticeBoardDao.noticeBoardInsert(noticeBoardDto);
	}
}
