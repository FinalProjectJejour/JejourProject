package com.kh.jejour.flashBoard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor 
public class FlashBoard {
	
	private int fNo;
	private String userId;
	private String fTitle;
	private char fGender;
	private int fPeople;
	private Date fMeetDate;
	private String fMeetTime;
	private String fContent;
	private int fCount;
	private String fWriter;
	private Date fDate;
	private String fMapTitle;
	private Double fMapX;
	private Double fMapY;
	private char fStatus;
	
	private int commentCount;

}
