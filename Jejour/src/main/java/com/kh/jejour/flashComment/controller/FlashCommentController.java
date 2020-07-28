package com.kh.jejour.flashComment.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.jejour.flashComment.model.service.FlashCommentService;
import com.kh.jejour.flashComment.model.vo.FlashComment;

@Controller
public class FlashCommentController {
	
	@Autowired
	FlashCommentService flashCommentService;

	@RequestMapping("/flashComment/flashCommentList.fl")
	@ResponseBody
	public List<FlashComment> flashCommentList(@RequestParam int fNo) {
		
		List<FlashComment> list = new ArrayList<FlashComment>();
		
		list = flashCommentService.selectComment(fNo);
		
		System.out.println("댓글 list : " + list);
		
		return list;
	}
	
	@RequestMapping("/flashComment/flashCommentInsert.fl")
	@ResponseBody
	public FlashComment flashCommentInsert(FlashComment fc) {
		
		flashCommentService.insertComment(fc);
		
		fc = flashCommentService.selectOneComment();
		
		System.out.println("flashComment : " + fc);
		
		return fc;
	}
	
	@RequestMapping("/flashComment/flashCommentDelete.fl")
	@ResponseBody
	public void flashCommentDelete(@RequestParam int fcNo) {
		
		flashCommentService.deleteComment(fcNo);
	}
	
	@RequestMapping("/flashComment/flashCommentUpdate.fl")
	@ResponseBody
	public void flashCommentUpdate(FlashComment fc) {
		System.out.println("fc : " + fc);
		
		flashCommentService.updateComment(fc);
	}
}
