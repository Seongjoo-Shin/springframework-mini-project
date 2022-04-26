package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.UserDao;
import com.mycompany.webapp.dto.UserDto;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class UserService {
	public enum LoginResult{
		SUCCESS, FAIL_USERID, FAIL_USERPASSWORD, FAIL
	}
	
	@Resource
	private UserDao userDao;
	
	public LoginResult loginUser(UserDto user) {
		UserDto dbUser =  userDao.selectByUserId(user.getUserId());
		log.info(dbUser);
		if(dbUser == null) {
			return LoginResult.FAIL_USERID;
		} else {
			if(dbUser.getUserPassword().equals(user.getUserPassword())) {
				return LoginResult.SUCCESS;
			}
			return LoginResult.FAIL_USERPASSWORD;
		}
	}

	public void signUp(UserDto user) {
		log.info("service : " + user);
		userDao.insert(user);
	}

}
