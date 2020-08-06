package com.kh.jejour.flashBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;
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
		System.out.println("FlashService 도착!");
		return flashDAO.selectOneFlashBoard(fNo);
	}

	@Override
	public int updateFlashBoard(FlashBoard flashboard) {
		System.out.println("FlashService 도착!");
		return flashDAO.updateFlashBoard(flashboard);
	}

	@Override
	public int deleteBoard(int fNo) {
		System.out.println("FlashService 도착!");
		return flashDAO.deleteBoard(fNo);
	}

	@Override
	public List<FlashBoard> search(HashMap<String, String> hmap, int cPage, int numPerPage) {
		System.out.println("FlashService 도착!");
		return flashDAO.search(hmap, cPage, numPerPage);
	}

	@Override
	public int selectFlashBoardSearchContents(HashMap<String, String> hmap) {
		System.out.println("FlashService 도착!");
		return flashDAO.selectFlashBoardSearchContents(hmap);
	}

	@Override
	public List<Map<String, String>> selectMyFlashBoardList(int cPage, int numPerPage, String userId) {
		System.out.println("FlashService 도착!");
		return flashDAO.selectMyFlashBoardList(cPage, numPerPage, userId);
	}

	@Override
	public int selectMyFlashBoardTotalContents(String userId) {
		System.out.println("FlashService 도착!");
		return flashDAO.selectMyFlashBoardTotalContents(userId);
	}

}
