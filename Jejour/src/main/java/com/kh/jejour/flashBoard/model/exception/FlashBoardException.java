package com.kh.jejour.flashBoard.model.exception;

public class FlashBoardException extends RuntimeException {

	public FlashBoardException() {
		super();
	}

	public FlashBoardException(String message) {
		super("FlashBoard 에러 발생 : " + message);
	}
	
	

}
