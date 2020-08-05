package com.kh.jejour.topN.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jejour.topN.model.vo.TopN;

@Repository("TopNDAO")
public class TopNDAOImpl implements TopNDAO {
	
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<TopN> topNSelect(String category) {
	
		return sqlSession.selectList("topNMapper.topNSelect", category);
	}

}
