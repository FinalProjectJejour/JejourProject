package com.kh.jejour.visitCount.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


import com.kh.jejour.visitCount.model.dao.VisitCountDAO;



@Controller
public class VisitCountController implements HttpSessionListener{
	
	@Autowired
	VisitCountDAO visitDAO;
	
	@Override
    public void sessionCreated(HttpSessionEvent arg0){
		System.out.println("방문자세션 실행");
		

          
        visitDAO.visitCounter();
    }
	
    @Override
    public void sessionDestroyed(HttpSessionEvent arg0){
        //TODO Auto-generated method stub
    }
	

	
	
}
