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
	
	
	// 회원정보 수정용 생성자
	public Member(String userPwd, String phone, String email, String address) {
		super();
		this.userPwd = userPwd;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}


	
	
	
	

}
