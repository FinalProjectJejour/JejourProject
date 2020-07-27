package com.kh.jejour.findUser.model.service;

import java.util.HashMap;
import java.util.Map;

import com.kh.jejour.member.model.vo.Member;

public interface FindUserService {

	String findUserId(Member m);
	
	int userPwdset(Member m);
		
}
