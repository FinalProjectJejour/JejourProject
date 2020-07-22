package com.kh.jejour.hotspotBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HotspotController {
	
	@RequestMapping("/insert.ho")
	public String HotspotInsertBoard() {
		return "hotspot/hotspotInsert";
	}
	
	@RequestMapping("/detail.ho")
	public String HotspotDetailBoard() {
		return "hotspot/hotspotDetail";
	}
	
	@RequestMapping("/list.ho")
	public String HotspotListBoard() {
		return "hotspot/hotspotList";
	}

	

}
