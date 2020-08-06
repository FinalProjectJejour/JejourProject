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
	
	public Planner selectOnePlanner(int pNo) {
		
		return sqlSession.selectOne("plannerMapper.selectOnePlanner", pNo);
	}

	@Override
	public int setStatus(Planner planner) {
		return sqlSession.update("plannerMapper.updateStatus", planner);
		
	}

	@Override
	public Planner getThisPlanner(int pNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("plannerMapper.thisPlanner", pNo);
	}

	@Override
	public int changePlannerTheme(Planner planner) {
		// TODO Auto-generated method stub
		return sqlSession.update("plannerMapper.updateTheme", planner);
	}

	@Override
	public int deletePlan(int pNo) {
		sqlSession.delete("plannerMapper.deleteAllPlan", pNo);
		// TODO Auto-generated method stub
		return sqlSession.delete("plannerMapper.deletePlaner", pNo);
	}

	@Override
	public int changeDescribe(Planner planner) {
		// TODO Auto-generated method stub
		return sqlSession.update("plannerMapper.updateOneDescribe", planner);
	}

	@Override
	public int changeStatus(Planner planner) {
		// TODO Auto-generated method stub
		return sqlSession.update("plannerMapper.updateOneStatus", planner);
	}
	
	
	

}
