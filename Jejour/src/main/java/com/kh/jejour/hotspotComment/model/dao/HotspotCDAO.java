package com.kh.jejour.hotspotComment.model.dao;

import java.util.List;

import com.kh.jejour.hotspotComment.model.vo.HotspotComment;

public interface HotspotCDAO {
	
	List<HotspotComment> hotspotCSelectDetail(int hNo);

	int insertComment(HotspotComment hotspotComment);

	int insertCComment(HotspotComment hotspotComment);

	int updateComment(HotspotComment hotspotComment);

}
