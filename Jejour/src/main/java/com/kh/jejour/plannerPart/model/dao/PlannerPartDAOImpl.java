package com.kh.jejour.plannerPart.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jejour.planner.model.vo.Attachment;
import com.kh.jejour.planner.model.vo.Planner;
import com.kh.jejour.plannerPart.model.vo.PlannerPart;

@Repository("plannerPartDAO")
public class PlannerPartDAOImpl implements PlannerPartDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int settingPlan(PlannerPart plannerPart) {
		
		return sqlSession.insert("plannerMapper.setplan", plannerPart);
	}

	@Override
	public List<PlannerPart> selectPlanList(int pNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("plannerMapper.selectPlanList", pNo);
	}
	
	
	

}
