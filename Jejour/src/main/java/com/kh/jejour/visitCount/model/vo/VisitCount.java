package com.kh.jejour.visitCount.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VisitCount {
	
	private int visitNum;
	private String visitIp;
	private int vDate;
}
