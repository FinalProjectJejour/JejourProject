package com.kh.jejour.hotspotLike.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jejour.hotspotLike.model.vo.HotspotLike;

@Repository("Hotspotlikedao")
public class HotspotLikeDAOImpl implements HotspotLikeDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int hotspotLikeInsert(HotspotLike hotspotLike) {
		
		return sqlSession.insert("hotspotLikeMapper.hotspotLikeInsert", hotspotLike);
	}

	@Override
	public int hotspotUnlikeInsert(HotspotLike hotspotLike) {
		
		return sqlSession.insert("hotspotLikeMapper.hotspotUnlikeInsert", hotspotLike);
	}

	@Override
	public int hotspotLikeCountSelect(int hNo) {
		
		return sqlSession.selectOne("hotspotLikeMapper.hotspotLikeCount", hNo);
	}

	@Override
	public int hotspotUnLikeCountSelect(int hNo) {
		
		return sqlSession.selectOne("hotspotLikeMapper.hotspotUnLikeCount", hNo);
	}

	@Override
	public int hotspotCheckSelect(HotspotLike hotspotLike) {
		
		return sqlSession.selectOne("hotspotLikeMapper.hotspotCheckSelect", hotspotLike);
	}

	@Override
	public int likeCheck(HotspotLike hotspotLike) {
		
		return sqlSession.selectOne("hotspotLikeMapper.likeCheck", hotspotLike);
	}

	@Override
	public int likeUpdate(HotspotLike hotspotLike) {
		
		return sqlSession.update("hotspotLikeMapper.likeUpdate", hotspotLike);
	}
	
	@Override
	public int unlikeCheck(HotspotLike hotspotLike) {
		
		return sqlSession.selectOne("hotspotLikeMapper.unlikeCheck", hotspotLike);
	}

	@Override
	public int unlikeUpdate(HotspotLike hotspotLike) {
		
		return sqlSession.update("hotspotLikeMapper.unlikeUpdate", hotspotLike);
	}

}
