package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.UserDto;

@Mapper
public interface UserDao {
	public UserDto selectByUserId(String userId);
	public UserDto selectByUserNickname(String nickname);
	public UserDto selectByUserEmail(String email);
	public int insert(UserDto user);
}
