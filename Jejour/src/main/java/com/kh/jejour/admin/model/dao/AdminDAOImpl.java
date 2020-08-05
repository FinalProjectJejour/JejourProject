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
	
	//리스트불러오기
	
	@Override
	public List<Member> selectMemberList() {
		System.out.println("2");
		return sqlSession.selectList("adminMapper.selectMemberList");
	}

	@Override
	public List<FlashBoard> selectFlashBoardLsit() {
		System.out.println("2");
		return sqlSession.selectList("adminMapper.selectFlashList");
	}

	@Override
	public List<HotspotBoard> selectHotspotBoardList() {
		System.out.println("2");
		return sqlSession.selectList("adminMapper.selectHotspotList");
	}

	//===========================게시글랭킹==================
	
	@Override
	public List<HotspotBoard> hBoardRanking() {
		
		return sqlSession.selectList("adminMapper.hBoardRanking");
	}
	
	@Override
	public List<FlashBoard> fBoardRanking() {
		
		return sqlSession.selectList("adminMapper.fBoardRanking");
	}

	//=====================댓글랭킹===========================
	
	@Override
	public List<HotspotComment> hCommentRanking() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<FlashComment> fCommentRanking() {
		System.out.println("DAO");
		System.out.println(sqlSession.selectList("adminMapper.fCommentRanking"));
		
		return sqlSession.selectList("adminMapper.fCommentRanking");
	}
	
	//==============강퇴=================
	
	@Override
	public int banMember(String userId) {
		
		return sqlSession.delete("adminMapper.banMember",userId);
	}
	
	//===============삭제==================

	@Override
	public int deleteHotspotBoard(int hNo) {
		return sqlSession.delete("adminMapper.deleteHotspotBoard", hNo);
	}

	@Override
	public int deleteFlashBoard(int fNo) {
		
		return sqlSession.delete("adminMapper.deleteFlashBoard", fNo);
	}
	
	//=================스테이터스변환

	@Override
	public List<FlashBoard> flashBoardStatusChange(FlashBoard flashBoard) {
		
		return sqlSession.selectList("adminMapper.changeFlash",flashBoard);
	}
	
	@Override
	public List<FlashBoard> fStatusSelect(FlashBoard flashBoard) {
		
		return sqlSession.selectList("adminMapper.fStatusSelect",flashBoard);
	}

	@Override
	public List<HotspotBoard> hotspotBoardStatusChange(HotspotBoard hotspotBoard) {
		
		return sqlSession.selectList("adminMapper.changeHotspot",hotspotBoard);
	}

	@Override
	public List<HotspotBoard> hStatusSelect(HotspotBoard hotspotBoard) {
		
		return sqlSession.selectList("adminMapper.hStatusSelect",hotspotBoard);
	}

	//스테이터스변환

	

}
