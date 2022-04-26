package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MypageDao;
import com.mycompany.webapp.dto.UserDto;

@Service
public class MypageService {
	
	@Resource
	private MypageDao mypageDao;
	
	public UserDto getUser(String userId) {
		return mypageDao.selectUser(userId);
	}
	
	public String getPassword(String userId) {
		return mypageDao.selectPassword(userId);
	}
	
	public int changePassword(UserDto user) {
		return mypageDao.updatePassword(user);
	}
	
	public int userWithdrawal(UserDto user) {
		return mypageDao.userWithdrawal(user);
	}
}
