package com.kh.jejour.planner.model.dao;

import com.kh.jejour.planner.model.vo.Attachment;
import com.kh.jejour.planner.model.vo.Planner;

public interface PlannerDAO {
	
	int insertPlanner(Planner planner);
	
	int updateTitle(Planner planner);
	
	int insertAttachment(Attachment a);
}
