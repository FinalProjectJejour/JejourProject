package com.kh.jejour.admin.model.service;

import java.util.List;

import com.kh.jejour.flashBoard.model.vo.FlashBoard;
import com.kh.jejour.flashComment.model.vo.FlashComment;
import com.kh.jejour.hotspotBoard.model.vo.HotspotBoard;
import com.kh.jejour.hotspotComment.model.vo.HotspotComment;
import com.kh.jejour.member.model.vo.Member;

public interface AdminService {
	List<Member> selectMemberList();
	
	List<FlashBoard> selectFlashBoardLsit();
	
	List<FlashBoard> fBoardRanking();
	
	List<FlashComment> fCommentRanking();
	
	List<HotspotBoard> selectHotspotBoardList();
	
	List<HotspotBoard> hBoardRanking();
	
	List<HotspotComment> hCommentRanking();
	
	int banMember(String userId);
	
	int deleteHotspotBoard(int hNo);
	
	int deleteFlashBoard(int fNo);
	
	int flashBoardStatusChange(int hNo);
	
	int hotspotBoardStatusChange(int fno);
}
