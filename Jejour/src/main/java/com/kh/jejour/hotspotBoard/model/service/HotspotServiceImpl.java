package com.kh.jejour.hotspotBoard.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jejour.hotspotBoard.model.dao.HotspotDAO;
import com.kh.jejour.hotspotBoard.model.vo.HotspotBoard;

@Service("boardService")
public class HotspotServiceImpl implements HotspotService {
	
	@Autowired
	HotspotDAO hotspotDAO;
	
	@Override
	public int hotspotInsert(HotspotBoard hotspotboard) {
		
		return hotspotDAO.hotspotInsert(hotspotboard);
	}

	@Override
	public int hotspotUpdate(HotspotBoard hotspotboard) {
		
		return hotspotDAO.hotspotUpdate(hotspotboard);
	}

	@Override
	public List<Map<String, String>> hotspotPageList(int cPage, int numPerPage) {
		
		return hotspotDAO.hotspotPageList(cPage, numPerPage);
	}

	@Override
	public int hotspotDelete(HotspotBoard hotspotboard) {
		System.out.println("Service");
		return hotspotDAO.hotspotDelete(hotspotboard);
	}

	@Override
	public int selectBoardTotalContents() {
		
		return hotspotDAO.selectBoardTotalContents();
	}

	@Override
	public HotspotBoard hotspotSelectOne(int hNo) {
		
		return hotspotDAO.hotspotSelectOne(hNo);
	}
	
	

}
