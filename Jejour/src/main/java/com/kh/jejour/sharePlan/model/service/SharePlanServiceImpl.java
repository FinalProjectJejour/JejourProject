package com.kh.jejour.sharePlan.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jejour.planner.model.vo.Planner;
import com.kh.jejour.sharePlan.model.dao.SharePlanDAO;

@Service("sharePlanService")
public class SharePlanServiceImpl implements SharePlanService {

	@Autowired
	SharePlanDAO sharePlanDAO;
	
	@Override
	public List<Map<String, String>> selectSharePlanList(int cPage, int numPerPage) {
		return sharePlanDAO.selectSharePlanList(cPage, numPerPage);
	}

	@Override
	public int selectSharePlanTotalContents() {
		return sharePlanDAO.selectSharePlanTotalContents();
	}

	@Override
	public List<Planner> searchShare(HashMap<String, String> hmap, int cPage, int numPerPage) {
		return sharePlanDAO.searchShare(hmap, cPage, numPerPage);
	}

	@Override
	public int selectSearchShareContents(HashMap<String, String> hmap) {
		return sharePlanDAO.selectSearchShareContents(hmap);
	}

}
