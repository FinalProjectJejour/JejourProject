package com.kh.jejour.findUser.model.dao;

import java.util.HashMap;
import java.util.Map;

import com.kh.jejour.member.model.vo.Member;

public interface FindUserDAO {
	
	String findUserId(Member m);
	
	int userPwdset(Member m);
}
