package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.UserDao;
import com.mycompany.webapp.dto.UserDto;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class UserService {
	public enum SignUpResult{
		SUCCESS, FAIL, DUPLICATED
	}
	
	public enum LoginResult{
		SUCCESS, FAIL_USERID, FAIL_USERPASSWORD, FAIL
	}
	
	@Resource
	private UserDao userDao;
	
	public LoginResult login(UserDto user) {
		UserDto dbUser =  userDao.selectByUserId(user.getUserId());
		log.info(dbUser);
		if(dbUser == null) {
			return LoginResult.FAIL_USERID;
		} else {
			PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			if(passwordEncoder.matches(user.getUserPassword(), dbUser.getUserPassword())) {
				return LoginResult.SUCCESS;
			}
			return LoginResult.FAIL_USERPASSWORD;
		}
	}

	public SignUpResult signUp(UserDto user) {
		UserDto dbUser =  userDao.selectByUserId(user.getUserId());
	    if(dbUser == null) {
	       PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		   //PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	       user.setUserPassword(passwordEncoder.encode(user.getUserPassword()));
	       int result = userDao.insert(user);
	       return SignUpResult.SUCCESS;
	    } else {
	       return SignUpResult.DUPLICATED;
	    }
	}

	public LoginResult checkId(String id) {
		UserDto dbUser = userDao.selectByUserId(id);
		if(dbUser==null) {
			return LoginResult.SUCCESS;
		} else {
			return LoginResult.FAIL_USERID;
		}
	}

	public LoginResult checkNickname(String nickname) {
		UserDto dbUser = userDao.selectByUserNickname(nickname);
		if(dbUser==null) {
			return LoginResult.SUCCESS;
		} else {
			return LoginResult.FAIL_USERID;
		}
	}

	public LoginResult checkEmail(String email) {
		UserDto dbUser = userDao.selectByUserEmail(email);
		if(dbUser==null) {
			return LoginResult.FAIL;
		} else {
			return LoginResult.SUCCESS;
		}
	}
	
	public String getNickname(String id) {
		UserDto dbUser = userDao.selectByUserId(id);
		String dbUSerNickname = dbUser.getUserNickname();
		return dbUSerNickname;
	}

	public String findIdByEmail(String findInputEmail) {
		UserDto dbUser = userDao.selectByUserEmail(findInputEmail);
		return dbUser.getUserId();
	}

	public String findPasswordByEmail(String emailValue) {
		UserDto dbUser = userDao.selectByUserEmail(emailValue);
		return dbUser.getUserPassword();
	}
	
	public UserDto findPasswordByEmail1(String emailValue) {
		UserDto dbUser = userDao.selectByUserEmail(emailValue);
		return dbUser;
	}

	public int updateNewPassword(UserDto user) {
		int row = userDao.updatePasswordById(user);
		return row;
	}


}
