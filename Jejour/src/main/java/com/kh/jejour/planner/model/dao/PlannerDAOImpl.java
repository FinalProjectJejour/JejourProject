package com.kh.jejour.planner.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jejour.planner.model.vo.Attachment;
import com.kh.jejour.planner.model.vo.Planner;

@Repository("plannerDAO")
public class PlannerDAOImpl implements PlannerDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertPlanner(Planner planner) {
		return sqlSession.insert("plannerMapper.insertPlanner", planner);
	}
	
	@Override
	public int updateTitle(Planner planner) {
		return sqlSession.insert("plannerMapper.updateTitle", planner);
	}

	@Override
	public int insertAttachment(Attachment a) {
		return sqlSession.insert("plannerMapper.insertAttachment", a);
	}
	
	

}
