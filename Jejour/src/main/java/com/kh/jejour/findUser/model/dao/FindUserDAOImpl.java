package com.kh.jejour.findUser.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jejour.member.model.vo.Member;

@Repository
public class FindUserDAOImpl implements FindUserDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public String findUserId(Member m) {
			
		return sqlSession.selectOne("findUserMapper.findUserId", m);
	}

	@Override
	public int userPwdset(Member m) {
	
		return sqlSession.update("findUserMapper.userPwdset", m);

	}

}
