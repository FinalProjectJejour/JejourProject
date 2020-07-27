package com.kh.jejour.member.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jejour.member.model.dao.MemberDAO;
import com.kh.jejour.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	
	@Override
	public int insertMember(Member m) {
		
		return memberDAO.insertMember(m);
	}

	@Override
	public Member selectOne(String userId) {
	
		return memberDAO.selectOne(userId);
	}

	@Override
	public int updateMember(Member m) {
		
		return memberDAO.updateMember(m);
	}

	@Override
	public int deleteMember(String userId) {
		
		return memberDAO.deleteMember(userId);
	}

	@Override
	public int checkIdDuplicate(String userId) {
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("userId", userId);
		
		
		return memberDAO.checkIdDuplicate(hmap);
	}

	@Override
	public int selectCheck(String userId) {
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("userId", userId);
		
		return memberDAO.LoginCheck(hmap);
	}

	@Override
	public int checkEmailDup(String email) {
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("email", email);
		
		return memberDAO.emailDupCheck(hmap);
	}

}
