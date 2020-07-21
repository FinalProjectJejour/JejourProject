package com.kh.jejour.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	
	private String userId;
	private String name;
	private String userPwd;
	private String rrn;
	private String phone;
	private String email;
	private String address;

}
