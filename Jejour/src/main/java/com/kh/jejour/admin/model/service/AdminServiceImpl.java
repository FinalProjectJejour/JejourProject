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
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<FlashBoard> fBoardRanking() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FlashComment> fCommentRanking() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HotspotBoard> selectHotspotBoardList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HotspotBoard> hBoardRanking() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HotspotComment> hCommentRanking() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int banMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteHotspotBoard(int hNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFlashBoard(int fNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int flashBoardStatusChange(int hNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int hotspotBoardStatusChange(int fno) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
