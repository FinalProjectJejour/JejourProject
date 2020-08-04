package com.kh.jejour.hotspotComment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jejour.hotspotComment.model.vo.HotspotComment;

@Repository("Hotspotcdao")
public class HotspotCDAOImpl implements HotspotCDAO{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<HotspotComment> hotspotCSelectDetail(int hNo) {
		
		return sqlSession.selectList("hotspotCommentMapper.hotspotCSelect", hNo);
	}

	@Override
	public int insertComment(HotspotComment hotspotComment) {
		
		return sqlSession.insert("hotspotCommentMapper.hotspotCInsert", hotspotComment);
	}

	@Override
	public int insertCComment(HotspotComment hotspotComment) {
		
		return sqlSession.insert("hotspotCommentMapper.hotspotCCInsert", hotspotComment);
	}

	@Override
	public int updateComment(HotspotComment hotspotComment) {
		
		return sqlSession.update("hotspotCommentMapper.updateCommnet", hotspotComment);
	}

}
