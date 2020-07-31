package com.kh.jejour.planner.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jejour.planner.model.dao.PlannerDAO;
import com.kh.jejour.planner.model.exception.PlannerException;
import com.kh.jejour.planner.model.vo.Attachment;
import com.kh.jejour.planner.model.vo.Planner;

@Service("plannerService")
public class PlannerServiceImpl implements PlannerService {
	
	@Autowired
	PlannerDAO plannerDAO;
	
	@Override
	public int insertAttachment(Planner planner, List<Attachment> attachList) {
		int result = 0;
		int pno = 0;

		try {
			System.out.println("good2-1");
			result = plannerDAO.insertPlanner(planner);
			System.out.println("good2-2");
			if (result == PLANNER_SERVICE_ERROR)
				throw new PlannerException();
			
			// pno = planner.getPNo();

			System.out.println("good3");
			
			if (attachList.size() > 0) {
				System.out.println("good4");
				for (Attachment a : attachList) {
					System.out.println("good5");
					
					//a.setPlannerNo(pno);
					
					result = plannerDAO.insertAttachment(a);
					System.out.println(result);
					if (result == PLANNER_SERVICE_ERROR) {
						System.out.println("good6");
						throw new PlannerException();
					}
				}
			}
		} catch (Exception e) {
//	         throw new BoardException("게시물등록오류");
			throw e;
		}
		return result;
	}
	
	@Override
	public int settingPlanner(Planner planner) {
		
		return plannerDAO.insertPlanner(planner);
	}
	
	@Override
	public Planner selectOnePlanner(int pNo) {
		
		return plannerDAO.selectOnePlanner(pNo);
	}

	@Override
	public int setStatus(Planner planner) {

		return plannerDAO.setStatus(planner);
		
	}

	@Override
	public Planner getThisPlanner(int pNo) {
		// TODO Auto-generated method stub
		return plannerDAO.getThisPlanner(pNo);
	}
	
	

	
}
