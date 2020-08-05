package com.kh.jejour.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jejour.admin.model.dao.AdminDAO;
import com.kh.jejour.flashBoard.model.vo.FlashBoard;
import com.kh.jejour.flashComment.model.vo.FlashComment;
import com.kh.jejour.hotspotBoard.model.vo.HotspotBoard;
import com.kh.jejour.hotspotComment.model.vo.HotspotComment;
import com.kh.jejour.member.model.vo.Member;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;
	
	@Override
	public List<Member> selectMemberList() {
		System.out.println("1");
		return adminDAO.selectMemberList(); 
	}

	@Override
	public List<FlashBoard> selectFlashBoardLsit() {
		
		return adminDAO.selectFlashBoardLsit();
	}
	
	

	@Override
	public List<HotspotBoard> selectHotspotBoardList() {
		
		return adminDAO.selectHotspotBoardList();
	}
	
	//==============게시글 랭킹==================

	@Override
	public List<HotspotBoard> hBoardRanking() {
		// TODO Auto-generated method stub
		return adminDAO.hBoardRanking();
	}
	
	@Override
	public List<FlashBoard> fBoardRanking() {
		
		return adminDAO.fBoardRanking();
	}

	//=====================댓글랭킹-==============
	
	@Override
	public List<HotspotComment> hCommentRanking() {
	
		return adminDAO.hCommentRanking();
	}
	
	

	@Override
	public List<FlashComment> fCommentRanking() {
		
		return adminDAO.fCommentRanking();
	}
	
	//================강퇴==================

	@Override
	public int banMember(String userId) {
		
		return adminDAO.banMember(userId);
	}
	
	//===============삭제=====================

	@Override
	public int deleteHotspotBoard(int hNo) {
		return adminDAO.deleteHotspotBoard(hNo);
	}

	@Override
	public int deleteFlashBoard(int fNo) {
		return adminDAO.deleteFlashBoard(fNo);
	}
	
	//========================스테이터스=====================

	@Override
	public List<FlashBoard> flashBoardStatusChange(FlashBoard flashBoard) {
		
		adminDAO.flashBoardStatusChange(flashBoard);
		
		return adminDAO.fStatusSelect(flashBoard);
	}

	@Override
	public List<HotspotBoard> hotspotBoardStatusChange(HotspotBoard hotspotBoard) {
		
		adminDAO.hotspotBoardStatusChange(hotspotBoard);
		
		return adminDAO.hStatusSelect(hotspotBoard);
	}

	@Override
	public List<Member> memberCount() {
		
		return adminDAO.memberCount();
	}

	

}
