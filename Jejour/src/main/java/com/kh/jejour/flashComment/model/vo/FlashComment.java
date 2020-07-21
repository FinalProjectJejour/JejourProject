package com.kh.jejour.flashComment.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FlashComment {
	
	private int fcNo;
	private int fNo;
	private String userId;
	private String fcContent;
	private Date fcDate;
	private int reffcNo;
	private int fcLevel;

}
