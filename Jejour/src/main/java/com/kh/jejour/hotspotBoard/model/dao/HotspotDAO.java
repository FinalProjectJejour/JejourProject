package com.kh.jejour.hotspotBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.jejour.hotspotBoard.model.vo.HotspotBoard;

public interface HotspotDAO {
	
	int hotspotInsert(HotspotBoard hotspotboard);
	
	int hotspotUpdate(HotspotBoard hotspotboard);
	
	List<Map<String, String>> hotspotPageList(int cPage, int numPerPage);
	
	int hotspotDelete(HotspotBoard hotspotboard);

	int selectBoardTotalContents();

	HotspotBoard hotspotSelectOne(int hNo);
	
	List<HotspotBoard> search(HashMap<String, String> hmap, int cPage, int numPerPage);
	
	int selectHotspotBoardSearchContents(HashMap<String, String> hmap);

	List<Map<String, String>> hotspotMyPageList(int cPage, int numPerPage, String userId);

	int selectBoardMyTotalContents(String userId);
	

}
