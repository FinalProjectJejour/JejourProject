package com.kh.jejour.member.model.dao;

import java.util.HashMap;

import com.kh.jejour.member.model.vo.Member;

public interface MemberDAO {
	
	// 인터페이스에서 public은 생략 가능
	int insertMember(Member m);
	
	Member selectOne(String userId);
	
	int updateMember(Member m);
	
	int deleteMember(String userId);
	
	int checkIdDuplicate(HashMap<String, Object> hmap);

	int LoginCheck(HashMap<String, Object> hmap);

	int emailDupCheck(HashMap<String, Object> hmap);
	

}
