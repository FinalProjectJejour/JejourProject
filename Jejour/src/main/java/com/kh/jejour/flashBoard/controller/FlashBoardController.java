package com.kh.jejour.flashBoard.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.jejour.common.util.Utils;
import com.kh.jejour.flashBoard.model.exception.FlashBoardException;
import com.kh.jejour.flashBoard.model.service.FlashService;
import com.kh.jejour.flashBoard.model.vo.FlashBoard;

@Controller
public class FlashBoardController {
	
	@Autowired
	FlashService flashService;
	
	@RequestMapping("/flashBoard/flashList.fl")
	public String flashBoardList(
			@RequestParam(value="cPage", required=false, defaultValue="1")
			int cPage, Model model) {
		System.out.println("flashList 도착");
		
		// 한 페이지 당 게시글 수
		int numPerPage = 8; // Limit 역할
				
		// 1. 현재 페이지 게시글 목록 가져오기
		List<Map<String, String>> list = flashService.selectFlashBoardList(cPage, numPerPage);
		
		System.out.println("list 정보 : " + list);
		
		// 2. 페이지 계산을 위한 총 페이지 갯수
		int totalContents = flashService.selectFlashBoardTotalContents();
		
		// 3. 페이지 HTML 생성
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "flashList.fl");
		
		model.addAttribute("list", list)
		 .addAttribute("totalContents",totalContents)
	     .addAttribute("numPerPage", numPerPage)
	     .addAttribute("pageBar", pageBar);
		
