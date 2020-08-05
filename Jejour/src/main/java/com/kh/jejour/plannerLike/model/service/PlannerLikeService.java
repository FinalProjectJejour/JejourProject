package com.kh.jejour.plannerLike.model.service;

import com.kh.jejour.plannerLike.model.vo.PlannerLike;


public interface PlannerLikeService {
		// 만약 에러 결과등의 0, 1 들을 
		// 숫자 이외의 역활로 사용한다면
		// 직접 상수로 등록하여 실수로 
		// 숫자 계산에 포함되지 않도록 한다.
		
		static int PLANNER_LIKE_SERVICE_ERROR = 0;
		static int PLANNER_LIKE_SERVICE_COMPLETE = 1;	
		
		PlannerLike selectPlannerLike(PlannerLike plannerLike);

		int insertPlannerLike(PlannerLike plannerLike);

		int updateGood(PlannerLike plannerLike);

		int countLike(int pNo);

		int countUnLike(int pNo);
	
}
