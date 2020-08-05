package com.kh.jejour.visitCount.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.jejour.visitCount.model.dao.VisitCountDAO;



@Controller
public class VisitCountController{
	
	@Autowired
	VisitCountDAO visitDAO;
	
	@RequestMapping("/visit/visitCount.do")
    public void visitCount(){
		System.out.println("방문자세션 실행");
		

          
        visitDAO.visitCounter(null);
    }
	
   

	
	
}
