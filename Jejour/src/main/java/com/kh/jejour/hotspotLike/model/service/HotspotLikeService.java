package com.kh.jejour.hotspotLike.model.service;

import com.kh.jejour.hotspotLike.model.vo.HotspotLike;

public interface HotspotLikeService {
	
	int hotspotLikeInsert(HotspotLike hotspotLike);
	
	int hotspotUnlikeInsert(HotspotLike hotspotLike);
	
	int hotspotLikeCountSelect(int hNo);
	
	int hotspotUnLikeCountSelect(int hNo);
}
