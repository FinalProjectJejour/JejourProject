package com.kh.jejour.plannerLike.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jejour.plannerLike.model.dao.PlannerLikeDAO;
import com.kh.jejour.plannerLike.model.vo.PlannerLike;

@Service("plannerLikeService")
public class PlannerLikeServiceImpl implements PlannerLikeService {
	
	@Autowired
	PlannerLikeDAO plannerLikeDAO;

	@Override
	public PlannerLike selectPlannerLike(PlannerLike plannerLike) {
		// TODO Auto-generated method stub
		System.out.println("here2");
		return plannerLikeDAO.selectPlannerLike(plannerLike);
	}

	@Override
	public int insertPlannerLike(PlannerLike plannerLike) {
		// TODO Auto-generated method stub
		return plannerLikeDAO.insertPlannerLike(plannerLike);
	}

	@Override
	public int updateGood(PlannerLike plannerLike) {
		// TODO Auto-generated method stub
		return plannerLikeDAO.updateGood(plannerLike);
	}

	@Override
	public int countLike(int pNo) {
		// TODO Auto-generated method stub
		return plannerLikeDAO.countLike(pNo);
	}

	@Override
	public int countUnLike(int pNo) {
		// TODO Auto-generated method stub
		return plannerLikeDAO.countUnLike(pNo);
	}
	
	
	

	
}
