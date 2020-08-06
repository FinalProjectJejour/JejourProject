package com.kh.jejour.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.jejour.member.model.vo.Member;
import com.kh.jejour.visitCount.model.dao.VisitCountDAO;

public class VisitCountInterceptor extends HandlerInterceptorAdapter{
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	VisitCountDAO visitDAO;
	
	@RequestMapping(method = RequestMethod.POST)
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Member m = (Member)session.getAttribute("member");
		System.out.println("방문자수up");
		String userId = m.getUserId();
		
		visitDAO.visitCounter(userId);
		
		
			
	    response.sendRedirect("/jejour/intro/main.do");
		
		
		
	      
	     
	      
		
		
		
	}

}
