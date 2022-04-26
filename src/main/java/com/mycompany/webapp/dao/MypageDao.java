package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.BuildingDto;
import com.mycompany.webapp.dto.FreeBoardDto;
import com.mycompany.webapp.dto.MarketBoardDto;
import com.mycompany.webapp.dto.MessageDto;
import com.mycompany.webapp.dto.NoticeBoardDto;
import com.mycompany.webapp.dto.PagerDto;
import com.mycompany.webapp.dto.UserDto;

@Mapper
public interface MypageDao {
	
	// 내정보를 가져오기
	public UserDto selectUser(String userId);
	
	// 내정보수정
	public int updatePassword(UserDto user); // 비밀번호 수정
	public String selectPassword(String userId); // 비밀번호 체크를 위한 메소드
	
	// 작성글
	public List<NoticeBoardDto> selectNoticeBoardList(PagerDto pager, UserDto user); // 본인이 작성한 공지사항 게시물 검색
	public List<MarketBoardDto> selectMarketBoardList(PagerDto pager, UserDto user); // 본인이 작성항 거래게시판 검색
	public List<FreeBoardDto> selectFreeBoardList(PagerDto pager, UserDto user); // 본인이 작성한 자유게시판 검색
	
	// 쪽지함
	public List<MessageDto> selectReceiveMessageList(UserDto user, PagerDto pager); // 받은 메세지함 
	public List<MessageDto> selectSendMessage(UserDto user, PagerDto pager); // 보낸 메세지함
	public int sendMessage(String userId); // 마이페이지 메시지 보내기
	public MessageDto selectReceiveMessage(int messageNo); // 받은 메세지 보기
	public int deleteMessage(int messageNo); // 메세지 삭제하기
	public int updateMessageStatus(int messageNo); // 회신여부 설정
	
	// 찜목록
	public List<BuildingDto> selectBuildingListList(PagerDto pager, UserDto user); // 본인이 관심있는 인수목록 리스트
	public int updateLikeBuilding(int buildingNo, UserDto user); // 본인의 관심 인수매물 삭제
	
	public List<MarketBoardDto> selectMarketListList(PagerDto pager, UserDto user); // 본인이 관심있는 거래매물 리스트
	public int updateListMarket(int marketNo, UserDto user); // 본인의 관심 거래매물 삭제
	
	// 회원 탈퇴
	public int userWithdrawal(UserDto user);
	
}
