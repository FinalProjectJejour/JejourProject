package com.kh.jejour.visitCount.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jejour.visitCount.model.dao.VisitCountDAO;
import com.kh.jejour.visitCount.model.vo.VisitCount;

@Service("visitService")
public class VisitCountServiceImpl implements VisitCountService {

	@Autowired
	VisitCountDAO visitCountDAO;
	
	@Override
	public int visitCounter(VisitCount vi) {
		return visitCountDAO.visitCounter(vi);
	}

}
