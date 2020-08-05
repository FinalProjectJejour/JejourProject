package com.kh.jejour.plannerLike.model.dao;

import com.kh.jejour.plannerLike.model.vo.PlannerLike;

public interface PlannerLikeDAO {

	PlannerLike selectPlannerLike(PlannerLike plannerLike);

	int insertPlannerLike(PlannerLike plannerLike);

	int updateGood(PlannerLike plannerLike);

	int countLike(int pNo);

	int countUnLike(int pNo);
	
}
