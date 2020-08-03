package com.kh.jejour.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	List<Map<String, String>> selectMyPlanList(String userId, int cPage, int numPerPage);
	
	public int selectMyPlanTotalContents(String userId);

}
