package com.kh.jejour.hotspotComment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.jejour.hotspotBoard.model.exception.HotspotBoardException;
import com.kh.jejour.hotspotBoard.model.vo.HotspotBoard;
import com.kh.jejour.hotspotComment.model.service.HotspotCService;
import com.kh.jejour.hotspotComment.model.vo.HotspotComment;

@Controller
public class HotspotCommnetController {
	

	  @Autowired 
	  HotspotCService hotspotCService;
	  
	  @RequestMapping("/hotspotBoard/insertComment.ho")
		public String insertComment(@RequestParam int no, HotspotComment hotspotComment){
		  
		  System.out.println(hotspotComment);
		  System.out.println(no);
		    
			try {		
				hotspotCService.insertComment(hotspotComment);
				} catch(Exception e) {
					throw new HotspotBoardException("comment 입력 오류!");
				}
			

			return "redirect:/hotspotBoard/hotspotDetail.ho?no=" + no;
	  }
	  
	  @RequestMapping("/hotspotBoard/insertCComment.ho")
		public String insertCComment(@RequestParam int no, HotspotComment hotspotComment){
		 
		  System.out.println(hotspotComment);
		  System.out.println(no);
		  
			try {		
				hotspotCService.insertCComment(hotspotComment);
				} catch(Exception e) {
					throw new HotspotBoardException("comment 입력 오류!");
				}
			

			return "redirect:/hotspotBoard/hotspotDetail.ho?no=" + no;
	  }
	  
	  
	  @RequestMapping("/hotspotBoard/deleteComment.ho")
		public String deleteComment(HotspotComment hotspotComment, @RequestParam int no){
		 
		 System.out.println("hotspotComment = " + hotspotComment );
		 System.out.println("hotspotComment = " + hotspotComment );
		 System.out.println("hotspotComment = " + hotspotComment );
		 System.out.println("hotspotComment = " + hotspotComment );
		 
		  
		  hotspotCService.updateComment(hotspotComment);
			/*
			 * try { } catch(Exception e) { throw new
			 * HotspotBoardException("comment 입력 오류!"); }
			 */
			

			return "redirect:/hotspotBoard/hotspotDetail.ho?no=" + no;
	  }
}
