package com.kh.jejour.flashBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FlashBoardController {
	
	@RequestMapping("/flashBoard/flashList.fl")
	public String flashBoardList() {
		System.out.println("여기오냐?");
		
		return "flash/flashList";
	}

}
