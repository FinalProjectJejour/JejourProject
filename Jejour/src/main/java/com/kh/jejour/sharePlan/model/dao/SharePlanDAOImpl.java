package com.kh.jejour.sharePlan.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jejour.planner.model.vo.Planner;

@Repository("sharePlanDAO")
public class SharePlanDAOImpl implements SharePlanDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectSharePlanList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("sharePlanMapper.selectSharePlanList", null, rows);
	}

	@Override
	public int selectSharePlanTotalContents() {
		return sqlSession.selectOne("sharePlanMapper.selectSharePlanTotalContents");
	}

	@Override
	public List<Planner> searchShare(HashMap<String, String> hmap, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("sharePlanMapper.searchShare", hmap, rows);
	}

	@Override
	public int selectSearchShareContents(HashMap<String, String> hmap) {
		return sqlSession.selectOne("sharePlanMapper.selectSearchShareContents", hmap);
	}

	@Override
	public List<Planner> plannerBest() {
		return sqlSession.selectList("sharePlanMapper.plannerBest");
	}

}
