package com.kh.jejour.topN.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jejour.topN.model.dao.TopNDAO;
import com.kh.jejour.topN.model.vo.TopN;

@Service("topNService")
public class TopNServiceImpl implements TopNService {
	
	@Autowired
	TopNDAO topNdao;

	@Override
	public List<TopN> topNSelect(String category) {
		
		return topNdao.topNSelect(category);
	}

}
