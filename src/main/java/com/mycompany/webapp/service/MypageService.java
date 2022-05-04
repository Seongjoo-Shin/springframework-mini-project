package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MypageDao;
import com.mycompany.webapp.dto.BuildingDto;
import com.mycompany.webapp.dto.BuildingFileDto;
import com.mycompany.webapp.dto.FreeBoardDto;
import com.mycompany.webapp.dto.LikeListDto;
import com.mycompany.webapp.dto.MarketBoardDto;
import com.mycompany.webapp.dto.MarketFileDto;
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
			cnt += mypageDao.deleteYnMyPosting(Integer.parseInt(s));
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

	public int deleteMyMarket(int marketNo) {
		int cnt = mypageDao.deleteYnMyMarket(marketNo);
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
			cnt += mypageDao.deleteYnMyBuilding(Integer.parseInt(s));
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
	
	public int deleteMySendMessage(List<String> delArr) {
		int cnt = 0;
		for(String s : delArr) {
			cnt = mypageDao.deleteMySendMessage(Integer.parseInt(s));
		}
		return cnt;	
	}
	
	public int deleteMyReceiveMessage(List<String> delArr) {
		int cnt = 0;
		for(String s : delArr) {
			cnt = mypageDao.deleteMyReceiveMessage(Integer.parseInt(s));
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
	
	
	// --------------------- 찜목록 인수 ------------------------------
	public List<BuildingDto> getLikeBuilding(PagerDto pager) {
		return mypageDao.selectLikeListWithBuilding(pager);
	}

	public int getLikeBuildingCnt(String userId) {
		return mypageDao.selectLikeBuildingCnt(userId);
	}

	public List<BuildingFileDto> selectImageFileByBuildingNo(String buildingNo) {
		return mypageDao.selectImageFileByBuildingNo(buildingNo);
	}

	public int deleteLikeBuilding(LikeListDto likeList) {
		return mypageDao.deleteLikeBuilding(likeList);
	}

	public int updateBuildingLikeCount(int buildingNo) {
		return mypageDao.updateBuildingLikeCount(buildingNo);
	}

	// --------------------- 찜목록 마켓 ------------------------------
	public List<MarketBoardDto> getLikeMarket(PagerDto pager){
		return mypageDao.selectLikeListWithMarket(pager);
	}
	
	public int getLikeMarketCnt(String userId) {
		return mypageDao.selectLikeMarketCnt(userId);
	}
	
	public int deleteLikeMarket(LikeListDto likeList) {
		return mypageDao.deleteLikeMarket(likeList);
	}

	public int updateMarketLikeCount(int marketNo) {
		return mypageDao.updateMarketLikeCount(marketNo);
	}

	public List<MarketFileDto> selectImageFileByMarketNo(int marketNo) {
		return mypageDao.selectImageFileByMarketNo(marketNo);
	}

	public int changeSalesStatus(int marketNo) {
		return mypageDao.updateSalesYN(marketNo);
	}
}
