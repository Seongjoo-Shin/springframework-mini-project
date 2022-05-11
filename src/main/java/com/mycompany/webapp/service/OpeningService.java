package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.OpeningDao;
import com.mycompany.webapp.dto.KeyWordDto;

@Service
public class OpeningService {

	@Resource
	private OpeningDao openingDao;
	
	public List<KeyWordDto> getKeywordPlace(KeyWordDto keyword) {
		return openingDao.selectKeyword(keyword);
	}

	public KeyWordDto getKeyword(int keywordNo) {
		return openingDao.selectOneKeyword(keywordNo);
	}
}
