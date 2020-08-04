package com.kh.jejour.visitCount.model.dao;

import java.util.List;

import com.kh.jejour.visitCount.model.vo.VisitCount;

public interface VisitCountDAO {
	
	public int visitCounter(String visitId);
	
	public List<VisitCount> selectAllVisitCount();
	
	public List<VisitCount> selectMonth();
	
	public List<VisitCount> selectBMonth();
	
	public List<VisitCount> selectBBMonth();
	
	public List<VisitCount> selectBBBMonth();
	
	public List<VisitCount> selectBBBBMonth();
	
	public List<VisitCount> selectBBBBBMonth();

	
}
