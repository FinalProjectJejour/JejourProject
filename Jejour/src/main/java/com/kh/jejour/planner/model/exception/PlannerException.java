package com.kh.jejour.planner.model.exception;

public class PlannerException extends RuntimeException{

	public PlannerException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PlannerException(String message) {
		super("Planner 에러 발생 : " + message);
		
	}
}
