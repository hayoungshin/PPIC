package com.ppicachu.ppic.work.model.vo;

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

}
