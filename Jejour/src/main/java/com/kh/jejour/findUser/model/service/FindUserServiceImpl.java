package com.kh.jejour.findUser.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jejour.findUser.model.dao.FindUserDAO;
import com.kh.jejour.member.model.vo.Member;

@Service
public class FindUserServiceImpl implements FindUserService {

	@Autowired
	FindUserDAO FindUserDAO;
	
	
	@Override
	public String findUserId(Member m) {
		
		return FindUserDAO.findUserId(m);
	
	}

	@Override
	public int userPwdset(Member m) {	
		
	return FindUserDAO.userPwdset(m);
	
	}

}
