package com.kh.jejour.hotspotLike.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HotspotLike implements Serializable{
	

	private static final long serialVersionUID = 475295772L;
	
	private int hNo;
	private String userId;
	private char good;
	
}
