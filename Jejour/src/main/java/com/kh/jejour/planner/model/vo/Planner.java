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
	private String title;
	private String describe;
	private String account;
	private String theme;
	private String filePath;
	private String status;

}
