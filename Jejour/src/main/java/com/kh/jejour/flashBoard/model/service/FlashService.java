package com.kh.jejour.flashBoard.model.service;

import java.util.List;
import java.util.Map;

import com.kh.jejour.flashBoard.model.vo.FlashBoard;

public interface FlashService {
	
	List<Map<String, String>> selectFlashBoardList(int cPage, int numPerPage);

	int selectFlashBoardTotalContents();

	int insertFlashBoard(FlashBoard flashBoard);

	FlashBoard selectOneFlashBoard(int fNo);

	int updateFlashBoard(FlashBoard flashboard);
   
	int deleteBoard(int fNo);
	
}
