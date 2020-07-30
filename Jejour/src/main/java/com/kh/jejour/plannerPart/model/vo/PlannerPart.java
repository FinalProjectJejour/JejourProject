package com.kh.jejour.plannerPart.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PlannerPart {
	
	private int ppNo;
	private int pNo;
	private String startTime;
	private String endTime;
	private String mapTitle;
	private String category;
	private String mapX;
	private String mapY;
	private String money;
	private String reason;

}
