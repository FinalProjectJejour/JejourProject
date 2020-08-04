package com.kh.jejour.hotspotComment.model.service;

import java.util.List;

import com.kh.jejour.hotspotComment.model.vo.HotspotComment;

public interface HotspotCService {
	
	List<HotspotComment> hotspotCSelectDetail(int hNo);

	int insertComment(HotspotComment hotspotComment);

	int insertCComment(HotspotComment hotspotComment);

	int updateComment(HotspotComment hotspotComment);


}
