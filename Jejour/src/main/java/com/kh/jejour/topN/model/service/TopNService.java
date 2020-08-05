package com.kh.jejour.topN.model.service;

import java.util.List;

import com.kh.jejour.topN.model.vo.TopN;

public interface TopNService {

	List<TopN> topNSelect(String category);

}
