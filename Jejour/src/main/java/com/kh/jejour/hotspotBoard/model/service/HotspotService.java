package com.kh.jejour.hotspotBoard.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.jejour.hotspotBoard.model.vo.HotspotBoard;

public interface HotspotService {

	int hotspotInsert(HotspotBoard hotspotboard);
	
	int hotspotUpdate(HotspotBoard hotspotboard);
	
	List<Map<String, String>> hotspotPageList(int cPage, int numPerPage);
	
	int hotspotDelete(HotspotBoard hotspotboard);

	int selectBoardTotalContents();

	HotspotBoard hotspotSelectOne(int hNo);
	


	
}
