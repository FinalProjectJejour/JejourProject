package com.kh.jejour.flashComment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jejour.flashComment.model.dao.FlashCommentDAO;
import com.kh.jejour.flashComment.model.vo.FlashComment;

@Service("flashCommentService")
public class FlashCommentServiceImpl implements FlashCommentService {

	@Autowired
	FlashCommentDAO flashCommentDAO;
	
	@Override
	public List<FlashComment> selectComment(int fNo) {
		return flashCommentDAO.selectComment(fNo);
	}

	@Override
	public int insertComment(FlashComment flashComment) {
		return flashCommentDAO.insertComment(flashComment);
	}

	@Override
	public int updateComment(FlashComment flashComment) {
		return flashCommentDAO.updateComment(flashComment);
	}

	@Override
	public int deleteComment(int fcNo) {
		return flashCommentDAO.deleteComment(fcNo);
	}

	@Override
	public FlashComment selectOneComment() {
		return flashCommentDAO.selectOneComment();
	}

}
