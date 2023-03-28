package com.ppicachu.ppic.work.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Work {
	
	private int workNo;
	private int userNo;
	private String userName;
	private String workDate;
	private String workIn;
	private String workOut;
	private String workTime;
	private String status;
	
	private String absenteeism;
	private String leavearly;
	private String behindtime;
	
	// calendar 관련
	private String title;
	private String start;
	private String end;
	
	
	// 채팅관련
	private int connSta;

}
