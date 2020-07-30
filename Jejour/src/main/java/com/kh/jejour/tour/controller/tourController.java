package com.kh.jejour.tour.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class tourController {
	
	@RequestMapping("/tour/tourList.do")
	public String tourList(Model model, @RequestParam(value="page", required=false, defaultValue="1") int page) {
		
		model.addAttribute("page", page);
		
		return "tour/tourList";
	}

		
		
		

}
