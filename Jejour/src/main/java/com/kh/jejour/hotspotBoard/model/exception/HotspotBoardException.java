package com.kh.jejour.hotspotBoard.model.exception;

import lombok.AllArgsConstructor;


public class HotspotBoardException extends RuntimeException {
	
	public HotspotBoardException() {
		super();
	}
	
	public HotspotBoardException(String message) {
		super("HotspotBoard 에러 발생 " + message);
	}
	

}
