package com.kh.jejour.flashComment.model.dao;

import java.util.List;

import com.kh.jejour.flashComment.model.vo.FlashComment;

public interface FlashCommentDAO {
	
	public List<FlashComment> selectComment(int fNo);
	
	public int insertComment(FlashComment flashComment);
	
	public int updateComment(FlashComment flashComment);
	
	public int deleteComment(int fcNo);
	
	public FlashComment selectOneComment();

}
