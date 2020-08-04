package com.kh.jejour.hotspotComment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jejour.hotspotComment.model.dao.HotspotCDAO;
import com.kh.jejour.hotspotComment.model.vo.HotspotComment;


@Service("hotspotCService")
public class HotspotCServiceImpl implements HotspotCService{
	
	@Autowired
	HotspotCDAO hotspotCDAO;

	@Override
	public List<HotspotComment> hotspotCSelectDetail(int hNo) {
		
		return hotspotCDAO.hotspotCSelectDetail(hNo);
	}

	@Override
	public int insertComment(HotspotComment hotspotComment) {
		
		return hotspotCDAO.insertComment(hotspotComment);
	}

	@Override
	public int insertCComment(HotspotComment hotspotComment) {
		
		return hotspotCDAO.insertCComment(hotspotComment);
		
	}

	@Override
	public int updateComment(HotspotComment hotspotComment) {
		
		return hotspotCDAO.updateComment(hotspotComment);
	}

}
