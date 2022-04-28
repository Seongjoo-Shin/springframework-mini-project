package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MessageDto {
	private int messageNo;
	private String messageTitle;
	private String messageContent;
	private Date messageDate;
	private String messageSender;
	private String messageReceiver;
	private int messageReplyYN;
}
