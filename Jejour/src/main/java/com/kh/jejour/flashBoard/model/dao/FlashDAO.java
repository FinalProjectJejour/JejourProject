package com.kh.jejour.flashBoard.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.jejour.flashBoard.model.vo.FlashBoard;

public interface FlashDAO {
	
	List<Map<String, String>> selectFlashBoardList(int cPage, int numPerPage);

	int selectFlashBoardTotalContents();

	int insertFlashBoard(FlashBoard flashBoard);
	
	FlashBoard selectOneFlashBoard(int fNo);
	
	int updateFlashBoard(FlashBoard flashboard);
	   
	int deleteBoard(int fNo);
	
	List<FlashBoard> search(HashMap<String, String> hmap, int cPage, int numPerPage);
	
	int selectFlashBoardSearchContents(HashMap<String, String> hmap);
	
	List<Map<String, String>> selectMyFlashBoardList(int cPage, int numPerPage, String userId);
	
	int selectMyFlashBoardTotalContents(String userId);
}
