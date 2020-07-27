package com.kh.jejour.hotspotBoard.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HotspotBoard implements Serializable{
	
	private static final long serialVersionUID = 4882L;
	
	private int hNo;
	private String userId;
	private String hTitle;
	private String hContent;
	private String hWriter;
	private int hCount;
	private Date hDate;
	private char hStatus;
	private String hPreview;

}
