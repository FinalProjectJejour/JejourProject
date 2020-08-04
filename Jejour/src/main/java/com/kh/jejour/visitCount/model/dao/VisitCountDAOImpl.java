package com.kh.jejour.visitCount.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jejour.visitCount.model.vo.VisitCount;

@Repository("visitCountDAO")
public class VisitCountDAOImpl implements VisitCountDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	//=======방문자 카운터==========
	@Override
	public int visitCounter(String visitId) {
		
		return sqlSession.insert("visitMapper.visitCount",visitId);
	}
	//======총방문자/오늘방문자=========
	@Override
	public List<VisitCount> selectAllVisitCount() {
		return sqlSession.selectList("visitMapper.selectAllVisitCount");
	}

	//==============달별 방문자수 =======================
	@Override
	public List<VisitCount> selectMonth() {
		
		return sqlSession.selectList("visitMapper.selectMonth");
	}

	@Override
	public List<VisitCount> selectBMonth() {
		
		return sqlSession.selectList("visitMapper.selectBMonth");
	}

	@Override
	public List<VisitCount> selectBBMonth() {
		
		return sqlSession.selectList("visitMapper.selectBBMonth");
	}

	@Override
	public List<VisitCount> selectBBBMonth() {
		
		return sqlSession.selectList("visitMapper.selectBBBMonth");
	}

	@Override
	public List<VisitCount> selectBBBBMonth() {
		
		return sqlSession.selectList("visitMapper.selectBBBBMonth");
	}

	@Override
	public List<VisitCount> selectBBBBBMonth() {
		
		return sqlSession.selectList("visitMapper.selectBBBBBMonth");
	}

	
	
	

}
