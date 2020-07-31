package com.kh.jejour.plannerPart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jejour.planner.model.exception.PlannerException;
import com.kh.jejour.planner.model.vo.Attachment;
import com.kh.jejour.planner.model.vo.Planner;
import com.kh.jejour.plannerPart.model.dao.PlannerPartDAO;
import com.kh.jejour.plannerPart.model.vo.PlannerPart;

@Service("plannerPartService")
public class PlannerPartServiceImpl implements PlannerPartService {
	
	@Autowired
	PlannerPartDAO plannerPartDAO;
	
	/*
	@Override
	public int insertAttachment(Planner planner, List<Attachment> attachList) {
		int result = 0;
		int pno = 0;

		try {
			result = plannerDAO.insertPlanner(planner);
			if (result == PLANNER_PART_SERVICE_ERROR)
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
					if (result == PLANNER_PART_SERVICE_ERROR) {
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
	public Planner selectOnePlanner(int pNo) {
		
		return plannerDAO.selectOnePlanner(pNo);
	}
	*/
	@Override
	public int settingPlanner(PlannerPart plannerPart) {
		// TODO Auto-generated method stub
		return plannerPartDAO.settingPlan(plannerPart);
	}

	@Override
	public List<PlannerPart> selectPlanList(int pNo) {
		// TODO Auto-generated method stub
		return plannerPartDAO.selectPlanList(pNo);
	}

	@Override
	public int deletePlanner(int ppNo) {
		// TODO Auto-generated method stub
		return plannerPartDAO.deletePlan(ppNo);
	}

	

	
}
