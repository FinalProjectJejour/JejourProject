package com.kh.jejour.flashBoard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jejour.flashBoard.model.dao.FlashDAO;
import com.kh.jejour.flashBoard.model.vo.FlashBoard;

@Service("flashService")
public class FlashServiceImpl implements FlashService {

	@Autowired
	FlashDAO flashDAO;
	
	@Override
	public List<Map<String, String>> selectFlashBoardList(int cPage, int numPerPage) {
		System.out.println("FlashService 도착!");
		return flashDAO.selectFlashBoardList(cPage, numPerPage);
	}

	@Override
	public int selectFlashBoardTotalContents() {
		System.out.println("FlashService 도착!");
		return flashDAO.selectFlashBoardTotalContents();
	}

	@Override
	public int insertFlashBoard(FlashBoard flashBoard) {
		System.out.println("FlashService 도착!");
		return flashDAO.insertFlashBoard(flashBoard);
	}

	@Override
	public FlashBoard selectOneFlashBoard(int fNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateFlashBoard(FlashBoard flashboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int fNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
