package com.kh.jejour.plannerPart.model.exception;

public class PlannerPartException extends RuntimeException{

	public PlannerPartException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PlannerPartException(String message) {
		super("Planner 에러 발생 : " + message);
		
	}
}
