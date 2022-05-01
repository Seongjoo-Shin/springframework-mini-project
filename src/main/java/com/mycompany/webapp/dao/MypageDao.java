package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.BuildingDto;
import com.mycompany.webapp.dto.BuildingFileDto;
import com.mycompany.webapp.dto.FreeBoardDto;
import com.mycompany.webapp.dto.LikeListDto;
import com.mycompany.webapp.dto.MarketBoardDto;
import com.mycompany.webapp.dto.MessageDto;
import com.mycompany.webapp.dto.PagerDto;
import com.mycompany.webapp.dto.UserDto;

@Mapper
public interface MypageDao {
	
	// 내정보를 가져오기
	public UserDto selectUser(String userId);
	
	// 내정보수정
	public int updatePassword(UserDto user); // 비밀번호 수정
	public UserDto selectPassword(String userId); // 비밀번호 체크를 위한 메소드
	
	// 작성글
	// 자유게시판
	public List<FreeBoardDto> selectFreeBoardList(PagerDto pager); // 본인이 작성한 자유게시판 검색	
	public int selectAllFreeBoard(String userId);
	public int deleteYnMyPosting(int freeNo);
	// 거래게시판
	public List<MarketBoardDto> selectMarketBoardList(PagerDto pager); // 본인이 작성항 거래게시판 검색
	public int selectAllMarketBoard(String userId);
	public int deleteYnMyMarket(int marketNo);
	// 인수/매물
	public List<BuildingDto> selectBuildingList(PagerDto pager); // 본인이 작성한 공지사항 게시물 검색
	public int selectAllBuilding(String userId);
	public int deleteYnMyBuilding(int buildingNo);
	
	// 쪽지함
	public List<MessageDto> selectReceiveMessageList(PagerDto pager); // 받은 메세지함 
	public List<MessageDto> selectSendMessageList(PagerDto pager); // 보낸 메세지함
	public int sendMessage(String userId); // 마이페이지 메시지 보내기
	public MessageDto selectReceiveMessage(int messageNo); // 받은 메세지 보기
	public int deleteMessage(int messageNo); // 메세지 삭제하기
	public int updateMessageStatus(int messageNo); // 회신여부 설정
	public int selectReceiveMessageAll(String userId);
	public int selectSendMessageAll(String userId);
	public int deleteMyMessage(int parseInt);
	public List<MessageDto> selectMessageByNo(int messageNo);
	public int insertMessage(MessageDto message);
	public int updateReplyYN(int changeNo);
	
	// 찜목록
	public List<BuildingDto> selectLikeListWithBuilding(PagerDto pager); // 본인이 관심있는 인수목록 리스트
	public int selectLikeBuildingCnt(String userId);
	public List<BuildingFileDto> selectImageFileByBuildingNo(String buildingNo);
	public int deleteLikeBuilding(LikeListDto likeList); // 본인의 관심 인수매물 삭제
	public int updateBuildingLikeCount(int buildingNo);

	
	public List<MarketBoardDto> selectMarketListList(PagerDto pager, UserDto user); // 본인이 관심있는 거래매물 리스트
	public int updateListMarket(int marketNo, UserDto user); // 본인의 관심 거래매물 삭제
	
	// 회원 탈퇴
	public int userWithdrawal(UserDto user);
	
}
