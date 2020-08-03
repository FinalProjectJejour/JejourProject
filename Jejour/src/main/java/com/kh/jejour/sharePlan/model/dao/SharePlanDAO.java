package com.kh.jejour.sharePlan.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.jejour.planner.model.vo.Planner;

public interface SharePlanDAO {
	
	List<Map<String, String>> selectSharePlanList(int cPage, int numPerPage);

	public int selectSharePlanTotalContents();
	
	List<Planner> searchShare(HashMap<String, String> hmap, int cPage, int numPerPage);
	
	int selectSearchShareContents(HashMap<String, String> hmap);
	
	List<Planner> plannerBest();
	
}
