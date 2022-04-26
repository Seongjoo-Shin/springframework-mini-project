package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class UserDto {
	private String userId;
	private String userPassword;
	private String userEmail;
	private String userName;
	private String userPhone;
	private String userNickname;
	private String userRole;
	private int userEnabled;
	private Date userJoinDate;
	private Date userWithdrawalDate;
}
