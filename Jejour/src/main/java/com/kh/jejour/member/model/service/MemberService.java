package com.kh.jejour.member.model.service;

import com.kh.jejour.member.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member m);
	
	Member selectOne(String userId);
	
	int updateMember(Member m);
	
	int deleteMember (String userId);
	
	int checkIdDuplicate(String userId);

	int selectCheck(String userId);
	
}
