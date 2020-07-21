package com.kh.jejour.visitCount.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VisitCount {
	
	private String todayVisit;
	private String totalVisit;
	private Date vDate;
}
