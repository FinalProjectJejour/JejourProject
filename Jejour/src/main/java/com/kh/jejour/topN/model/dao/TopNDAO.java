package com.kh.jejour.topN.model.dao;

import java.util.List;

import com.kh.jejour.topN.model.vo.TopN;

public interface TopNDAO {

	List<TopN> topNSelect(String category);

}
