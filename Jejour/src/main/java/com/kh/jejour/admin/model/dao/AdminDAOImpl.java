package com.kh.jejour.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jejour.flashBoard.model.vo.FlashBoard;
import com.kh.jejour.flashComment.model.vo.FlashComment;
import com.kh.jejour.hotspotBoard.model.vo.HotspotBoard;
import com.kh.jejour.hotspotComment.model.vo.HotspotComment;
import com.kh.jejour.member.model.vo.Member;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Member> selectMemberList() {
		System.out.println("2");
		return sqlSession.selectList("memberMapper.selectList");
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
