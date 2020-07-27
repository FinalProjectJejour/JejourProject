package com.kh.jejour.planner.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // lombok을 활용한 getter, setter 자동 추가 어노테이션
@AllArgsConstructor // 전체 매개변수 받는 생성자 자동 생성 어노테이션 -> 추가하면서 기본 생성자를 없애버림
@NoArgsConstructor //기본 생성자용
// @Getter / @Setter 로 각각 선택하여 추가 할 수도 있다.
public class Attachment implements Serializable {
	
	private static final long SerialVersionUID=4885;

	private int attachmentNo;
	private int plannerNo;
	private String originalFileName;
	private String renamedFileName;
	private Date uploadDate;
	private int downloadCount;
	private String status;


}
