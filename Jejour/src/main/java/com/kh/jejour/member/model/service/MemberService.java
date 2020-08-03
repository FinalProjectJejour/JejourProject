package com.kh.jejour.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.jejour.member.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member m);
	
	Member selectOne(String userId);
	
	int updateMember(Member m);
	
	int deleteMember (String userId);
	
	int checkIdDuplicate(String userId);

	int selectCheck(String userId);

	int checkEmailDup(String email);
	
	List<Map<String, String>> selectMyPlanList(String userId, int cPage, int numPerPage);
	
	public int selectMyPlanTotalContents(String userId);
	
}
