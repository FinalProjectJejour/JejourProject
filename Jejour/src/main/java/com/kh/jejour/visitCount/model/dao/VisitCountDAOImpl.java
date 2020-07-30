package com.kh.jejour.visitCount.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jejour.visitCount.model.vo.VisitCount;

@Repository("visitCountDAO")
public class VisitCountDAOImpl implements VisitCountDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int visitCounter() {
		
		return sqlSession.insert("visitMapper.visitCount");
	}

}
