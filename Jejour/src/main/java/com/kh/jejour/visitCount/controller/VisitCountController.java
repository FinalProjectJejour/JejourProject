package com.kh.jejour.visitCount.controller;

import javax.servlet.http.HttpSessionEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.jejour.visitCount.model.service.VisitCountService;

@Controller
public class VisitCountController {
	
	@Autowired
	VisitCountService visitCountService;
	
	@RequestMapping("/board/visitCounter.do")
	public String visitCounter(HttpSessionEvent arg) {
		
		return ""; 
	}
}
