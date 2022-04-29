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

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
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
	
	// --------------------- 작성글 자유게시판 ------------------------------
	
	public List<FreeBoardDto> getMyFreeBoardList(PagerDto pager){
		return mypageDao.selectFreeBoardList(pager);
	}

	public int getTotalFreeboardCount(String userId) {
		return mypageDao.selectAllFreeBoard(userId);
	}

	public int deleteMyPosting(List<String> delArr) {
		int cnt = 0;
		for(String s : delArr) {
			mypageDao.deleteYnMyPosting(Integer.parseInt(s));
		}
		return cnt;
	}
	
	// --------------------- 작성글 거래게시판 ------------------------------
	
	public List<MarketBoardDto> getMyMarketBoardList(PagerDto pager){
		return mypageDao.selectMarketBoardList(pager);
	}
	
	public int getTotalMarketboardCount(String userId) {
		return mypageDao.selectAllMarketBoard(userId);
	}

	public int deleteMyMarket(List<String> delArr) {
		int cnt = 0;
		for(String s : delArr) {
			mypageDao.deleteYnMyMarket(Integer.parseInt(s));
		}
		return cnt;
	}
	
	// --------------------- 작성글 인수매물 ------------------------------
	public List<BuildingDto> getMyBuildingList(PagerDto pager){
		return mypageDao.selectBuildingList(pager);
	}
	
	public int getTotalBuildingCount(String userId) {
		return mypageDao.selectAllBuilding(userId);
	}

	public int deleteMyBuilding(List<String> delArr) {
		int cnt = 0;
		for(String s : delArr) {
			mypageDao.deleteYnMyBuilding(Integer.parseInt(s));
		}
		return cnt;
	}
	

	// --------------------- 쪽지함 기능 ------------------------------
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
			cnt = mypageDao.deleteMyMessage(Integer.parseInt(s));
		}
		return cnt;	
	}

	public List<MessageDto> getMessageByNo(int messageNo) {
		log.info("실행");
		return mypageDao.selectMessageByNo(messageNo);
	}

	public int sendMessage(MessageDto message) {
		return mypageDao.insertMessage(message);
	}

	public int checkReceivedMsg(int changeNo) {
		return mypageDao.updateReplyYN(changeNo);
	}
	
	// --------------------- 사용자 탈퇴 ------------------------------
	public int userWithdrawal(UserDto user) {
		return mypageDao.userWithdrawal(user);
	}
}
