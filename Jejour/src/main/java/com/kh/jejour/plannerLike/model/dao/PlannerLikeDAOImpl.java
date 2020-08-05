package com.kh.jejour.plannerLike.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jejour.plannerLike.model.vo.PlannerLike;

@Repository("plannerLikeDAO")
public class PlannerLikeDAOImpl implements PlannerLikeDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public PlannerLike selectPlannerLike(PlannerLike plannerLike) {
		// TODO Auto-generated method stub
		System.out.println("here3");
		return sqlSession.selectOne("plannerMapper.selectPlannerLike",plannerLike);
	}

	@Override
	public int insertPlannerLike(PlannerLike plannerLike) {
		// TODO Auto-generated method stub
		return sqlSession.insert("plannerMapper.setPlanLike",plannerLike);
	}

	@Override
	public int updateGood(PlannerLike plannerLike) {
		// TODO Auto-generated method stub
		return sqlSession.update("plannerMapper.updateGood", plannerLike);
	}

	@Override
	public int countLike(int pNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("plannerMapper.countLike", pNo);
	}

	@Override
	public int countUnLike(int pNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("plannerMapper.countUnLike", pNo);
	}
	
}
