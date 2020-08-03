package com.kh.jejour.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jejour.member.model.vo.Member;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMember(Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	@Override
	public Member selectOne(String userId) {
		
		return sqlSession.selectOne("memberMapper.loginMember", userId);
		
	}

	@Override
	public int updateMember(Member m) {

		return sqlSession.update("memberMapper.updateMember", m);
	}

	@Override
	public int deleteMember(String userId) {
		
		return sqlSession.delete("memberMapper.deleteMember",userId);
	}

	@Override
	public int checkIdDuplicate(HashMap<String, Object> hmap) {
		
		// 혼자 실행하고, 혼자 결과 가져오고
		sqlSession.selectOne("memberMapper.checkIdDuplicate", hmap);
		
		return (Integer)hmap.get("result");
	}

	@Override
	public int LoginCheck(HashMap<String, Object> hmap) {
		
		sqlSession.selectOne("memberMapper.loginCheck", hmap);
			
		return (Integer)hmap.get("result");
	}

	@Override
	public int emailDupCheck(HashMap<String, Object> hmap) {
		sqlSession.selectOne("memberMapper.emailDupCheck", hmap);
		
		return (Integer)hmap.get("result");
	}

	@Override
	public List<Map<String, String>> selectMyPlanList(String userId, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("myPlanMapper.selectMyPlanList", userId, rows);
		
	}

	@Override
	public int selectMyPlanTotalContents(String userId) {
		
		return sqlSession.selectOne("myPlanMapper.selectMyPlanTotalContents");
		
	}

}
