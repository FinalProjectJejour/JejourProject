package com.kh.jejour.admin.model.service;

import java.util.List;

import com.kh.jejour.flashBoard.model.vo.FlashBoard;
import com.kh.jejour.flashComment.model.vo.FlashComment;
import com.kh.jejour.hotspotBoard.model.vo.HotspotBoard;
import com.kh.jejour.hotspotComment.model.vo.HotspotComment;
import com.kh.jejour.member.model.vo.Member;
import com.kh.jejour.planner.model.vo.Planner;

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
	
	List<FlashBoard> flashBoardStatusChange(FlashBoard fb);
	
	List<HotspotBoard> hotspotBoardStatusChange(HotspotBoard hb);

	List<Member> memberCount();

	List<Planner> plannerCount();

	List<FlashBoard> flashCount();

	List<HotspotBoard> hotspotCount();
}
