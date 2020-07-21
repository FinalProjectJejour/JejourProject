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
	private String hcContent;
	private Date hcDate;
	private int refhcNo;
	private int hcLevel;

}
