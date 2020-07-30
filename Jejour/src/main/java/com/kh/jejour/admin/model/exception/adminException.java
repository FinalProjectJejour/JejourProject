package com.kh.jejour.admin.model.exception;

public class adminException extends RuntimeException {

	public adminException() {
		super();
		// TODO Auto-generated constructor stub
	}
	public adminException(String msg) {
		super("페이지 에러 발생 : " + msg);
		
	}
}
