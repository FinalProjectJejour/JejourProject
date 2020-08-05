package com.kh.jejour.plannerPart.model.dao;

import java.util.List;

import com.kh.jejour.planner.model.vo.Attachment;
import com.kh.jejour.planner.model.vo.Planner;
import com.kh.jejour.plannerPart.model.vo.CategoryCount;
import com.kh.jejour.plannerPart.model.vo.PlannerPart;

public interface PlannerPartDAO {
	
	int settingPlan(PlannerPart plannerPart);

	List<PlannerPart> selectPlanList(int pNo);

	int deletePlan(int ppNo);

	PlannerPart getOnePlannerPart(int ppNo);

	int updateOnePlannerPart(PlannerPart plannerPart);

	List<CategoryCount> getCategoryCount(int pNo);

	// Planner selectOnePlanner(int pNo);
}