		return "flash/flashList";
	}
	
	@RequestMapping("/flashBoard/flashBoardForm.fl")
	public String flashBoardForm() {
		System.out.println("flashBoardForm 도착");
		
		return "flash/flashInsert";
	}
	
	@RequestMapping("/flashBoard/flashBoardInsert.fl")
	public String flashBoardInsert(
			@RequestParam String fTitle, @RequestParam int fPeople, 
			@RequestParam String fWhenDate, @RequestParam String fMapTitle, 
			@RequestParam String fContent, @RequestParam String fMapX,
			@RequestParam String fMapY) {
		System.out.println("flashBoardInsert 도착");
		System.out.println(fWhenDate.substring(0, 10));
		
		String fSetDate = fWhenDate.substring(0, 10);
		String fSetTime = fWhenDate.substring(11);
		
		Date writeDate = new Date(new GregorianCalendar().getTimeInMillis());
		String[] dateArr = fSetDate.split("-");
		int[] intArr = new int[dateArr.length];
		
		for(int i = 0; i < dateArr.length; i++) {
			intArr[i] = Integer.parseInt(dateArr[i]);
		}
		
		writeDate = new Date(new GregorianCalendar(
							intArr[0], intArr[1] - 1, intArr[2]
							).getTimeInMillis());
		
		// 임의의 ID 삽입용 추후에 Member 들어오면 삭제 필요
		String userId = "admin";
		
		FlashBoard fb = new FlashBoard();
		
		// 임의의 ID 삽입용 추후에 Member 들어오면 삭제 필요
		fb.setUserId(userId);
		
		fb.setFTitle(fTitle);
		fb.setFPeople(fPeople);
		fb.setFMeetDate(writeDate);
		fb.setFMeetTime(fSetTime);
		fb.setFMapTitle(fMapTitle);
		fb.setFContent(fContent);
		fb.setFMapX((Double.parseDouble(fMapX)));
		fb.setFMapY((Double.parseDouble(fMapY)));
		
		System.out.println("FlashBoard : " + fb);
		
		try {
			
			flashService.insertFlashBoard(fb);

		} catch(Exception e) {
			
			throw new FlashBoardException("게시글 등록 오류!");
			
		}
		
		return "redirect:/flashBoard/flashList.fl";
	}
	
	@RequestMapping("/flashBoard/flashBoardDetail.fl")
	public String flashBoardDetail(@RequestParam int fNo, Model model) {
		System.out.println("flashBoardDetail 도착");
		
		FlashBoard fb = flashService.selectOneFlashBoard(fNo);
		
		System.out.println(fb);
		
		model.addAttribute("FlashBoard", fb);
		
		return "flash/flashDetail";
	}
	
	@RequestMapping("/flashBoard/flashBoardUpdateView.fl")
	public String flashBoardUpdateView(@RequestParam int fNo, Model model) {
		System.out.println("flashBoardUpdateView 도착");
		
		FlashBoard fb = flashService.selectOneFlashBoard(fNo);
		
		System.out.println(fb);
		
		model.addAttribute("FlashBoard", fb);
		
		return "flash/flashUpdate";
	}
	
	@RequestMapping("/flashBoard/flashBoardUpdate.fl")
	public String flashBoardUpdate(
			@RequestParam String fTitle, @RequestParam int fPeople, 
			@RequestParam String fWhenDate, @RequestParam String fMapTitle, 
			@RequestParam String fContent, @RequestParam String fMapX,
			@RequestParam String fMapY, @RequestParam int fNo) {
		System.out.println("flashBoardUpdate 도착");
		System.out.println(fWhenDate.substring(0, 10));
		
		String fSetDate = fWhenDate.substring(0, 10);
		String fSetTime = fWhenDate.substring(11);
		
		Date writeDate = new Date(new GregorianCalendar().getTimeInMillis());
		String[] dateArr = fSetDate.split("-");
		int[] intArr = new int[dateArr.length];
		
		for(int i = 0; i < dateArr.length; i++) {
			intArr[i] = Integer.parseInt(dateArr[i]);
		}
		
		writeDate = new Date(new GregorianCalendar(
							intArr[0], intArr[1] - 1, intArr[2]
							).getTimeInMillis());
		
		// 임의의 ID 삽입용 추후에 Member 들어오면 삭제 필요
		String userId = "admin";
		
		FlashBoard fb = new FlashBoard();
		
		// 임의의 ID 삽입용 추후에 Member 들어오면 삭제 필요
		fb.setUserId(userId);
		
		fb.setFNo(fNo);
		fb.setFTitle(fTitle);
		fb.setFPeople(fPeople);
		fb.setFMeetDate(writeDate);
		fb.setFMeetTime(fSetTime);
		fb.setFMapTitle(fMapTitle);
		fb.setFContent(fContent);
		fb.setFMapX((Double.parseDouble(fMapX)));
		fb.setFMapY((Double.parseDouble(fMapY)));
		
		System.out.println("FlashBoard : " + fb);
		
		try {
			
			flashService.updateFlashBoard(fb);

		} catch(Exception e) {
			
			throw new FlashBoardException("게시글 업데이트 오류!");
			
		}
		
		return "redirect:/flashBoard/flashList.fl";
	}
	
	@RequestMapping("/flashBoard/flashBoardDelete.fl")
	public String flashBoardDelete(@RequestParam int fNo) {
		System.out.println("flashBoardDelete 도착");
		
		try {
			
			flashService.deleteBoard(fNo);
			
		} catch(Exception e) {
			
			throw new FlashBoardException("게시글 삭제 오류!");
			
		}
		
		return "redirect:/flashBoard/flashList.fl";
	}
	
	@RequestMapping("/flashBoard/search.fl")
	@ResponseBody
	public HashMap<String,Object> search(@RequestParam String searchCondition, @RequestParam String keyword, @RequestParam int cPage){
		/*
		List<FlashBoard> list = new ArrayList<FlashBoard>();
			
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("searchCondition", searchCondition);
		hmap.put("keyword", keyword);
		
		list = flashService.search(hmap);
		
		return list;
		*/
		
		// 한 페이지 당 게시글 수
		int numPerPage = 8; // Limit 역할
				
		List<FlashBoard> list = new ArrayList<FlashBoard>();
		
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("searchCondition", searchCondition);
		hmap.put("keyword", keyword);
		
		list = flashService.search(hmap, cPage, numPerPage);
		
		System.out.println("list : " + list);
		
		// 2. 페이지 계산을 위한 총 페이지 갯수
		int totalContents = flashService.selectFlashBoardSearchContents(hmap);
		
		// 3. 페이지 HTML 생성
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "flashList.fl");
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("list", list);
		map.put("pageBar", pageBar);
		
		return map;
	}

}
