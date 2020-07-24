package com.kh.jejour.flashBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jejour.flashBoard.model.vo.FlashBoard;

@Repository("flashDAO")
public class FlashDAOImpl implements FlashDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectFlashBoardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("flashMapper.selectFlashBoardList", null, rows);
	}

	@Override
	public int selectFlashBoardTotalContents() {
		return sqlSession.selectOne("flashMapper.selectFlashBoardTotalContent");
	}

	@Override
	public int insertFlashBoard(FlashBoard flashBoard) {
		System.out.println("FlashDAO 도착!");
		return sqlSession.insert("flashMapper.insertFlash", flashBoard);
	}

	@Override
	public FlashBoard selectOneFlashBoard(int fNo) {
		System.out.println("FlashDAO 도착!");
		return sqlSession.selectOne("flashMapper.selectOneFlashBoard", fNo);
	}

	@Override
	public int updateFlashBoard(FlashBoard flashboard) {
		System.out.println("FlashDAO 도착!");
		return sqlSession.update("flashMapper.updateFlash", flashboard);
	}

	@Override
	public int deleteBoard(int fNo) {
		System.out.println("FlashDAO 도착!");
		return sqlSession.delete("flashMapper.deleteFlash", fNo);
	}

	@Override
	public List<FlashBoard> search(HashMap<String, String> hmap, int cPage, int numPerPage) {
		System.out.println("FlashDAO 도착!");
		// return sqlSession.selectList("flashMapper.search", hmap);
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("flashMapper.search", hmap, rows);
	}

	@Override
	public int selectFlashBoardSearchContents(HashMap<String, String> hmap) {
		System.out.println("FlashDAO 도착!");
		return sqlSession.selectOne("flashMapper.selectFlashBoardSearchContents", hmap);
	}

}
