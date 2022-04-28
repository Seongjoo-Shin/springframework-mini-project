package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MypageDao;
import com.mycompany.webapp.dto.BuildingDto;
import com.mycompany.webapp.dto.FreeBoardDto;
import com.mycompany.webapp.dto.MarketBoardDto;
import com.mycompany.webapp.dto.MessageDto;
import com.mycompany.webapp.dto.PagerDto;
import com.mycompany.webapp.dto.UserDto;

@Service
public class MypageService {
	
	@Resource
	private MypageDao mypageDao;
	
	public UserDto getUser(String userId) {
		return mypageDao.selectUser(userId);
	}
	
	public UserDto getPassword(String userId) {
		return mypageDao.selectPassword(userId);
	}
	
	public int changePassword(UserDto user) {
		return mypageDao.updatePassword(user);
	}
	
	public List<FreeBoardDto> getMyFreeBoardList(PagerDto pager){
		return mypageDao.selectFreeBoardList(pager);
	}
	
	public List<MarketBoardDto> getMyMarketBoardList(PagerDto pager, String userId){
		return mypageDao.selectMarketBoardList(pager, userId);
	}
	
	public List<BuildingDto> getMyBuildingList(PagerDto pager, String userId){
		return mypageDao.selectBuildingList(pager, userId);
	}
	
	public int userWithdrawal(UserDto user) {
		return mypageDao.userWithdrawal(user);
	}

	public int getTotalFreeboardCount(String userId) {
		return mypageDao.selectAllFreeBoard(userId);
	}

	public int deleteMyPosting(List<String> delArr) {
		int cnt = 0;
		for(String s : delArr) {
			mypageDao.updateYnMyPosting(Integer.parseInt(s));
		}
		return cnt;
	}
	
	public List<MessageDto> getMessageReceiveList(PagerDto pager){
		return mypageDao.selectReceiveMessageList(pager);
	}
	
	public List<MessageDto> getMessageSendList(PagerDto pager){
		return mypageDao.selectSendMessageList(pager);
	}

	public int getTotalReceiveMessage(String userId) {
		return mypageDao.selectReceiveMessageAll(userId);
	}
	
	public int getTotalSendMessage(String userId) {
		return mypageDao.selectSendMessageAll(userId);
	}
	
	public int deleteMyMessage(List<String> delArr) {
		int cnt = 0;
		for(String s : delArr) {
			mypageDao.updateYnMyMessage(Integer.parseInt(s));
		}
		return cnt;	
	}
}
