package com.mycompany.webapp.security;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class UserCustom extends User{

	public UserCustom(
			String userId, 
			String userPassword, 
			int userEnabled, 
			List<GrantedAuthority> userAuthorities) {
		super(userId, userPassword, true, true, true, true, userAuthorities);
		// TODO Auto-generated constructor stub
	}

}
