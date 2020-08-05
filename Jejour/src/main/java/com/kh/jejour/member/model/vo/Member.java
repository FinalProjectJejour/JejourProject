package com.kh.jejour.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {

	private String userId;
	private String userName;
	private String userPwd;
	private char gender;
	private String phone;
	private String email;
	private String address;
	private int mCount; //총회원수 담을 변수


	// 아이디 찾기
	public Member(String userName, String email) {
		super();
		this.userName = userName;
		this.email = email;
	}




}
