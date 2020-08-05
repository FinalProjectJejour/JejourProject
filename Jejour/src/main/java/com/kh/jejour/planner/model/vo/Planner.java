package com.kh.jejour.planner.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Planner {
   
	private int pNo;
	private String userId;
	private String pWriter;
	private String title;
	private String startDay;
	private String endDay;
	private String describe;
	private String account;
	private String theme;
	private String status;
	private int likeCount;
	private String renamedFileName;

}