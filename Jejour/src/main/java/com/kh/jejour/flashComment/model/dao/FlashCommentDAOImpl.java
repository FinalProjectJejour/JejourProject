package com.kh.jejour.flashComment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jejour.flashComment.model.vo.FlashComment;

@Repository("flashCommentDAO")
public class FlashCommentDAOImpl implements FlashCommentDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<FlashComment> selectComment(int fNo) {
		return sqlSession.selectList("flashCommentMapper.selectComment", fNo);
	}

	@Override
	public int insertComment(FlashComment flashComment) {
		return sqlSession.insert("flashCommentMapper.insertComment", flashComment);
	}

	@Override
	public int updateComment(FlashComment flashComment) {
		return sqlSession.update("flashCommentMapper.updateComment", flashComment);
	}

	@Override
	public int deleteComment(int fcNo) {
		return sqlSession.delete("flashCommentMapper.deleteComment", fcNo);
	}

	@Override
	public FlashComment selectOneComment() {
		return sqlSession.selectOne("flashCommentMapper.selectOneComment");
	}

}
