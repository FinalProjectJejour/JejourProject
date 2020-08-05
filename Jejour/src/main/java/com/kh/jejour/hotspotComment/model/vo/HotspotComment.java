package com.kh.jejour.hotspotComment.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HotspotComment {
	
	private int hcNo;
	private int hNo;
	private String userId;
	private	String hcWriter;
	private String hcContent;
	private Date hcDate;
	private int refhcNo;
	private int hcLevel;
	private int hcComment;//랭킹 담을 변수

}
