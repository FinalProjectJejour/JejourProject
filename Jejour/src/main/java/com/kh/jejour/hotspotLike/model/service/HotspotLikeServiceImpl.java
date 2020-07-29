package com.kh.jejour.hotspotLike.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jejour.hotspotLike.model.dao.HotspotLikeDAO;
import com.kh.jejour.hotspotLike.model.vo.HotspotLike;


@Service("hotspotLikeService")
public class HotspotLikeServiceImpl implements HotspotLikeService {
	
	@Autowired
	HotspotLikeDAO hotspotLikeDAO;
	
	@Override
	public int hotspotLikeInsert(HotspotLike hotspotLike) {
		
		return hotspotLikeDAO.hotspotLikeInsert(hotspotLike);
	}

	@Override
	public int hotspotUnlikeInsert(HotspotLike hotspotLike) {
		
		return hotspotLikeDAO.hotspotUnlikeInsert(hotspotLike);
	}

	@Override
	public int hotspotLikeCountSelect(int hNo) {
		
		return hotspotLikeDAO.hotspotLikeCountSelect(hNo);
	}

	@Override
	public int hotspotUnLikeCountSelect(int hNo) {
		
		return hotspotLikeDAO.hotspotUnLikeCountSelect(hNo);
	}

}
