package com.kh.jejour.topN.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TopN implements Serializable{
	
	private static final long serialVersionUID = 54332L;
	
	private String mapTitle;
	private int count;

}
